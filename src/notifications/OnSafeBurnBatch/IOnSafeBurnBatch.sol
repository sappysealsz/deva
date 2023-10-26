// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IOnSafeBurnBatch {
    function onSafeBurnBatch(address owner, uint256[] memory ids, uint256[] memory values) external;
}
