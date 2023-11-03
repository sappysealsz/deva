// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

interface IERC1155Notifiers {
    function hasNotifier(address notifier) external view returns (bool);

    function addNotifier(address notifier) external;

    function removeNotifier(address notifier) external;
}
