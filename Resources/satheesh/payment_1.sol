pragma solidity ^0.5.0;

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
    roi r;
    address lender;
    address borrower;
    uint256 repaymentPeriod;
    uint256 loanAmount;

    roi public interestRate;
    constructor(
        address _lender,
        address _borrower,
        uint256 _roiNumerator,
        uint256 _roiDenominator,
        uint256 repaymentNumberofYears,
        uint256 _loanAmount
    )

    public
    {
        lender = _lender;
        borrower = _borrower;
        r.numerator = _roiNumerator;
        r.denominator = _roiDenominator;
        repaymentNumberofYears = repaymentPeriod;
        loanAmount = _loanAmount;
        uint256 i = _loanAmount * repaymentPeriod * r.numerator;
        uint256 totalRepayment = loanAmount + i;
    }
}
    function getloan() view public return (uint256) {
        return totalRepayment
    }
