// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IERC1155Mintable {
    function safeMint(address owner, uint256 id, uint256 value, bytes memory data) external;

    function safeMintBatch(address owner, uint256[] memory ids, uint256[] memory values, bytes memory data) external;
}
