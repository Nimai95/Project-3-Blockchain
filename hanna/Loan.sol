pragma solidity ^0.5.5;

import "./xroTokenMintable.sol";

contract Loan {
    address public lender;
    address public borrower;
    xro_Token public token;
    uint256 public collateralAmount;
    uint256 public payoffAmount;
    uint256 public dueDate;

    constructor(
        address Lender,
        address Borrower,
        xro_Token Token,
        uint256 CollateralAmount,
        uint256 PayoffAmount,
        uint256 loanDuration
    ) public {
        lender = Lender;
        borrower = Borrower;
        token = Token;
        collateralAmount = CollateralAmount;
        payoffAmount = PayoffAmount;
        dueDate = block.timestamp + loanDuration;
    }


    event LoanPaid();

    function payLoan() public payable {
        require(block.timestamp <= dueDate); 
        require(msg.value == payoffAmount);

        require(token.transfer(borrower, collateralAmount)); 
        emit LoanPaid();

    }
    event LoanDefault();
    function collateralLiquidate() public {
        require(block.timestamp > dueDate); 
        require(token.transfer(lender, collateralAmount)); 

    }
}
