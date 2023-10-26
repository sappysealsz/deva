// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnSafeTransferFrom} from "./IOnSafeTransferFrom.sol";

abstract contract OnSafeTransferFrom is IOnSafeTransferFrom {
    function onSafeTransferFrom(address from, address to, uint256 id, uint256 value, bytes memory data)
        public
        virtual;
}
