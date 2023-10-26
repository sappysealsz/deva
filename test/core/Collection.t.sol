// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Collection} from "src/core/Collection/Collection.sol";

contract CollectionTest is Test {
    address public wallet1;

    Collection public collection;

    function setUp() public {
        wallet1 = vm.addr(0x123);

        collection = new Collection(wallet1, "[NAME]", "[URI]");
    }

    function testSafeMint() public {
        vm.startPrank(wallet1);

        uint256 id = 10;
        uint256 value = 5;

        collection.grantRole(collection.MINTER_ROLE(), wallet1);

        uint256 balance1 = collection.balanceOf(wallet1, id);
        collection.safeMint(wallet1, id, value, "0x0");
        uint256 balance2 = collection.balanceOf(wallet1, id);
        assertEq(balance2, balance1 + value, "the balance should be greater");

        vm.stopPrank();
    }

    function testSafeBurn() public {
        vm.startPrank(wallet1);

        uint256 id = 10;
        uint256 value = 5;

        collection.grantRole(collection.MINTER_ROLE(), wallet1);
        collection.grantRole(collection.BURNER_ROLE(), wallet1);
        collection.safeMint(wallet1, id, value, "0x0");

        uint256 balance1 = collection.balanceOf(wallet1, id);
        collection.safeBurn(wallet1, id, value);
        uint256 balance2 = collection.balanceOf(wallet1, id);
        assertEq(balance2, balance1 - value, "the balance should be lesser");

        vm.stopPrank();
    }
}
