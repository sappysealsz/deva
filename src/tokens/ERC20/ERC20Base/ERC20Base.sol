// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC20} from "openzeppelin/token/ERC20/ERC20.sol";
import {EIP712} from "openzeppelin/utils/cryptography/EIP712.sol";
import {AccessControlDefaultAdminRules} from "openzeppelin/access/extensions/AccessControlDefaultAdminRules.sol";

abstract contract ERC20Base is ERC20, EIP712, AccessControlDefaultAdminRules {
    constructor(string memory name, string memory symbol)
        ERC20(name, symbol)
        EIP712(name, "1")
        AccessControlDefaultAdminRules(1 days, msg.sender)
    {}
}
