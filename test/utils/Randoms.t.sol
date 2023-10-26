// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Randoms} from "src/utils/Randoms.sol";

contract RandomsTest is Test {
    address public wallet1;

    function setUp() public {
        wallet1 = vm.addr(0x123);
    }
}
