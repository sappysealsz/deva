// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnPlaceBid} from "./IOnPlaceBid.sol";

abstract contract OnPlaceBid is IOnPlaceBid {
    function onPlaceBid(uint256 auctionId, uint256 amount) public virtual;
}
