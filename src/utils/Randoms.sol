// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

library Randoms {
    function random0() internal view returns (uint256) {
        return uint256(
            keccak256(
                abi.encodePacked(
                    blockhash(block.number),
                    blockhash(block.number - 1),
                    blockhash(block.number - 2),
                    blockhash(block.number - 3),
                    blockhash(block.number - 4),
                    blockhash(block.number - 5)
                )
            )
        );
    }

    function random1(uint256 max) internal view returns (uint256) {
        return random0() % max;
    }

    function random2(uint256 min, uint256 max) internal view returns (uint256) {
        return min + random0() % (max - min);
    }
}
