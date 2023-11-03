// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Asset} from "../../types/Asset.sol";
import {Config} from "../../types/Config.sol";

interface IOnCreateAuction {
    function onCreateAuction(address creator, Asset memory asset, Config memory config) external;
}
