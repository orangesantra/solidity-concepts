// Multi Call
// An example of contract that aggregates multiple queries using a for loop and staticcall.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MultiCall {
    function multiCall(
        address[] calldata targets,
        bytes[] calldata data
    ) external view returns (bytes[] memory) {
        require(targets.length == data.length, "target length != data length");

        bytes[] memory results = new bytes[](data.length);
 // ###########################  
 // staticcall used instead of call, because multiCall is a view function and call is basicallly used to maody the 
 // state of blockchain, which is contradictory to using 'view', it will throw error, so staticcall was used instead of
 // call, just to read the data not to modify it.  

        for (uint i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].staticcall(data[i]);
            // staticcall=> because we are just qurying
            // use call => whn making any transaction to contract, or writing to any state variable.
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }
}
// Contract to test MultiCall

contract TestMultiCall {
    function test(uint _i) external pure returns (uint) {
        return _i;
    }

    function getData(uint _i) external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.test.selector, _i);
    }
}