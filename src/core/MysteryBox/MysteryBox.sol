// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {Ownable, Ownable2Step} from "@openzeppelin/contracts/access/Ownable2Step.sol";

import {ICollection} from "src/core/Collection/ICollection.sol";
import {Counters} from "src/utils/Counters.sol";
import {Randoms} from "src/utils/Randoms.sol";

contract MysteryBox is ERC1155, Ownable2Step {
    using Counters for Counters.Counter;

    struct Box {
        address creator;
        uint256 amount;
        Asset asset;
    }

    struct Asset {
        ICollection collection;
        uint256[] ids;
        uint256[] values;
    }

    Counters.Counter private _counter;
    mapping(uint256 id => Box box) private _boxes;

    event CreatedBoxes(uint256 indexed id, address indexed account, uint256 amount);
    event OpenedBoxes(uint256 indexed id, address indexed account, uint256 amount);
    event DesolateBoxes(uint256 indexed id, address indexed account, uint256 amount);

    error OnlyCreator();

    constructor(string memory uri) ERC1155(uri) Ownable(_msgSender()) {}

    function setURI(string memory uri) external onlyOwner {
        _setURI(uri);
    }

    function createBoxes(address creator, uint256 amount, Asset memory asset) external {
        if (creator != _msgSender()) {
            revert OnlyCreator();
        }

        _mint(creator, _counter.next(), amount, "0x0");
        _boxes[_counter.current()] = Box({creator: creator, amount: amount, asset: asset});

        emit CreatedBoxes(_counter.current(), _msgSender(), amount);
    }

    function openBoxes(uint256 id, uint256 amount) external {
        _burn(_msgSender(), id, amount);

        Box memory box = _boxes[id];
        uint256[] memory ids = new uint256[](amount);
        uint256[] memory values = new uint256[](amount);

        for (uint256 i = 0; i < amount; i++) {
            uint256 rand = Randoms.random1(box.asset.ids.length);
            ids[i] = box.asset.ids[rand];
            values[i] = box.asset.values[rand];
        }

        box.asset.collection.safeMintBatch(_msgSender(), ids, values, "0x0");

        emit OpenedBoxes(id, _msgSender(), amount);
    }

    function destroyBoxes(uint256 id, uint256 amount) external {
        _burn(_msgSender(), id, amount);

        _boxes[id].amount -= amount;
        if (_boxes[id].amount == 0) {
            delete _boxes[id];
        }

        emit DesolateBoxes(id, _msgSender(), amount);
    }
}
