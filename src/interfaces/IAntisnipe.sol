// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IAntisnipe {
    function assureCanTransfer(address sender, address from, address to, uint256 amount) external;
}
