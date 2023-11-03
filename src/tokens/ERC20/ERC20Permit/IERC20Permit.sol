// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {Signatures} from "src/utils/Signatures.sol";

import {IERC20Base} from "../ERC20Base/IERC20Base.sol";

interface IERC20Permit is IERC20Base {
    function permit(address from, address to, uint256 amount, uint256 deadline, Signatures.Signature memory signature)
        external;
}
