pragma solidity ^0.5.5

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract loan {
        using SafeMath for uint256;
    struct roi {
        //struct is a collection of variables under a single name
        uint256 numerator;
        uint256 denominator;
    }
    address lender;
    address borrower;
    uint256 repaymentPeriod;
    uint256 loanAmount;

    roi public interestrate;
    constructor(
        address _lender;
        address _borrower;
        uint256 roiNumerator;
        uint256 roiDenominator;
        uint256 repaymentNumberofYears;
        uint256 _loanAmount;
    )
    public
    {
        lender = _lender;
        borrower = _borrower;
        numerator = roiNumerator;
        denominator = roiDenominator;
        repaymentNumberofYears = repaymentPeriod;
        loanAmount = _loanAmount;
        uint256 i = _loanAmount * repaymentPeriod * roiNumerator;
        uint256 totalRepayment = _loanAmount + i;
    }
}
