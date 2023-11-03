// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

// import {ERC20} from "openzeppelin/token/ERC20/ERC20.sol";
// import {EIP712} from "openzeppelin/utils/cryptography/EIP712.sol";
// import {AccessControlDefaultAdminRules} from "openzeppelin/access/extensions/AccessControlDefaultAdminRules.sol";

import {Ownable2Step} from "openzeppelin/access/Ownable2Step.sol";
import {EnumerableSet} from "openzeppelin/utils/structs/EnumerableSet.sol";

contract Whitelist is Ownable2Step {
    using EnumerableSet for EnumerableSet.AddressSet;

    EnumerableSet.AddressSet private _whitelist;

    event AddedToWhitelist(address indexed addr);
    event RemovedFromWhitelist(address indexed addr);

    function isWhitelisted(address addr) public view returns (bool) {
        return _whitelist.contains(addr);
    }

    function addToWhitelist(address addr) external onlyOwner {
        require(addr != address(0), "Antisnipe: invalid address");
        require(!_whitelist.contains(addr), "Antisnipe: the address is already whitelisted");

        _whitelist.add(addr);

        emit AddedToWhitelist(addr);
    }

    function removeFromWhitelist(address addr) external onlyOwner {
        require(addr != address(0), "Antisnipe: invalid address");
        require(_whitelist.contains(addr), "Antisnipe: the address is not found in the whitelist");

        _whitelist.remove(addr);

        emit RemovedFromWhitelist(addr);
    }

    function assureCanTransfer(address sender, address, address, uint256) external view returns (bool) {
        return isWhitelisted(sender);
    }
}
