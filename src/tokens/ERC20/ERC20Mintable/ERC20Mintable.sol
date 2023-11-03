// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC20Base} from "../ERC20Base/ERC20Base.sol";

abstract contract ERC20Mintable is ERC20Base {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    function mint(address account, uint256 amount) public virtual onlyRole(MINTER_ROLE) {
        _mint(account, amount);
    }
}
