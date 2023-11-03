// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Signatures} from "src/utils/Signatures.sol";

import {ERC1155Base} from "../ERC1155Base/ERC1155Base.sol";
import {IERC1155Permit} from "./IERC1155Permit.sol";

abstract contract ERC1155Permit is ERC1155Base {
    using Signatures for Signatures.Signature;

    error InvalidSafePermitSignature();
    error InvalidSafePermitBatchSignature();

    bytes32 public constant SAFE_PERMIT_TYPEHASH =
        keccak256("SafePermit(address from,address to,uint256 id,uint256 value,bytes data,uint256 deadline)");

    bytes32 public constant SAFE_PERMIT_BATCH_TYPEHASH =
        keccak256("SafePermitBatch(address from,address to,uint256[] ids,uint256[] values,bytes data,uint256 deadline)");

    function safePermit(
        address from,
        address to,
        uint256 id,
        uint256 value,
        bytes memory data,
        uint256 deadline,
        Signatures.Signature memory signature
    ) public virtual {
        if (block.timestamp > deadline) {
            revert InvalidSafePermitSignature();
        }

        bytes32 structHash = keccak256(abi.encode(SAFE_PERMIT_TYPEHASH, from, to, id, value, data, deadline));
        bytes32 digest = _hashTypedDataV4(structHash);
        address signer = signature.recover(digest);

        if (signer != from) {
            revert InvalidSafePermitSignature();
        }

        _safeTransferFrom(from, to, id, value, data);
    }

    function safePermitBatch(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data,
        uint256 deadline,
        Signatures.Signature memory signature
    ) public virtual {
        if (block.timestamp > deadline) {
            revert InvalidSafePermitBatchSignature();
        }

        bytes32 structHash = keccak256(abi.encode(SAFE_PERMIT_BATCH_TYPEHASH, from, to, ids, values, data, deadline));
        bytes32 digest = _hashTypedDataV4(structHash);
        address signer = signature.recover(digest);

        if (signer != from) {
            revert InvalidSafePermitBatchSignature();
        }

        _safeBatchTransferFrom(from, to, ids, values, data);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155Base) returns (bool) {
        return interfaceId == type(IERC1155Permit).interfaceId;
    }
}
