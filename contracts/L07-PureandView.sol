// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

//Getter functions can be declared view or pure.
// View function declares that no state will be changed.
// Pure function declares that no state variable will be changed or read.

contract ViewAndPure {
    uint public x = 1;

    // Promise not to modify the state.
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // Promise not to modify or read from the state.
    // this is pure function because it doesn't read or from state varibale or modify
    // It is reading fromn function parameter uint i and uint j not from state variable.
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}