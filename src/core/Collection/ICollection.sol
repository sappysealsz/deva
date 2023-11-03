// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IERC1155Base} from "src/tokens/ERC1155/ERC1155Base/IERC1155Base.sol";
import {IERC1155Mintable} from "src/tokens/ERC1155/ERC1155Mintable/IERC1155Mintable.sol";
import {IERC1155Burnable} from "src/tokens/ERC1155/ERC1155Burnable/IERC1155Burnable.sol";
import {IERC1155Redeem} from "src/tokens/ERC1155/ERC1155Redeem/IERC1155Redeem.sol";
import {IERC1155Permit} from "src/tokens/ERC1155/ERC1155Permit/IERC1155Permit.sol";
import {IERC1155Royalty} from "src/tokens/ERC1155/ERC1155Royalty/IERC1155Royalty.sol";
import {IERC1155Notifiers} from "src/tokens/ERC1155/ERC1155Notifiers/IERC1155Notifiers.sol";

interface ICollection is
    IERC1155Base,
    IERC1155Mintable,
    IERC1155Burnable,
    IERC1155Redeem,
    IERC1155Permit,
    IERC1155Royalty,
    IERC1155Notifiers
{}
