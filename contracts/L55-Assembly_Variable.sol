
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// uint z:=123 will throw an error
// let is the right way

contract AssemblyVariable {
    function yul_let() public pure returns (uint z) {
        assembly {
            // Language used for assembly is called Yul
            // Local variables
            let x := 123
            z := 456
        }
    }
}