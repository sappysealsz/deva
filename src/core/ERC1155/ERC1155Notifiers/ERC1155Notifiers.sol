// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {ERC1155Base} from "src/core/ERC1155/ERC1155Base/ERC1155Base.sol";
import {IERC1155Notifiers} from "src/core/ERC1155/ERC1155Notifiers/IERC1155Notifiers.sol";

abstract contract ERC1155Notifiers is ERC1155Base {
    using EnumerableSet for EnumerableSet.AddressSet;

    EnumerableSet.AddressSet internal _notifiers;

    function hasNotifier(address notifier) public view virtual returns (bool) {
        return _notifiers.contains(notifier);
    }

    function addNotifier(address notifier) public virtual {
        _notifiers.add(notifier);
    }

    function removeNotifier(address notifier) public virtual {
        _notifiers.remove(notifier);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155Base) returns (bool) {
        return interfaceId == type(IERC1155Notifiers).interfaceId;
    }
}
