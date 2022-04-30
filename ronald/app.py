# Imports
import streamlit as st

# Import the functions from ethereum.py
from xro_eth_acc import generate_account
from web3 import Web3

w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:8545'))

##########################################################

# Import the functions from ethereum.py
account = generate_account(w3)

##########################################################
# Streamlit code
##########################################################

# Streamlit response test
st.markdown("# xroToken: MetaMask account listing")
st.text("\n")

# list of Ganache accounts
# Write the Ethereum account address to the Streamlit page
st.markdown("default ganache blockchain address")
st.write(account.address)
st.text("\n")

st.markdown(
    """
        to do / can do?
        * list currently active instead of default acc.  
        * list all accs. 
        * list balances
    """
    )
st.text("\n")

# st.markdown("***todo: list all accs.")
# st.text("\n")

# r:    omit Streamlit footer
hide_streamlit_style = """
            <style>
            #MainMenu {visibility: visible;}
            footer {visibility: hidden;}
            </style>
            """
st.markdown(hide_streamlit_style, unsafe_allow_html=True) 