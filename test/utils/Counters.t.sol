// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Counters} from "src/utils/Counters.sol";

contract CountersTest is Test {
    using Counters for Counters.Counter;

    address public wallet1;

    Counters.Counter public counter;

    function setUp() public {
        wallet1 = vm.addr(0x123);
    }
}
