// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface ISupportInterfaces {
    function supportInterface(bytes4 interfaceId) external view returns (bool);

    function supportBatchInterface(bytes4[] memory interfaceIds) external view returns (bool);
}
