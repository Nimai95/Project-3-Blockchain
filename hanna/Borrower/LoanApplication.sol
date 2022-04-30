

pragma solidity ^0.5.5;

import "./Loan.sol";

contract LoanApplication {

    address payable public borrower;  
    AssetToken public token; 
    uint256 public collateralAmount; 
    uint256 public loanAmount; 
    uint256 public payoffAmount; 
    uint256 public loanDuration; 
    
    constructor(
        AssetToken Token,
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

    function lendEther() public payable {
        require(msg.value == loanAmount);

        loan = new Loan(
            msg.sender,
            borrower,
            token,
            collateralAmount,
            payoffAmount,
            loanDuration
        );

        require(token.transferFrom(borrower, address(loan), collateralAmount));
        borrower.transfer(loanAmount); 
        emit LoanApproval(address(loan)); 
    }
}
