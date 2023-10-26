// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";

interface ITrade is IERC165 {
    // function orderOf(uint256 orderId) external view returns (Order memory);

    // function openOrder(address seller, Asset memory asset, Payment memory payment) external;

    function cancelOrder(uint256 orderId) external;

    function closeOrder(uint256 orderId) external;
}
