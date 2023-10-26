// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC1155Base} from "src/core/ERC1155/ERC1155Base/ERC1155Base.sol";
import {IERC1155Mintable} from "src/core/ERC1155/ERC1155Mintable/IERC1155Mintable.sol";

abstract contract ERC1155Mintable is ERC1155Base {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    function safeMint(address owner, uint256 id, uint256 value, bytes memory data)
        public
        virtual
        onlyRole(MINTER_ROLE)
    {
        _mint(owner, id, value, data);
    }

    function safeMintBatch(address owner, uint256[] memory ids, uint256[] memory values, bytes memory data)
        public
        virtual
        onlyRole(MINTER_ROLE)
    {
        _mintBatch(owner, ids, values, data);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155Base) returns (bool) {
        return interfaceId == type(IERC1155Mintable).interfaceId;
    }
}
