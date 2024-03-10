// SPDX-License-Identifier: MIT
pragma solidity ^0.8;



// functions outside contract

// function helper(uint x) view returns (uint) {
//     return x * 2;
// }

contract SimpleAuction {
    function bid() public payable { // Function
        // ...
    }
}

contract TestHelper {
    function test() external view returns (uint) {
        return helper(123);
    }
}

// * import {symbol1 as alias, symbol2} from "filename";
import { Unauthorized, helper as h1 } from "./L02-Custom_Error.sol";

function helper(uint x) view returns (uint) {
}
