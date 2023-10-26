// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IOnSafeMint {
    function onSafeMint(address owner, uint256 id, uint256 value, bytes memory data) external;
}
