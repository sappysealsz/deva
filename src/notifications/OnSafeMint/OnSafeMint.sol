// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC165} from "openzeppelin/utils/introspection/ERC165.sol";

import {IOnSafeMint} from "./IOnSafeMint.sol";

abstract contract OnSafeMint is IOnSafeMint, ERC165 {
    function onSafeMint(address owner, uint256 id, uint256 value, bytes memory data) public virtual;

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IOnSafeMint).interfaceId || super.supportsInterface(interfaceId);
    }
}
