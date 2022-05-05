

pragma solidity ^0.5.5;

import "./Loan.sol";

contract LoanApplication {

    address payable public borrower;  
    AssetToken public token; // Token the borrower will be used as collateral
    uint256 public collateralAmount; 
    uint256 public loanAmount; //Principle
    uint256 public payoffAmount; //Principle + Interest
    uint256 public loanDuration; // in seconds
    
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
        ); // info of loan 

        require(token.transferFrom(borrower, address(loan), collateralAmount)); // require borrower to send Collateral Amount to Loan Contract
        borrower.transfer(loanAmount); 
        emit LoanApproval(address(loan)); 
    }
}
