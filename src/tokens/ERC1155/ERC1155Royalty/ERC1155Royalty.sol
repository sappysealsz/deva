// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC2981} from "openzeppelin/token/common/ERC2981.sol";

import {ERC1155Base} from "../ERC1155Base/ERC1155Base.sol";
import {IERC1155Royalty} from "./IERC1155Royalty.sol";

abstract contract ERC1155Royalty is ERC1155Base, ERC2981 {
    function setDefaultRoyalty(address receiver, uint96 feeNumerator) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _setDefaultRoyalty(receiver, feeNumerator);
    }

    function setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator)
        public
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        _setTokenRoyalty(tokenId, receiver, feeNumerator);
    }

    function resetTokenRoyalty(uint256 tokenId) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _resetTokenRoyalty(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155Base, ERC2981) returns (bool) {
        return interfaceId == type(IERC1155Royalty).interfaceId;
    }
}
