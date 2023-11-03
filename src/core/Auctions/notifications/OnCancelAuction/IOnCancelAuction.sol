// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IOnCancelAuction {
    function onCancelAuction(uint256 auctionId) external;
}
