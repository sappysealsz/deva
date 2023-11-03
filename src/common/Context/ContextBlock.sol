// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

abstract contract ContextBlock {
    function _blockNumber() internal view virtual returns (uint256) {
        return block.number;
    }

    function _blockChainId() internal view virtual returns (uint256) {
        return block.chainid;
    }

    function _blockCoinBase() internal view virtual returns (address payable) {
        return block.coinbase;
    }

    function _blockGasLimit() internal view virtual returns (uint256) {
        return block.gaslimit;
    }

    function _blockBaseFee() internal view virtual returns (uint256) {
        return block.basefee;
    }

    function _blockDifficulty() internal view virtual returns (uint256) {
        return block.difficulty;
    }

    function _blockTimestamp() internal view virtual returns (uint256) {
        return block.timestamp;
    }
}
