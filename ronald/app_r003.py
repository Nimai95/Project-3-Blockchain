# Streamlit Application

# Imports
import streamlit as st

# Import the functions from ethereum.py
from ethereum import w3, generate_account, get_balance, send_transaction
from web3 import Web3

w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:8545'))

##########################################################
#   set streamlit options
##########################################################

# r:    default: wide mode
st.set_page_config(
    page_title="Project 3: ETH",
    page_icon=None,
    layout="wide",
    initial_sidebar_state="auto",
    menu_items=None
)

# r:    default: omit footer
hide_streamlit_style = """
    <style>
        #MainMenu {visibility: visible;}
        footer {visibility: hidden;}
    </style>
"""
st.markdown(hide_streamlit_style, unsafe_allow_html=True) 

################################################################################
# Streamlit Code

# Streamlit application headings
st.markdown("# Automating Ethereum with Streamlit!")

#######################################

# Generate the Ethereum account
account = generate_account(w3)

#######################################

# The Ethereum Account Address
st.text("\n")
st.text("\n")
st.markdown("## Ethereum Account Address:")

# Write the Ethereum account address to the Streamlit page
st.write(account.address)

#######################################

# Display the Etheremum Account balance
st.text("\n")
st.text("\n")
st.markdown("## Ethereum Account Balance:")

# Call the get_balance function and write the account balance to the screen
ether_balance = get_balance(w3, account.address)
st.write(ether_balance)

#######################################

# An Ethereum Transaction
st.text("\n")
st.text("\n")
st.markdown("## An Ethereum Transaction")

# Create inputs for the lender address and lender_ether amount
lender = st.text_input("Input the lender address")
lender_ether = st.number_input("Input the amount of ether", key = "lend")

# recveirver: Create a button that calls the `send_transaction` function and returns the transaction hash
if st.button("Send Transaction",  key = "lend"):

    transaction_hash = send_transaction(w3, account, lender, lender_ether)

    # Display the Etheremum Transaction Hash
    st.text("\n")
    st.text("\n")
    st.markdown("## Ethereum Transaction Hash:")

    st.write(transaction_hash)

st.text("\n")
st.text("\n")

# Create inputs for the receiver address and ether amount
receiver = st.text_input("Input the receiver address")
receiver_ether = st.number_input("Input the amount of ether", key = "<recieve>")

# recveirver: Create a button that calls the `send_transaction` function and returns the transaction hash
if st.button("Send Transaction", key = "<recieve>"):

    transaction_hash = send_transaction(w3, account, receiver, receiver_ether)

    # Display the Etheremum Transaction Hash
    st.text("\n")
    st.text("\n")
    st.markdown("## Ethereum Transaction Hash:")

    st.write(transaction_hash)
