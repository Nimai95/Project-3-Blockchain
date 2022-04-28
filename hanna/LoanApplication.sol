

pragma solidity ^0.5.5;

import "./Loan.sol";

contract LoanApplication {

    address public borrower; 
    xro_Token public token; 
    uint256 public collateralAmount; 
    uint256 public loanAmount; 
    uint256 public payoffAmount; 
    uint256 public loanDuration; 

    constructor(
        xro_Token Token,
        uint256 CollateralAmount,
        uint256 LoanAmount,
        uint256 PayoffAmount,
        uint256 LoanDuration
    ) public {
        borrower = msg.sender;
        token = Token;
        collateralAmount = CollateralAmount;
        loanAmount = LoanAmount;
        payoffAmount = PayoffAmount;
        loanDuration = LoanDuration;
    }


    Loan public loan;

    event LoanApproval(address loan);

    function lendEther() payable public {
        require(msg.value >= loanAmount);
        require(msg.sender == borrower);
        loan = new Loan(
            msg.sender,
            borrower,
            token,
            collateralAmount,
            payoffAmount,
            loanDuration
        );

        // require(token.transferFrom(borrower, address(loan), collateralAmount));
        msg.sender.transfer(loanAmount); 
        emit LoanApproval(address(loan)); 
    }
}
