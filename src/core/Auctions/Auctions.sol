// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {AuctionsNotifiers} from "./core/AuctionsNotifiers.sol";

contract Auctions is AuctionsNotifiers {
    function createAuction(address creator, Asset memory asset, Config memory config) public virtual {
        _createAuction(creator, asset, config);
    }

    function cancelAuction(uint256 auctionId) public virtual {
        _cancelAuction(auctionId);
    }

    function placeBid(uint256 auctionId, uint256 amount) public virtual {
        _placeBid(auctionId, amount);
    }
}

// import {Context} from "src/commom/Context/Context.sol";
// import {SupportInterfaces} from "src/commom/SupportInterfaces/SupportInterfaces.sol";

// import {IAuction} from "./IAuction.sol";

// contract Auction is
//     SupportInterfaces,
//     Context // IAuction
// {
//     using Counters for Counters.Counter;

//     struct AuctionStorage {
//         Counters.Counter counter;
//         mapping(uint256 id => Details details) auctions;
//     }

//     function createAuction(address creator, Asset memory asset, Config memory config) external {
//         _auctions[_counter.next()] =
//             Details({creator: creator, highestBid: 0, highestBidder: address(0), asset: asset, config: config});

//         asset.collection.safeBatchTransferFrom(msg.sender, address(this), asset.ids, asset.values, "0x0");

//         emit CreatedAuction(_counter.current(), _msgSender());
//     }

//     function cancelAuction(uint256 auctionId) external {
//         require(_auctions[auctionId].creator == _msgSender());

//         emit CanceledAuction(auctionId);
//     }

//     function placeBid(uint256 auctionId, uint256 amount) external {
//         Details storage auction = _auctions[auctionId];

//         require(auction.config.token.balanceOf(_msgSender()) >= amount);
//         require(auction.config.token.allowance(_msgSender(), address(this)) >= amount);
//         require(auction.highestBid + auction.config.minBidStep <= amount, "");

//         auction.highestBid = amount;
//         auction.highestBidder = _msgSender();

//         emit PlacedBid(auctionId, _msgSender(), amount);
//     }

//     function claimPossession(uint256 auctionId) external {
//         Details storage auction = _auctions[auctionId];

//         require(auction.config.finishedAt < block.timestamp);
//         require(auction.highestBidder == _msgSender());

//         auction.asset.collection.safeBatchTransferFrom(
//             address(this), _msgSender(), auction.asset.ids, auction.asset.values, "0x0"
//         );

//         auction.config.token.transferFrom(_msgSender(), auction.creator, auction.highestBid);

//         delete _auctions[auctionId];
//     }
// }
