// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Asset} from "./Asset.sol";
import {Config} from "./Config.sol";

struct Auction {
    address creator;
    uint256 highestBid;
    address highestBidder;
    Asset asset;
    Config config;
}
