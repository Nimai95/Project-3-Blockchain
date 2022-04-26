pragma solidity ^0.5.5;

import 

contract Loan {
    address public lender;
    address public borrower;
    uint256 public collateralAmount;
    uint256 public payoffAmount;
    uint256 public dueDate;

    function Loan(
        address _lender
        address _borrower
        uint256 _collateralAmount,
        uint256 _payoffAmount,
        uint256 loanDuration
    )
        public
    {
        lender = _lender;
        borrower = _borrower;
        //token = _token;
        collateralAmount = _collateralAmount;
        payoffAmount = _payoffAmount;
        dueDate = now + loanDuration;
    }
}
