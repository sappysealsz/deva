// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IERC1155Royalty {
    function setDefaultRoyalty(address receiver, uint96 feeNumerator) external;

    function setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator) external;

    function resetTokenRoyalty(uint256 tokenId) external;
}
