// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {AuctionsBase} from "./AuctionsBase.sol";
import {Auction} from "../types/Auction.sol";
import {Asset} from "../types/Asset.sol";
import {Config} from "../types/Config.sol";

contract AuctionsStorage is AuctionsBase {
    event CreatedAuction(uint256 indexed auctionId, address indexed creator);
    event CanceledAuction(uint256 indexed auctionId);
    event PlacedBid(uint256 indexed auctionId, address indexed bidder, uint256 amount);

    function _createAuction(address creator, Asset memory asset, Config memory config) internal virtual {
        _new(Auction({creator: creator, highestBid: 0, highestBidder: address(0), asset: asset, config: config}));
        emit CreatedAuction(0, address(0));
    }

    function _cancelAuction(uint256 auctionId) internal virtual {
        _remove(auctionId);
        emit CanceledAuction(auctionId);
    }

    function _placeBid(uint256 auctionId, uint256 amount) internal virtual {
        Auction memory auction = _get(auctionId);
        auction.highestBid = amount;
        auction.highestBidder = _msgSender();
        _update(auctionId, auction);
        emit PlacedBid(auctionId, _msgSender(), amount);
    }
}
