/*
xro token crowdsale
*/

pragma solidity ^0.5.5;

import "./xroTokenMintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract xro_TokenCrowdsale is Crowdsale, MintedCrowdsale{
    constructor(
        uint256 rate,
        address payable wallet,
        xro_Token token
    )
    Crowdsale(
        rate,
        wallet,
        token
    )
    public{
        // intentionally blank
    }
}

contract XP_TokenCrowdsaleDeployer{
    address public xro_token_address;
    address public xro_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    )
    public{
        // xro_Token token = new xro_Token(
        //     name,
        //     symbol,
        //     0
        // );
        // xro_token_address = address(token);
        // xro_TokenCrowdsale xro_crowdsale = new xro_TokenCrowdsale(
        //     1,
        //     wallet,
        //     token
        // );
        // xro_crowdsale_address = address(xro_crowdsale);
        // token.addMinter(xro_crowdsale_address);
        // token.renounceMinter();
    }
}
