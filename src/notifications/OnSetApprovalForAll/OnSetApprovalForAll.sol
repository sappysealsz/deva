// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnSetApprovalForAll} from "./IOnSetApprovalForAll.sol";

abstract contract OnSetApprovalForAll is IOnSetApprovalForAll {
    function onSetApprovalForAll(address operator, bool approved) public virtual;
}
