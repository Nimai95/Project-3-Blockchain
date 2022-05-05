pragma solidity 0.5.5;

interface TERC20Token {
    function balanceof(address owner) public returns (uint256);
    function transfer(address to, uint256 amount) public returns (bool);
    function decimals() public returns (uint256);
    
}