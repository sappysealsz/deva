// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC165} from "openzeppelin/utils/introspection/ERC165.sol";

import {IOnSafeBurnBatch} from "./IOnSafeBurnBatch.sol";

abstract contract OnSafeBurnBatch is IOnSafeBurnBatch, ERC165 {
    function onSafeBatchBurn(address owner, uint256[] memory ids, uint256[] memory values) public virtual;

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IOnSafeBurnBatch).interfaceId || super.supportsInterface(interfaceId);
    }
}
