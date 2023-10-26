// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnSafeBurn} from "./IOnSafeBurn.sol";

abstract contract OnSafeBurn is IOnSafeBurn {
    function onSafeBurn(address owner, uint256 id, uint256 value) public virtual;
}
