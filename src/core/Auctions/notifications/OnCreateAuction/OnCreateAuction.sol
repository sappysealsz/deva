// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Asset} from "../../types/Asset.sol";
import {Config} from "../../types/Config.sol";
import {IOnCreateAuction} from "./IOnCreateAuction.sol";

abstract contract OnCreateAuction is IOnCreateAuction {
    function onCreateAuction(address creator, Asset memory asset, Config memory config) public virtual;
}
