// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IOnSafeBurn {
    function onSafeBurn(address owner, uint256 id, uint256 value) external;
}
