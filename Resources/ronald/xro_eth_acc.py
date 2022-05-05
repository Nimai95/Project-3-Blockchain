# xro: Ethereum Account Functions

################################################################################

# Imports
import os
import requests
from dotenv import load_dotenv
load_dotenv()
from bip44 import Wallet
from web3 import Account
from web3 import middleware
from web3.gas_strategies.time_based import medium_gas_price_strategy
from web3 import Web3
w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:8545'))
################################################################################

# Create a function called `generate_account` that automates the Ethereum
# account creation process
def generate_account(w3):
    """Create a digital wallet and Ethereum account from a mnemonic seed phrase."""
    # Access the mnemonic phrase from the `.env` file
    mnemonic = os.getenv("MNEMONIC")

    # Create Wallet object instance
    wallet = Wallet(mnemonic)

    # Derive Ethereum private key
    private, public = wallet.derive_account("eth")

    # Convert private key into an Ethereum account
    account_default = Account.privateKeyToAccount(private)

    # Return the account from the function
    return account_default


# # function called `list_all_account` that fetches all the accounts in MetaMask
# def list_all_account(w3):
#     # Access the mnemonic phrase from the `.env` file
#     mnemonic = os.getenv("MNEMONIC")

#     # Create Wallet object instance
#     wallet = Wallet(mnemonic)

#     # Derive Ethereum private key
#     private, public = wallet.derive_account("eth")

#     # Convert private key into an Ethereum account
#     account_all = Account.privateKeyToAccount(private)

#     # Return the account from the function
#     return account_all