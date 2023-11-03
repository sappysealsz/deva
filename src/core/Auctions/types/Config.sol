// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ICurrency} from "../../Currency/ICurrency.sol";

struct Config {
    ICurrency token;
    uint256 beginBid;
    uint256 minBidStep;
    uint256 startedAt;
    uint256 finishedAt;
}
