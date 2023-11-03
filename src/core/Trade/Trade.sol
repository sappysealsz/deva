// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import {ReentrancyGuard} from "openzeppelin/utils/ReentrancyGuard.sol";
import {IERC1155} from "openzeppelin/token/ERC1155/IERC1155.sol";
import {IERC20} from "openzeppelin/token/ERC20/IERC20.sol";

import {Context} from "src/common/Context/Context.sol";
import {SupportInterfaces} from "src/common/SupportInterfaces/SupportInterfaces.sol";
import {Counters} from "src/utils/Counters.sol";

contract Trade is ReentrancyGuard, Context, SupportInterfaces {
    using Counters for Counters.Counter;

    struct Order {
        OrderStatus status;
        address seller;
        address buyer;
        Asset asset;
        Payment payment;
    }

    enum OrderStatus {
        Opened,
        Closed,
        Canceled
    }

    struct Asset {
        IERC1155 collection;
        uint256[] ids;
        uint256[] values;
    }

    struct Payment {
        IERC20 token;
        uint256 amount;
    }

    Counters.Counter private _counter;
    mapping(uint256 id => Order order) private _orders;

    event OpenedOrder(
        uint256 indexed orderId, OrderStatus indexed orderStatus, address seller, Asset asset, Payment payment
    );
    event ClosedOrder(
        uint256 indexed orderId,
        OrderStatus indexed orderStatus,
        address seller,
        address buyer,
        Asset asset,
        Payment payment
    );
    event CanceledOrder(
        uint256 indexed orderId, OrderStatus indexed orderStatus, address seller, Asset asset, Payment payment
    );

    error OnlySellar();
    error OnlyBuyer();
    error InvalidOrderStatus();

    function orderOf(uint256 orderId) external view returns (Order memory) {
        return _orders[orderId];
    }

    function openOrder(address seller, Asset memory asset, Payment memory payment) external nonReentrant {
        if (seller != _msgSender()) {
            revert OnlySellar();
        }

        Order storage order = _orders[_counter.next()];

        order.status = OrderStatus.Opened;
        order.seller = seller;
        order.asset = asset;
        order.payment = payment;

        asset.collection.safeBatchTransferFrom({
            from: seller,
            to: address(this),
            ids: asset.ids,
            values: asset.values,
            data: "0x0"
        });

        emit OpenedOrder({
            orderId: _counter.current(),
            orderStatus: order.status,
            seller: order.seller,
            asset: order.asset,
            payment: order.payment
        });
    }

    function cancelOrder(uint256 orderId) external nonReentrant {
        Order storage order = _orders[orderId];

        if (order.seller != _msgSender()) {
            revert OnlySellar();
        }

        if (order.status != OrderStatus.Opened) {
            revert InvalidOrderStatus();
        }

        order.status = OrderStatus.Canceled;

        emit CanceledOrder({
            orderId: orderId,
            orderStatus: order.status,
            seller: order.seller,
            asset: order.asset,
            payment: order.payment
        });
    }

    function closeOrder(uint256 orderId) external nonReentrant {
        Order storage order = _orders[orderId];

        if (order.seller == _msgSender()) {
            revert OnlyBuyer();
        }

        if (order.status != OrderStatus.Opened) {
            revert InvalidOrderStatus();
        }

        order.status = OrderStatus.Closed;
        order.buyer = _msgSender();

        order.payment.token.transferFrom({from: order.buyer, to: order.seller, value: order.payment.amount});

        order.asset.collection.safeBatchTransferFrom({
            from: address(this),
            to: _msgSender(),
            ids: order.asset.ids,
            values: order.asset.values,
            data: "0x0"
        });

        emit ClosedOrder({
            orderId: orderId,
            orderStatus: order.status,
            seller: order.seller,
            buyer: order.buyer,
            asset: order.asset,
            payment: order.payment
        });
    }
}
