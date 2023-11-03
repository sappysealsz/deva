// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IERC1155Burnable {
    function safeBurn(address owner, uint256 id, uint256 value) external;

    function safeBurnBatch(address owner, uint256[] memory ids, uint256[] memory values) external;
}
