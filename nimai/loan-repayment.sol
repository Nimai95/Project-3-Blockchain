pragma solidity ^0.5.5;

contract loan{

    address lender;

    constructor() public {
        lender=msg.sender;
    }

    struct Loan {
        address borrower;
        address token;
        uint256 amount;
        bool repaid;
    }

    //mapping (bytes => loan) public loans;
}  

    //function issue(bytes32 id, address recipient, address token, uint256 value) public returns (bool){
    //make sure it is the loaner that is loaning
   // require(msg.sender==loaner,"Loan::issue only loaner can loan");
    //make sure there isnt already a fund here
   // require(loans[id].recipient==address(0),"Loan::issue id already exists");
    //store loan information
    //loans[id] = Loan({
    //  recipient: recipient,
    //  token: token,
    //  amount: value,
    //  repaid: false
    //});
    //transfer tokens to recipient
    //IERC20(token).transfer(recipient,value);
    //fire event for logging
   // emit Issue(id, recipient, token, value);
    return true;
  }
  //event Issue(bytes32 id, address recipient, address token, uint256 value);

  function repay(bytes32 id) public returns (bool){
      require(loans[id].borrower!=address(0),);
      require(loans[id].repaid);
      loans[id].repaid = true;
      //transfer funds from the borrower and verfiy
      uint256 startingBalance = IERC20(loans[id].token).balanceof(address(this));
      IERC20(loans[id].token).transferFrom(msg.sender, address(this), loans[id].amount);
        require(
     (startingBalance+loans[id].amount) == IERC20(loans[id].token).balanceOf(address(this)),
     "ERC20 Balance did not change correctly"
    );
    //emit event for logging
    emit Repay(id,loans[id].borrower,loans[id].token,loans[id].amount);
    return true;
  }
  event Repay(bytes32 id, address borrower, address token, uint256 value);
  }