// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC1155Base} from "../ERC1155Base/ERC1155Base.sol";
import {IERC1155Burnable} from "./IERC1155Burnable.sol";

abstract contract ERC1155Burnable is ERC1155Base {
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    function safeBurn(address owner, uint256 id, uint256 value) public virtual onlyRole(BURNER_ROLE) {
        _burn(owner, id, value);
    }

    function safeBurnBatch(address owner, uint256[] memory ids, uint256[] memory values)
        public
        virtual
        onlyRole(BURNER_ROLE)
    {
        _burnBatch(owner, ids, values);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155Base) returns (bool) {
        return interfaceId == type(IERC1155Burnable).interfaceId;
    }
}
