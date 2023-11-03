// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

abstract contract ContextMsg {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _msgSig() internal view virtual returns (bytes4) {
        return msg.sig;
    }

    function _msgValue() internal view virtual returns (uint256) {
        return msg.value;
    }
}
