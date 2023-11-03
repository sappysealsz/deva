// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

// abstract contract AccessOwner {
//     address private _owner;
//     address private _pendingOwner;

//     event AcceptedOwnership(address indexed newOwner);

//     error IncorrectOwner(address owner);

//     modifier onlyOwner() virtual {
//         if (_owner != msg.sender) {
//             revert IncorrectOwner(msg.sender);
//         }
//         _;
//     }

//     constructor() {
//         _owner = msg.sender;
//     }

//     function owner() public view virtual returns (address) {
//         return _owner;
//     }

//     function pengingOwner() public view virtual returns (address) {
//         return _pendingOwner;
//     }

//     function accessOwner() public {}

//     function transferOwnership(address newOwner) public virtual onlyOwner {}
// }
