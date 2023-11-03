// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC165} from "openzeppelin/utils/introspection/ERC165.sol";

import {IOnSafeBatchTransferFrom} from "./IOnSafeBatchTransferFrom.sol";

abstract contract OnSafeBatchTransferFrom is IOnSafeBatchTransferFrom, ERC165 {
    function onSafeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) public virtual;

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IOnSafeBatchTransferFrom).interfaceId || super.supportsInterface(interfaceId);
    }
}
