// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IERC1155} from "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import {IAccessControlDefaultAdminRules} from
    "@openzeppelin/contracts/access/extensions/IAccessControlDefaultAdminRules.sol";

interface IERC1155Base is IERC1155, IAccessControlDefaultAdminRules {
    function DOMAIN_SEPARATOR() external view returns (bytes32);
}
