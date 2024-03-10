// WETH -> Wrapped Ether
// When we deposite ETH in WETH contract, it converts deposited ether into ERC20 Token [WETH] or mints WETH Tokens 
// to address.
// When we withdraw ETH from WETH contract, it burns WETH and and sends that equivalent of ETH back to address.

// Instead of creating two sepertae contracts for eth and erc20 token, we can allow interaction of ERC20 token directly 
// with WETH. and if that contract wants to implement ETH, that can interact with WETH, instead of ETH
// so WETH is bridge between ETH and ERC20 token. 