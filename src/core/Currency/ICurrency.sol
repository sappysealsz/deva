// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IERC20Base} from "src/tokens/ERC20/ERC20Base/IERC20Base.sol";
import {IERC20Mintable} from "src/tokens/ERC20/ERC20Mintable/IERC20Mintable.sol";
import {IERC20Burnable} from "src/tokens/ERC20/ERC20Burnable/IERC20Burnable.sol";
import {IERC20Redeem} from "src/tokens/ERC20/ERC20Redeem/IERC20Redeem.sol";
import {IERC20Permit} from "src/tokens/ERC20/ERC20Permit/IERC20Permit.sol";

interface ICurrency is IERC20Base, IERC20Mintable, IERC20Burnable, IERC20Redeem, IERC20Permit {}
