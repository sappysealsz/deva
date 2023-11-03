// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ICollection} from "../../Collection/ICollection.sol";

struct Asset {
    ICollection collection;
    uint256[] ids;
    uint256[] values;
}
