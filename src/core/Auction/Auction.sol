// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Context} from "@openzeppelin/contracts/utils/Context.sol";
import {ERC165} from "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {ICollection} from "src/core/Collection/ICollection.sol";
import {Counters} from "src/utils/Counters.sol";

contract Auction is Context, ERC165 {
    using Counters for Counters.Counter;

    struct Params {
        address creator;
        uint256 highestBid;
        address highestBidder;
        Asset asset;
        Config config;
    }

    struct Config {
        IERC20 token;
        uint256 beginBid;
        uint256 minBidStep;
        uint256 startedAt;
        uint256 finishedAt;
    }

    struct Asset {
        ICollection collection;
        uint256[] ids;
        uint256[] values;
    }

    Counters.Counter private _counter;
    mapping(uint256 id => Params params) private _auctions;

    event CreatedAuction(uint256 indexed auctionId, address indexed creator);
    event CanceledAuction(uint256 indexed auctionId);
    event PlacedBid(uint256 indexed auctionId, address indexed bidder, uint256 amount);

    function createAuction(address creator, Asset memory asset, Config memory config) external {
        _auctions[_counter.next()] =
            Params({creator: creator, highestBid: 0, highestBidder: address(0), asset: asset, config: config});

        emit CreatedAuction(_counter.current(), _msgSender());
    }

    // function finishAuction(uint256 auctionId) external {}

    function cancelAuction(uint256 auctionId) external {
        require(_auctions[auctionId].creator == _msgSender());

        emit CanceledAuction(auctionId);
    }

    function placeBid(uint256 auctionId, uint256 amount) external {
        Params storage auction = _auctions[auctionId];

        require(auction.config.token.balanceOf(_msgSender()) >= amount);
        require(auction.config.token.allowance(_msgSender(), address(this)) >= amount);
        require(auction.highestBid + auction.config.minBidStep <= amount, "");

        auction.highestBid = amount;
        auction.highestBidder = _msgSender();

        emit PlacedBid(auctionId, _msgSender(), amount);
    }

    function claimPossession(uint256 auctionId) external {
        Params storage auction = _auctions[auctionId];

        require(auction.config.finishedAt < block.timestamp);
        require(auction.highestBidder == _msgSender());

        auction.asset.collection.safeBatchTransferFrom(
            address(this), _msgSender(), auction.asset.ids, auction.asset.values, "0x0"
        );

        auction.config.token.transferFrom(_msgSender(), auction.creator, auction.highestBid);

        delete _auctions[auctionId];
    }
}
