// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IAntisnipe} from "src/interfaces/IAntisnipe.sol";

import {ERC20Base} from "../ERC20Base/ERC20Base.sol";

abstract contract ERC20Antisniper is ERC20Base {
// struct AntisnipeConfig {
//     bool enabled;
//     IAntisnipe contractt;
// }

// AntisnipeConfig private _config;

// function _beforeTokenTransfer(address from, address to, uint256 amount) internal view virtual override {
//     // if (_antisnipeConfig.enabled && _antisnipeConfig.contractAddress != address(0)) {
//     //     require(
//     //         IAntisnipe(_antisnipeConfig.contractAddress).assureCanTransfer(msg.sender, from, to, amount),
//     //         "antisnipe blocked the transfer"
//     //     );
//     // }
// }
}
