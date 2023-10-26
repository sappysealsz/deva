// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnSafeBatchTransferFrom} from "./IOnSafeBatchTransferFrom.sol";

abstract contract OnSafeBatchTransferFrom is IOnSafeBatchTransferFrom {
    function onSafeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) public virtual;
}
