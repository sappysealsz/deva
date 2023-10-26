// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

library Counters {
    struct Counter {
        uint256 value;
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter.value;
    }

    function next(Counter storage counter) internal returns (uint256) {
        unchecked {
            counter.value++;
        }
        return counter.value;
    }

    function increment(Counter storage counter) internal {
        unchecked {
            counter.value++;
        }
    }

    function decrement(Counter storage counter) internal {
        unchecked {
            counter.value--;
        }
    }
}
