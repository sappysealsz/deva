// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC20Base} from "src/tokens/ERC20/ERC20Base/ERC20Base.sol";
import {ERC20Mintable} from "src/tokens/ERC20/ERC20Mintable/ERC20Mintable.sol";
import {ERC20Burnable} from "src/tokens/ERC20/ERC20Burnable/ERC20Burnable.sol";
import {ERC20Redeem} from "src/tokens/ERC20/ERC20Redeem/ERC20Redeem.sol";
import {ERC20Permit} from "src/tokens/ERC20/ERC20Permit/ERC20Permit.sol";

contract Currency is ERC20Base, ERC20Mintable, ERC20Burnable, ERC20Redeem, ERC20Permit {
    constructor(address admin, string memory name, string memory uri) ERC20Base(name, uri) {}

    function transfer(address to, uint256 amount) public virtual override returns (bool) {}
}
