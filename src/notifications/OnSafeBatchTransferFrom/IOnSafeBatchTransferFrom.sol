// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IOnSafeBatchTransferFrom {
    function onSafeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) external;
}
