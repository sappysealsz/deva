// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Context} from "src/common/Context/Context.sol";
import {Counters} from "src/utils/Counters.sol";
import {ICurrency} from "../../Currency/ICurrency.sol";
import {ICollection} from "../../Collection/ICollection.sol";
import {Auction} from "../types/Auction.sol";

contract AuctionsBase is Context {
    using Counters for Counters.Counter;

    Counters.Counter private _counter;
    mapping(uint256 id => Auction auction) private _auctions;

    function _get(uint256 auctionId) internal view returns (Auction storage) {
        return _auctions[auctionId];
    }

    function _new(Auction memory auction) internal virtual {
        _auctions[_counter.next()] = auction;
    }

    function _update(uint256 id, Auction memory auction) internal virtual {
        _auctions[id] = auction;
    }

    function _remove(uint256 id) internal virtual {
        delete _auctions[id];
    }
}
