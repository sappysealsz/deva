// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Signatures} from "src/utils/Signatures.sol";

import {ERC20Base} from "../ERC20Base/ERC20Base.sol";

abstract contract ERC20Permit is ERC20Base {
    using Signatures for Signatures.Signature;

    error InvalidPermitSignature();

    bytes32 public constant PERMIT_TYPEHASH =
        keccak256("Permit(address from,address to,uint256 amount,uint256 deadline)");

    function permit(address from, address to, uint256 amount, uint256 deadline, Signatures.Signature memory signature)
        public
        virtual
    {
        if (block.timestamp > deadline) {
            revert InvalidPermitSignature();
        }

        bytes32 structHash = keccak256(abi.encode(PERMIT_TYPEHASH, from, to, amount, deadline));
        bytes32 digest = _hashTypedDataV4(structHash);
        address signer = signature.recover(digest);

        if (signer != from) {
            revert InvalidPermitSignature();
        }

        _transfer(from, to, amount);
    }
}
