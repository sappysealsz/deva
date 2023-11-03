// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ISupportInterfaces} from "./ISupportInterfaces.sol";

abstract contract SupportInterfaces is ISupportInterfaces {
    mapping(bytes4 interfaceId => bool isSupported) private _supportInterfaces;

    function _setSupportInterface(bytes4 interfaceId, bool isSupported) internal {
        _supportInterfaces[interfaceId] = isSupported;
    }

    function supportInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return _supportInterfaces[interfaceId];
    }

    function supportBatchInterface(bytes4[] memory interfaceIds) public view virtual returns (bool) {
        for (uint256 i = 0; i < interfaceIds.length; i++) {
            if (_supportInterfaces[interfaceIds[i]]) {
                return true;
            }
        }
        return false;
    }
}
