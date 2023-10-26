// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
// import {Collection} from "../src/core/Collection/Collection.sol";

contract CollectionDeploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Collection collection = new Collection("Name", "[URI]");

        vm.stopBroadcast();
    }
}
