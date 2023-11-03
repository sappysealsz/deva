// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {EnumerableSet} from "openzeppelin/utils/structs/EnumerableSet.sol";

import {ERC20Base} from "../ERC20Base/ERC20Base.sol";
import {IERC20Notifiers} from "./IERC20Notifiers.sol";

abstract contract ERC20Notifiers is ERC20Base {
    using EnumerableSet for EnumerableSet.AddressSet;

    bytes32 public constant MANAGER_ROLE = keccak256("MANAGER_ROLE");

    EnumerableSet.AddressSet internal _notifiers;

    function hasNotifier(address notifier) public view virtual returns (bool) {
        return _notifiers.contains(notifier);
    }

    function addNotifier(address notifier) public virtual onlyRole(MANAGER_ROLE) {
        _notifiers.add(notifier);
    }

    function removeNotifier(address notifier) public virtual onlyRole(MANAGER_ROLE) {
        _notifiers.remove(notifier);
    }

    // function supportsInterface(bytes4 interfaceId) public view virtual override(ERC20Base) returns (bool) {
    //     return interfaceId == type(IERC20Notifiers).interfaceId;
    // }
}
