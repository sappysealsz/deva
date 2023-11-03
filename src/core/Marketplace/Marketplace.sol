// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {AccessControlDefaultAdminRules} from "openzeppelin/access/extensions/AccessControlDefaultAdminRules.sol";
import {EnumerableSet} from "openzeppelin/utils/structs/EnumerableSet.sol";

import {Currencies} from "./Currencies.sol";
import {Collections} from "./Collections.sol";

contract Marketplace is Currencies, Collections, AccessControlDefaultAdminRules {
    constructor() AccessControlDefaultAdminRules(1 days, _msgSender()) {}

    function hasCurrency(address currency) external view returns (bool) {
        return _hasCurrency(currency);
    }

    function createCurrency(string memory name, string memory symbol) public virtual {
        _createCurrency(_msgSender(), name, symbol);
    }

    function addCurrency(address currency) public virtual onlyRole(DEFAULT_ADMIN_ROLE) {
        _addCurrency(currency);
    }

    function removeCurrency(address currency) public virtual onlyRole(DEFAULT_ADMIN_ROLE) {
        _removeCurrency(currency);
    }

    function hasCollection(address collection) external view returns (bool) {
        return _hasCollection(collection);
    }

    function createCollection(string memory name, string memory uri) public virtual {
        _createCollection(_msgSender(), name, uri);
    }

    function addCollection(address collection) public virtual onlyRole(DEFAULT_ADMIN_ROLE) {
        _addCollection(collection);
    }

    function removeCollection(address collection) public virtual onlyRole(DEFAULT_ADMIN_ROLE) {
        _removeCollection(collection);
    }
}
