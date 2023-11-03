// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ContextTx} from "./ContextTx.sol";
import {ContextMsg} from "./ContextMsg.sol";
import {ContextBlock} from "./ContextBlock.sol";
import {ContextSelf} from "./ContextSelf.sol";

abstract contract Context is ContextTx, ContextMsg, ContextBlock, ContextSelf {}
