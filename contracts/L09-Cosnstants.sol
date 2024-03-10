// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// constants variables will consume less gas as compared to varibales which are not declared as constant.

contract Constants {
    // coding convention to uppercase constant variables
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;
}