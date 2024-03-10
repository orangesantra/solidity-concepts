// Immutable variables are like constants. 
// Values of immutable variables can be set inside the constructor but cannot be modified afterwards.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// varibles declared as immutable as immutables are consume less gas compared to vaiables with common declaration(public).
// Immutables can only be initialized when contract is created/deployed
// It cannot be changes afterwards
// This is just like using constants, but they can be changed initilzed after contrayed deployement, but immutables cannot to so.


contract Immutable {
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}