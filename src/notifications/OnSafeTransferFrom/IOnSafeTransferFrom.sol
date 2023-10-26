// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IOnSafeTransferFrom {
    function onSafeTransferFrom(address from, address to, uint256 id, uint256 value, bytes memory data) external;
}
