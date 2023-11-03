// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

abstract contract ContextSelf {
    function _selfAddress() internal view virtual returns (address) {
        return address(this);
    }

    function _selfPayableAddress() internal view virtual returns (address payable) {
        return payable(address(this));
    }
}
