// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {MysteryBox} from "src/core/MysteryBox/MysteryBox.sol";
import {Collection} from "src/core/Collection/Collection.sol";

contract MysteryBoxTest is Test {
    address public wallet1;

    MysteryBox public mysteryBox;
    Collection public collection;

    function setUp() public {
        wallet1 = vm.addr(0x123);

        mysteryBox = new MysteryBox("[URI]");
        collection = new Collection(wallet1, "[NAME]", "[URI]");
    }
}
