// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Signatures} from "src/utils/Signatures.sol";

import {ERC1155Base} from "../ERC1155Base/ERC1155Base.sol";
import {IERC1155Redeem} from "./IERC1155Redeem.sol";

abstract contract ERC1155Redeem is ERC1155Base {
    using Signatures for Signatures.Signature;

    error InvalidSafeRedeemSignature();
    error InvalidSafeRedeemBatchSignature();

    bytes32 public constant REDEEMER_ROLE = keccak256("REDEEMER_ROLE");

    bytes32 public constant SAFE_REDEEM_TYPEHASH =
        keccak256("SafeRedeem(address creator,address receiver,uint256 id,uint256 value,bytes data,uint256 deadline)");

    bytes32 public constant SAFE_REDEEM_BATCH_TYPEHASH = keccak256(
        "SafeRedeemBatch(address creator,address receiver,uint256[] ids,uint256[] values,bytes data,uint256 deadline)"
    );

    function safeRedeem(
        address creator,
        address receiver,
        uint256 id,
        uint256 value,
        bytes memory data,
        uint256 deadline,
        Signatures.Signature memory signature
    ) public virtual {
        if (!hasRole(DEFAULT_ADMIN_ROLE, creator)) {
            revert InvalidSafeRedeemSignature();
        }

        if (block.timestamp > deadline) {
            revert InvalidSafeRedeemSignature();
        }

        bytes32 structHash = keccak256(abi.encode(SAFE_REDEEM_TYPEHASH, creator, receiver, id, value, data, deadline));
        bytes32 digest = _hashTypedDataV4(structHash);
        address signer = signature.recover(digest);

        if (signer != creator) {
            revert InvalidSafeRedeemSignature();
        }

        _mint(receiver, id, value, data);
    }

    function safeRedeemBatch(
        address creator,
        address receiver,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data,
        uint256 deadline,
        Signatures.Signature memory signature
    ) public virtual {
        if (!hasRole(REDEEMER_ROLE, creator)) {
            revert InvalidSafeRedeemBatchSignature();
        }

        if (block.timestamp > deadline) {
            revert InvalidSafeRedeemBatchSignature();
        }

        bytes32 structHash =
            keccak256(abi.encode(SAFE_REDEEM_BATCH_TYPEHASH, creator, receiver, ids, values, data, deadline));
        bytes32 digest = _hashTypedDataV4(structHash);
        address signer = signature.recover(digest);

        if (signer != creator) {
            revert InvalidSafeRedeemBatchSignature();
        }

        _mintBatch(receiver, ids, values, data);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155Base) returns (bool) {
        return interfaceId == type(IERC1155Redeem).interfaceId;
    }
}
