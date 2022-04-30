pragma solidity ^0.5.5;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract Interest{

    using SafeMath for uint;
    uint256 mulResult;
    uint256 mulResult2;
    uint public MAX_VALUE = 2**256 -1;

    function getResults(uint256 LoanAmount, uint256 interest, uint256 term) public{
        mulResult = SafeMath.mul(LoanAmount, SafeMath.mul(interest, term));

    }
    function mulResultVal() public view returns(uint256){
        return mulResult;
    }

    }