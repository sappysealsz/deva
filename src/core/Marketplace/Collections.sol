// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Context} from "openzeppelin/utils/Context.sol";
import {EnumerableSet} from "openzeppelin/utils/structs/EnumerableSet.sol";

import {Collection} from "../Collection/Collection.sol";

abstract contract Collections is Context {
    using EnumerableSet for EnumerableSet.AddressSet;

    EnumerableSet.AddressSet private _collections;

    event CreatedCollection(address indexed collection, address indexed sender);
    event AddedCollection(address indexed collection, address indexed sender);
    event RemovedCollection(address indexed collection, address indexed sender);

    error CollectionAlreadyIsExists();
    error CollectionAlreadyIsNotExists();

    function _hasCollection(address collection) internal view returns (bool) {
        return _collections.contains(collection);
    }

    function _createCollection(address admin, string memory name, string memory uri) internal {
        address collection = address(new Collection(admin, name, uri));

        _collections.add(collection);
        emit CreatedCollection(collection, _msgSender());
    }

    function _addCollection(address collection) internal {
        if (!_collections.contains(collection)) {
            revert CollectionAlreadyIsExists();
        }

        _collections.add(collection);
        emit AddedCollection(collection, _msgSender());
    }

    function _removeCollection(address collection) internal {
        if (_collections.contains(collection)) {
            revert CollectionAlreadyIsNotExists();
        }

        _collections.remove(collection);
        emit RemovedCollection(collection, _msgSender());
    }
}
