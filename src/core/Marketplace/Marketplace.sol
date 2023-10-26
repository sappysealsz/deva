// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {AccessControlDefaultAdminRules} from
    "@openzeppelin/contracts/access/extensions/AccessControlDefaultAdminRules.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {Collection} from "src/core/Collection/Collection.sol";

contract Marketplace is AccessControlDefaultAdminRules {
    using EnumerableSet for EnumerableSet.AddressSet;

    EnumerableSet.AddressSet private _collections;

    event CreatedCollection(address indexed collection, address indexed sender);
    event AddedCollection(address indexed collection, address indexed sender);
    event RemovedCollection(address indexed collection, address indexed sender);

    error CollectionAlreadyIsExists();
    error CollectionAlreadyIsNotExists();

    constructor() AccessControlDefaultAdminRules(1 days, _msgSender()) {}

    function hasCollection(address collection) external view returns (bool) {
        return _collections.contains(collection);
    }

    function createCollection(string memory name, string memory uri) external {
        address collection = address(new Collection(_msgSender(), name, uri));

        _collections.add(collection);
        emit CreatedCollection(collection, _msgSender());
    }

    function addCollection(address collection) external onlyRole(DEFAULT_ADMIN_ROLE) {
        if (!_collections.contains(collection)) {
            revert CollectionAlreadyIsExists();
        }

        _collections.add(collection);
        emit AddedCollection(collection, _msgSender());
    }

    function removeCollection(address collection) external onlyRole(DEFAULT_ADMIN_ROLE) {
        if (_collections.contains(collection)) {
            revert CollectionAlreadyIsNotExists();
        }

        _collections.remove(collection);
        emit RemovedCollection(collection, _msgSender());
    }
}
