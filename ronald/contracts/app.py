##########################################################
# Imports
import os
import json
import streamlit as st
from dataclasses import dataclass
from typing import Any, List
from pathlib import Path
from dotenv import load_dotenv
from web3 import Web3
# w3 = Web3(Web3.HTTPProvider('HTTP://127.0.0.1:8545'))
##########################################################

load_dotenv()

# Define and connect a new Web3 provider
w3 = Web3(Web3.HTTPProvider(os.getenv("WEB3_PROVIDER_URI")))

##########################################################
# Contract Helper function:
# 1. Loads the contract once using cache
# 2. Connects to the contract using the contract address and ABI
##########################################################

# Cache the contract on load
@st.cache(allow_output_mutation=True)

# Define the load_contract function
def load_contract():

    # Load Art Gallery ABI
    with open(Path('compiled/xroToken_abi.json')) as f:
        certificate_abi = json.load(f)

    # Set the contract address (this is the address of the deployed contract)
    contract_address = os.getenv("SMART_CONTRACT_ADDRESS")

    # Get the contract
    contract = w3.eth.contract(
        address=contract_address,
        abi=certificate_abi
    )
    # Return the contract from the function
    return contract


# Load the contract
contract = load_contract()


##########################################################
# Streamlit code
##########################################################

# Streamlit application headings
st.markdown("# xroToken")
st.markdown("by The Graces xro Smart Contracts will work in this UI2")
st.text("\n")