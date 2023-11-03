// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC20Base} from "../ERC20Base/ERC20Base.sol";

abstract contract ERC20Burnable is ERC20Base {
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    function burn(address account, uint256 amount) public virtual onlyRole(BURNER_ROLE) {
        _burn(account, amount);
    }
}
