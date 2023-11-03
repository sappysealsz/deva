// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC165} from "openzeppelin/utils/introspection/ERC165.sol";

import {IOnSafeBurn} from "./IOnSafeBurn.sol";

abstract contract OnSafeBurn is IOnSafeBurn, ERC165 {
    function onSafeBurn(address owner, uint256 id, uint256 value) public virtual;

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IOnSafeBurn).interfaceId || super.supportsInterface(interfaceId);
    }
}
