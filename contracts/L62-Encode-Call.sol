// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// ################################### 
// There are three ways to pass data when using call, encodeWithSignature, encodeWithSelector, encodeCall
// All three functions will return same outputs
// in encodeWithSignature typo of signatuture is not checked durig compilation
// in encodeWithSelector , wrong input to function is not checked
// in encodeCall, any thing wrong either in function signature or input parameter, will throw a compilation error.

interface IERC20 {
    function transfer(address, uint) external;
}

contract Token {
    function transfer(address, uint) external {}
}

contract AbiEncode {
    function test(address _contract, bytes calldata data) external {
        (bool ok, ) = _contract.call(data);
        require(ok, "call failed");
    }

    function encodeWithSignature(
        address to,
        uint amount
    ) external pure returns (bytes memory) {
        // Typo is not checked - "transfer(address, uint)"
        return abi.encodeWithSignature("transfer(address,uint256)", to, amount);
    }

    function encodeWithSelector(
        address to,
        uint amount
    ) external pure returns (bytes memory) {
        // Type is not checked - (IERC20.transfer.selector, true, amount)
        return abi.encodeWithSelector(IERC20.transfer.selector, to, amount);
    }

    function encodeCall(address to, uint amount) external pure returns (bytes memory) {
        // Typo and type errors will not compile
        return abi.encodeCall(IERC20.transfer, (to, amount));
    }
}