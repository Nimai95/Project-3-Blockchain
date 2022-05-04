pragma solidity ^0.5.5;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";
import "./LoanApplication.sol";

contract Interest{

    using SafeMath for uint;
    uint256 interesttopay;
    uint128 public pct = 100;
    
    function getResults(uint256 LoanAmount, uint256 interest, uint256 term) public{
        interesttopay = SafeMath.mul(LoanAmount, SafeMath.mul(interest, term));

    }
    function interestval() public view returns(uint256){
        return interesttopay;
    }
    function interestcal() public view returns(uint256){
        return (interesttopay/pct);
    }
    }
