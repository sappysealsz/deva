// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IOnPlaceBid {
    function onPlaceBid(uint256 auctionId, uint256 amount) external;
}
