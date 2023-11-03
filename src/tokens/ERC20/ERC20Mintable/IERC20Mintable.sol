// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IERC20Base} from "../ERC20Base/IERC20Base.sol";

interface IERC20Mintable is IERC20Base {
    function mint(address account, uint256 amount) external;
}
