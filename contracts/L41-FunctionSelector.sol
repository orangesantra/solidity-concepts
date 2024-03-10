// When a function is called, the first 4 bytes of calldata specifies which function to call.
// This 4 bytes is called a function selector.
// Take for example, this code below. It uses call to execute transfer on a contract at the address addr.


// | addr.call(abi.encodeWithSignature("transfer(address,uint256)", 0xSomeAddress, 123)) |
// ---------------------------- THE PURPOSE OF THIS LECTURE IS TO KNOW about "msg.data", i.e. what it is all about ----

// ###--- First 4 bytes of msg.value is about function or function signature
// --- the rest of the bytes are for function parameter, most likly in next 30 bytes and 30 bytes, incase 2 paramters
// are needed for function.


// The first 4 bytes returned from abi.encodeWithSignature(....) is the function selector.
// Perhaps you can save a tiny amount of gas if you precompute and inline the function selector in your code?
// Here is how the function selector is computed.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract FunctionSelector {
    /*
    "transfer(address,uint256)"
    0xa9059cbb
    "transferFrom(address,address,uint256)"
    0x23b872dd
    */
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}


contract receiver{
    event Log(bytes msgvalue);

    function abc(address _addr, uint etc) external {
        emit Log(msg.data);
    }

    //0xbdc5ea0b-- this is function selector[First 4 bytes of msg.data]
    // so above thing contains the value about data.  
    //000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb2000000000000000000000000000000000000000000000000000000000000007b
}