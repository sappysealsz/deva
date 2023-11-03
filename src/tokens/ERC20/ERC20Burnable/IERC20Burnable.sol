// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IERC20Base} from "../ERC20Base/IERC20Base.sol";

interface IERC20Burnable is IERC20Base {
    function burn(address account, uint256 amount) external;
}
