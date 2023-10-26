// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnSafeMintBatch} from "./IOnSafeMintBatch.sol";

abstract contract OnSafeMintBatch is IOnSafeMintBatch {
    function onSafeMintBatch(address owner, uint256[] memory ids, uint256[] memory values, bytes memory data)
        public
        virtual;
}
