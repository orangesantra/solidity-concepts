// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// custom error

// # -> Other Cases;

error Unauthorized();
// # - error Unauthorized(address caller);

function helper(uint x) view returns (uint) {
}

contract VendingMachine {   
    address payable owner = payable(msg.sender);

    function withdraw() public {
        if (msg.sender != owner)
        // revert("error") - This will consume more gas as compared to below code and gas conumption will increase as 
        // as the lenth of string increases. 

        // # - revert Unauthorized(msg.sender); i.e. it can be used as event declaration.
            revert Unauthorized();

        owner.transfer(address(this).balance);
    }
    // ...
}