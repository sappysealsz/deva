// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Signatures} from "src/utils/Signatures.sol";

interface IERC1155Redeem {
    function safeRedeem(
        address creator,
        address reciver,
        uint256 id,
        uint256 value,
        bytes memory data,
        uint256 deadline,
        Signatures.Signature memory signature
    ) external;

    function safeRedeemBatch(
        address creator,
        address reciver,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data,
        uint256 deadline,
        Signatures.Signature memory signature
    ) external;
}
