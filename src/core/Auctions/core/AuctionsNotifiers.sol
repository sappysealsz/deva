// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {EnumerableSet} from "openzeppelin/utils/structs/EnumerableSet.sol";

import {ISupportInterfaces} from "src/common/SupportInterfaces/ISupportInterfaces.sol";

import {AuctionsHooks} from "./AuctionsHooks.sol";
import {IOnCreateAuction} from "../notifications/OnCreateAuction/IOnCreateAuction.sol";
import {IOnCancelAuction} from "../notifications/OnCancelAuction/IOnCancelAuction.sol";
import {IOnPlaceBid} from "../notifications/OnPlaceBid/IOnPlaceBid.sol";

contract AuctionsNotifiers is AuctionsHooks {
    using EnumerableSet for EnumerableSet.AddressSet;

    EnumerableSet.AddressSet private _beforeNotifiers;
    EnumerableSet.AddressSet private _afterNotifiers;

    function _hasBeforeNotifier(address beforeNotifier) internal view virtual returns (bool) {
        _beforeNotifiers.contains(beforeNotifier);
    }

    function _addBeforeNotifier(address beforeNotifier) internal virtual {
        _beforeNotifiers.add(beforeNotifier);
    }

    function _removeBeforeNotifier(address beforeNotifier) internal virtual {
        _beforeNotifiers.remove(beforeNotifier);
    }

    function _hasAfterNotifier(address afterNotifier) internal view virtual returns (bool) {
        _afterNotifiers.contains(afterNotifier);
    }

    function _addAfterNotifier(address afterNotifier) internal virtual {
        _afterNotifiers.add(afterNotifier);
    }

    function _removeAfterNotifier(address afterNotifier) internal virtual {
        _afterNotifiers.remove(afterNotifier);
    }

    function _beforeCreateAuction(address creator, Asset memory asset, Config memory config)
        internal
        virtual
        override
    {
        for (uint256 i = 0; i < _beforeNotifiers.length(); i++) {
            if (ISupportInterfaces(_beforeNotifiers.at(i)).supportInterface(type(IOnCreateAuction).interfaceId)) {
                // IOnCreateAuction(_beforeNotifiers.at(i)).onCreateAuction(creator, asset, config);
            }
        }
    }

    function _afterCreateAuction(address creator, Asset memory asset, Config memory config) internal virtual override {
        for (uint256 i = 0; i < _afterNotifiers.length(); i++) {
            if (ISupportInterfaces(_afterNotifiers.at(i)).supportInterface(type(IOnCreateAuction).interfaceId)) {
                // IOnCreateAuction(_afterNotifiers.at(i)).onCreateAuction(creator, asset, config);
            }
        }
    }

    function _beforeCancelAuction(uint256 auctionId) internal virtual override {
        for (uint256 i = 0; i < _beforeNotifiers.length(); i++) {
            if (ISupportInterfaces(_beforeNotifiers.at(i)).supportInterface(type(IOnCancelAuction).interfaceId)) {
                IOnCancelAuction(_beforeNotifiers.at(i)).onCancelAuction(auctionId);
            }
        }
    }

    function _afterCancelAuction(uint256 auctionId) internal virtual override {
        for (uint256 i = 0; i < _afterNotifiers.length(); i++) {
            if (ISupportInterfaces(_afterNotifiers.at(i)).supportInterface(type(IOnCancelAuction).interfaceId)) {
                IOnCancelAuction(_afterNotifiers.at(i)).onCancelAuction(auctionId);
            }
        }
    }

    function _beforePlaceBid(uint256 auctionId, uint256 amount) internal virtual override {
        for (uint256 i = 0; i < _beforeNotifiers.length(); i++) {
            if (ISupportInterfaces(_beforeNotifiers.at(i)).supportInterface(type(IOnPlaceBid).interfaceId)) {
                IOnPlaceBid(_beforeNotifiers.at(i)).onPlaceBid(auctionId);
            }
        }
    }

    function _afterPlaceBid(uint256 auctionId, uint256 amount) internal virtual override {
        for (uint256 i = 0; i < _afterNotifiers.length(); i++) {
            if (ISupportInterfaces(_afterNotifiers.at(i)).supportInterface(type(IOnPlaceBid).interfaceId)) {
                IOnPlaceBid(_afterNotifiers.at(i)).onPlaceBid(auctionId);
            }
        }
    }
}
