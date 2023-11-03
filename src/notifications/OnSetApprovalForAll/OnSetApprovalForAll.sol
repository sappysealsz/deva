// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC165} from "openzeppelin/utils/introspection/ERC165.sol";

import {IOnSetApprovalForAll} from "./IOnSetApprovalForAll.sol";

abstract contract OnSetApprovalForAll is IOnSetApprovalForAll, ERC165 {
    function onSetApprovalForAll(address operator, bool approved) public virtual;

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IOnSetApprovalForAll).interfaceId || super.supportsInterface(interfaceId);
    }
}
