// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract AssemblyError {
    function yul_revert(uint x) public pure {
        assembly {
            // revert(p, s) - end execution
            //                revert state changes
            //                return data mem[p…(p+s))
            if gt(x, 10) { revert(0, 0) }
        }
    }
}
