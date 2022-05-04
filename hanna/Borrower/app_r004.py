import os
import json
from web3 import Web3
from pathlib import Path
from dotenv import load_dotenv
import streamlit as st

load_dotenv()

# Define and connect a new Web3 provider
w3 = Web3(Web3.HTTPProvider(os.getenv("WEB3_PROVIDER_URI")))

################################################################################
# Contract Helper function:
# 1. Loads the contract once using cache
# 2. Connects to the contract using the contract address and ABI
################################################################################

# Cache the contract on load
@st.cache(allow_output_mutation=True)
# Define the load_contract function
def load_contract():

    # Load Art Gallery ABI
    with open(Path('compiled/Loan_abi.json')) as f:
        token_abi = json.load(f)

    # Set the contract address (this is the address of the deployed contract)
    contract_address = os.getenv("SMART_CONTRACT_ADDRESS")

    # Get the contract
    contract = w3.eth.contract(
        address=contract_address,
        abi=token_abi
    )
    # Return the contract from the function
    return contract


# Load the contract
contract = load_contract()


################################################################################
# Minting Tokens
################################################################################

accounts = w3.eth.accounts
account = accounts[0]
# inv_account = st.selectbox("Select Investor Account", options=accounts)
token_details = st.text_input("Token Details", value="mintingToken")
if st.button("Mint Token"):
    contract.function.payLoan(borrower)

################################################################################
# Display Certificate
################################################################################
# certificate_id = st.number_input("Enter a Certificate Token ID to display", value=0, step=1)
# if st.button("Display Certificate"):
#     # Get the certificate owner
#     certificate_owner = contract.functions.ownerOf(certificate_id).call()
#     st.write(f"The certificate was awarded to {certificate_owner}")

#     # Get the certificate's metadata
#     certificate_uri = contract.functions.tokenURI(certificate_id).call()
#     st.write(f"The certificate's tokenURI metadata is {certificate_uri}")
