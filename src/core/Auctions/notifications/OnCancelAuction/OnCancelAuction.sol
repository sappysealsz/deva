// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IOnCancelAuction} from "./IOnCancelAuction.sol";

abstract contract OnCancelAuction is IOnCancelAuction {
    function onCancelAuction(uint256 auctionId) public virtual;
}
