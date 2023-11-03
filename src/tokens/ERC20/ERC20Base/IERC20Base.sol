// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IERC20} from "openzeppelin/token/ERC20/IERC20.sol";
import {IAccessControlDefaultAdminRules} from "openzeppelin/access/extensions/IAccessControlDefaultAdminRules.sol";

interface IERC20Base is IERC20, IAccessControlDefaultAdminRules {}
