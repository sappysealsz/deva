// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnSafeMint} from "./IOnSafeMint.sol";

abstract contract OnSafeMint is IOnSafeMint {
    function onSafeMint(address owner, uint256 id, uint256 value, bytes memory data) public virtual;
}
