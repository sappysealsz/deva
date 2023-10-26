// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Trade} from "src/core/Trade/Trade.sol";
import {Collection} from "src/core/Collection/Collection.sol";

contract TradeTest is Test {
    address public wallet1;

    Trade public trade;
    Collection public collection;

    function setUp() public {
        wallet1 = vm.addr(0x1);

        trade = new Trade();
        collection = new Collection(wallet1, "[NAME]", "[URI]");
    }
}
