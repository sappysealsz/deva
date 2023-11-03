// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {AuctionsStorage} from "./AuctionsStorage.sol";

contract AuctionsHooks is AuctionsStorage {
    function _createAuction(address creator, Asset memory asset, Config memory config) internal virtual override {
        _beforeCreateAuction(creator, asset, config);
        super._createAuction(creator, asset, config);
        _afterCreateAuction(creator, asset, config);
    }

    function _beforeCreateAuction(address creator, Asset memory asset, Config memory config) internal virtual {}

    function _afterCreateAuction(address creator, Asset memory asset, Config memory config) internal virtual {}

    function _cancelAuction(uint256 auctionId) internal virtual override {
        _beforeCancelAuction(auctionId);
        super._cancelAuction(auctionId);
        _afterCancelAuction(auctionId);
    }

    function _beforeCancelAuction(uint256 auctionId) internal virtual {}

    function _afterCancelAuction(uint256 auctionId) internal virtual {}

    function _placeBid(uint256 auctionId, uint256 amount) internal virtual override {
        _beforePlaceBid(auctionId, amount);
        super._placeBid(auctionId, amount);
        _afterPlaceBid(auctionId, amount);
    }

    function _beforePlaceBid(uint256 auctionId, uint256 amount) internal virtual {}

    function _afterPlaceBid(uint256 auctionId, uint256 amount) internal virtual {}
}
