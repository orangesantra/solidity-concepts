// delegatecall is a low level function similar to call.
// When contract A executes delegatecall to contract B, B's code is executed
// with contract A's storage, msg.sender and msg.value.

// ####################---- SEE-VIDEO---||ULTRA PRO MAX||----#################


// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// NOTE: Deploy this contract first
contract B {
    // VVIMP
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        // the caller of below logic is not coontract A instead its caller of one upperlevel function that is the
        // the first account in remix console.so msg.sender is that account not the contract A.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}