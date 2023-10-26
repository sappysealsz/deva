// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnSafeBurnBatch} from "./IOnSafeBurnBatch.sol";

abstract contract OnSafeBurnBatch is IOnSafeBurnBatch {
    function onSafeBatchBurn(address owner, uint256[] memory ids, uint256[] memory values) public virtual;
}
