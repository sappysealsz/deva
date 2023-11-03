// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Context} from "openzeppelin/utils/Context.sol";
import {EnumerableSet} from "openzeppelin/utils/structs/EnumerableSet.sol";

import {Currency} from "../Currency/Currency.sol";

abstract contract Currencies is Context {
    using EnumerableSet for EnumerableSet.AddressSet;

    EnumerableSet.AddressSet private _currencies;

    event CreatedCurrency(address indexed currency, address indexed sender);
    event AddedCurrency(address indexed currency, address indexed sender);
    event RemovedCurrency(address indexed currency, address indexed sender);

    error CurrencyAlreadyIsExists();
    error CurrencyAlreadyIsNotExists();

    function _hasCurrency(address currency) internal view returns (bool) {
        return _currencies.contains(currency);
    }

    function _createCurrency(address admin, string memory name, string memory uri) internal {
        address currency = address(new Currency(admin, name, uri));

        _currencies.add(currency);
        emit CreatedCurrency(currency, _msgSender());
    }

    function _addCurrency(address currency) internal {
        if (!_currencies.contains(currency)) {
            revert CurrencyAlreadyIsExists();
        }

        _currencies.add(currency);
        emit AddedCurrency(currency, _msgSender());
    }

    function _removeCurrency(address currency) internal {
        if (_currencies.contains(currency)) {
            revert CurrencyAlreadyIsNotExists();
        }

        _currencies.remove(currency);
        emit RemovedCurrency(currency, _msgSender());
    }
}
