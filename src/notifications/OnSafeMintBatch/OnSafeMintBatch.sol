// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC165} from "openzeppelin/utils/introspection/ERC165.sol";

import {IOnSafeMintBatch} from "./IOnSafeMintBatch.sol";

abstract contract OnSafeMintBatch is IOnSafeMintBatch, ERC165 {
    function onSafeMintBatch(address owner, uint256[] memory ids, uint256[] memory values, bytes memory data)
        public
        virtual;

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IOnSafeMintBatch).interfaceId || super.supportsInterface(interfaceId);
    }
}
