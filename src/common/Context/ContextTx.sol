// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

abstract contract ContextTx {
    function _txOrigin() internal view virtual returns (address) {
        return tx.origin;
    }

    function _txGasPrice() internal view virtual returns (uint256) {
        return tx.gasprice;
    }
}
