// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Signatures} from "src/utils/Signatures.sol";

import {ERC20Base} from "../ERC20Base/ERC20Base.sol";

abstract contract ERC20Redeem is ERC20Base {
    using Signatures for Signatures.Signature;

    error InvalidRedeemSignature();

    bytes32 public constant REDEEMER_ROLE = keccak256("REDEEMER_ROLE");

    bytes32 public constant REDEEM_TYPEHASH =
        keccak256("Redeem(address creator,address receiver,uint256 amount,uint256 deadline)");

    function redeem(
        address creator,
        address receiver,
        uint256 amount,
        uint256 deadline,
        Signatures.Signature memory signature
    ) public virtual {
        if (!hasRole(REDEEMER_ROLE, creator)) {
            revert InvalidRedeemSignature();
        }

        if (block.timestamp > deadline) {
            revert InvalidRedeemSignature();
        }

        bytes32 structHash = keccak256(abi.encode(REDEEM_TYPEHASH, creator, receiver, amount, deadline));
        bytes32 digest = _hashTypedDataV4(structHash);
        address signer = signature.recover(digest);

        if (signer != creator) {
            revert InvalidRedeemSignature();
        }

        _mint(receiver, amount);
    }
}
