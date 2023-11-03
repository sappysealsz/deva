// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {EnumerableSet} from "openzeppelin/utils/structs/EnumerableSet.sol";

import {ERC1155Base} from "src/tokens/ERC1155/ERC1155Base/ERC1155Base.sol";
import {ERC1155Mintable} from "src/tokens/ERC1155/ERC1155Mintable/ERC1155Mintable.sol";
import {ERC1155Burnable} from "src/tokens/ERC1155/ERC1155Burnable/ERC1155Burnable.sol";
import {ERC1155Redeem} from "src/tokens/ERC1155/ERC1155Redeem/ERC1155Redeem.sol";
import {ERC1155Permit} from "src/tokens/ERC1155/ERC1155Permit/ERC1155Permit.sol";
import {ERC1155Royalty} from "src/tokens/ERC1155/ERC1155Royalty/ERC1155Royalty.sol";
import {ERC1155Notifiers} from "src/tokens/ERC1155/ERC1155Notifiers/ERC1155Notifiers.sol";

import {INotifier} from "src/core/Notifier/INotifier.sol";
import {IOnSetApprovalForAll} from "src/notifications/OnSetApprovalForAll/IOnSetApprovalForAll.sol";
import {IOnSafeTransferFrom} from "src/notifications/OnSafeTransferFrom/IOnSafeTransferFrom.sol";
import {IOnSafeBatchTransferFrom} from "src/notifications/OnSafeBatchTransferFrom/IOnSafeBatchTransferFrom.sol";
import {IOnSafeMint} from "src/notifications/OnSafeMint/IOnSafeMint.sol";
import {IOnSafeMintBatch} from "src/notifications/OnSafeMintBatch/IOnSafeMintBatch.sol";
import {IOnSafeBurn} from "src/notifications/OnSafeBurn/IOnSafeBurn.sol";
import {IOnSafeBurnBatch} from "src/notifications/OnSafeBurnBatch/IOnSafeBurnBatch.sol";

contract Collection is
    ERC1155Base,
    ERC1155Mintable,
    ERC1155Burnable,
    ERC1155Redeem,
    ERC1155Permit,
    ERC1155Royalty,
    ERC1155Notifiers
{
    using EnumerableSet for EnumerableSet.AddressSet;

    constructor(address admin, string memory name, string memory uri) ERC1155Base(admin, name, uri) {}

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(
            ERC1155Base, ERC1155Mintable, ERC1155Burnable, ERC1155Redeem, ERC1155Permit, ERC1155Royalty, ERC1155Notifiers
        )
        returns (bool)
    {
        return ERC1155Base.supportsInterface(interfaceId) || ERC1155Mintable.supportsInterface(interfaceId)
            || ERC1155Burnable.supportsInterface(interfaceId) || ERC1155Redeem.supportsInterface(interfaceId)
            || ERC1155Permit.supportsInterface(interfaceId) || ERC1155Royalty.supportsInterface(interfaceId)
            || ERC1155Notifiers.supportsInterface(interfaceId);
    }

    function setApprovalForAll(address operator, bool approved) public override {
        for (uint256 i = 0; i < _notifiers.length(); i++) {
            if (INotifier(_notifiers.at(i)).supportsInterface(type(IOnSetApprovalForAll).interfaceId)) {
                IOnSetApprovalForAll(_notifiers.at(i)).onSetApprovalForAll(operator, approved);
            }
        }

        super.setApprovalForAll(operator, approved);
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes memory data) public override {
        for (uint256 i = 0; i < _notifiers.length(); i++) {
            if (INotifier(_notifiers.at(i)).supportsInterface(type(IOnSafeTransferFrom).interfaceId)) {
                IOnSafeTransferFrom(_notifiers.at(i)).onSafeTransferFrom(from, to, id, value, data);
            }
        }

        super.safeTransferFrom(from, to, id, value, data);
    }

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) public override {
        for (uint256 i = 0; i < _notifiers.length(); i++) {
            if (INotifier(_notifiers.at(i)).supportsInterface(type(IOnSafeBatchTransferFrom).interfaceId)) {
                IOnSafeBatchTransferFrom(_notifiers.at(i)).onSafeBatchTransferFrom(from, to, ids, values, data);
            }
        }

        super.safeBatchTransferFrom(from, to, ids, values, data);
    }

    function safeMint(address owner, uint256 id, uint256 value, bytes memory data)
        public
        override
        onlyRole(MINTER_ROLE)
    {
        for (uint256 i = 0; i < _notifiers.length(); i++) {
            if (INotifier(_notifiers.at(i)).supportsInterface(type(IOnSafeMint).interfaceId)) {
                IOnSafeMint(_notifiers.at(i)).onSafeMint(owner, id, value, data);
            }
        }

        super.safeMint(owner, id, value, data);
    }

    function safeMintBatch(address owner, uint256[] memory ids, uint256[] memory values, bytes memory data)
        public
        override
        onlyRole(MINTER_ROLE)
    {
        for (uint256 i = 0; i < _notifiers.length(); i++) {
            if (INotifier(_notifiers.at(i)).supportsInterface(type(IOnSafeMintBatch).interfaceId)) {
                IOnSafeMintBatch(_notifiers.at(i)).onSafeMintBatch(owner, ids, values, data);
            }
        }

        super.safeMintBatch(owner, ids, values, data);
    }

    function safeBurn(address owner, uint256 id, uint256 value) public override onlyRole(BURNER_ROLE) {
        for (uint256 i = 0; i < _notifiers.length(); i++) {
            if (INotifier(_notifiers.at(i)).supportsInterface(type(IOnSafeBurn).interfaceId)) {
                IOnSafeBurn(_notifiers.at(i)).onSafeBurn(owner, id, value);
            }
        }

        super.safeBurn(owner, id, value);
    }

    function safeBurnBatch(address owner, uint256[] memory ids, uint256[] memory values)
        public
        override
        onlyRole(BURNER_ROLE)
    {
        for (uint256 i = 0; i < _notifiers.length(); i++) {
            if (INotifier(_notifiers.at(i)).supportsInterface(type(IOnSafeBurnBatch).interfaceId)) {
                IOnSafeBurnBatch(_notifiers.at(i)).onSafeBurnBatch(owner, ids, values);
            }
        }

        super.safeBurnBatch(owner, ids, values);
    }
}
