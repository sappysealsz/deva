// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ECDSA} from "openzeppelin/utils/cryptography/ECDSA.sol";

library Signatures {
    struct Signature {
        uint8 v;
        bytes32 r;
        bytes32 s;
    }

    function empty() internal pure returns (Signature memory) {
        return Signature(0, 0x0, 0x0);
    }

    function id(Signature memory signature) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(signature.v, signature.r, signature.s));
    }

    function recover(Signature memory signature, bytes32 digest) internal pure returns (address) {
        return ECDSA.recover(digest, signature.v, signature.r, signature.s);
    }
}
