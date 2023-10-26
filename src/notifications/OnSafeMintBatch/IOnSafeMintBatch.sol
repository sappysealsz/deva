// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IOnSafeMintBatch {
    function onSafeMintBatch(address owner, uint256[] memory ids, uint256[] memory values, bytes memory data)
        external;
}
