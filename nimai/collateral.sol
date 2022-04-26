pragma solidity ^0.5.5;

import

contract LoanRequest {
    address public borrower = msg.sender;
    //token
    uint256 public collateralAmount;
    uint256 public loanAmount;
    uint256 public payoffAmount;
    uint256 public loanDuration;

    function LoanRequest(
        //token
        uint256 _collateralAmount,
        uint256 _loanAmount,
        uint256 _payoffAmount,
        uint256 _loanDuration
    )
    public
    {
        //token = _token
        collateralAmount = _collateralAmount;
        loanAmount = _loanAmount;
        payoffAmount = _payoffAmount;
        loanDuration = _loanDuration;
    }

    Loan public loan;
}