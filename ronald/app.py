# imports
import streamlit as st

# functions from xro_eth_acc.py
from xro_eth_acc import generate_account
from web3 import Web3

# ganache
w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:8545'))

# import the functions from xro_eth_acc.py
account = generate_account(w3)

##########################################################
# streamlit code
##########################################################

st.markdown("# xroToken: MetaMask account listing")
st.text("\n")

# list of ganache accounts
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

# r:    omit streamlit footer
hide_streamlit_style = """
            <style>
            #MainMenu {visibility: visible;}
            footer {visibility: hidden;}
            </style>
            """
st.markdown(hide_streamlit_style, unsafe_allow_html=True) 