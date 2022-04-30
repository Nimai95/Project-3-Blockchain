pragma solidity ^0.5.5;

import "./xroTokenMintable.sol";

contract Loan {
    address payable public lender;
    address payable public borrower;
    AssetToken public token;
    uint256 public collateralAmount;
    uint256 public payoffAmount;
    uint256 public dueDate;
    uint public startOn;


    constructor(
        address payable Lender,
        address payable Borrower,
        AssetToken Token,
        uint256 CollateralAmount,
        uint256 PayoffAmount,
        uint256 LoanDuration
    ) public {
        lender = Lender;
        borrower = Borrower;
        token = Token;
        collateralAmount = CollateralAmount;
        payoffAmount = PayoffAmount;
        startOn = block.timestamp;
        dueDate = startOn + LoanDuration;
    }


    event LoanPaid();

    function payLoan() public payable {
        // require(block.timestamp <= dueDate); 
        require(msg.value == payoffAmount);
        require(token.transfer(borrower, collateralAmount)); 
        emit LoanPaid();

    }
    event LoanDefault();
    function collateralLiquidate() public payable {
        // require(block.timestamp > dueDate); 
        require(token.transfer(lender, collateralAmount)); 
        emit LoanDefault();
    }
}
    