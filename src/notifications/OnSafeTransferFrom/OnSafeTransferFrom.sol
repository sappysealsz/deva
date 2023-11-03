// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC165} from "openzeppelin/utils/introspection/ERC165.sol";

import {IOnSafeTransferFrom} from "./IOnSafeTransferFrom.sol";

abstract contract OnSafeTransferFrom is IOnSafeTransferFrom, ERC165 {
    function onSafeTransferFrom(address from, address to, uint256 id, uint256 value, bytes memory data)
        public
        virtual;

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IOnSafeTransferFrom).interfaceId || super.supportsInterface(interfaceId);
    }
}
