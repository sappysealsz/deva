// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {EIP712} from "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import {AccessControlDefaultAdminRules} from
    "@openzeppelin/contracts/access/extensions/AccessControlDefaultAdminRules.sol";

import {IERC1155Base} from "src/core/ERC1155/ERC1155Base/IERC1155Base.sol";

abstract contract ERC1155Base is ERC1155, EIP712, AccessControlDefaultAdminRules {
    constructor(address admin, string memory name, string memory uri)
        ERC1155(uri)
        EIP712(name, "1")
        AccessControlDefaultAdminRules(1 days, admin)
    {}

    function DOMAIN_SEPARATOR() external view returns (bytes32) {
        return _domainSeparatorV4();
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC1155, AccessControlDefaultAdminRules)
        returns (bool)
    {
        return interfaceId == type(IERC1155Base).interfaceId;
    }
}
