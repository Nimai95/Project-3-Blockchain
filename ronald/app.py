# imports
import streamlit as st

# functions from xro_eth_acc.py
from xro_eth_acc import generate_account
from web3 import Web3

# ganache
w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:8545'))

# import the functions from xro_eth_acc.py
account_default = generate_account(w3)

##########################################################
# streamlit code
##########################################################

st.markdown("# xroToken: MetaMask account listing")
st.text("\n")

# list default ganache account
st.markdown("### default ganache blockchain address")
st.write(account_default.address)
st.text("\n")

# streamlit -> ganache list all accounts
st.markdown("### list all accs.: local/ganache blockchain")

st.markdown(w3.eth.accounts)
st.text("\n")


st.markdown(
    """
        ## to do / can do?
        * ~list all accs.~
        * ~list balances~
        * list a Loan.sol > constructor: loan > public func. var and balance
        * layout the public func. var and balance  
    """
)
st.text("\n")

##########################################################
# web3.py tests
##########################################################
st.markdown("### checking an eth address is valid with the is_address method")
# checking an eth address is valid with the is_address method
is_address_valid = w3.isAddress('0xc77A2d2E0dC9C35076B5C0aaCf84Fb92092A55FE')

st.markdown(is_address_valid) # r: returns True
st.text("\n")


# balance in a hardcoded Ethereum address
st.markdown("### balance in an Ethereum address")
check_sum = w3.toChecksumAddress('0xc77A2d2E0dC9C35076B5C0aaCf84Fb92092A55FE')
balance = w3.eth.get_balance(check_sum)

st.markdown(balance)
st.text("\n")


# balance in an Ethereum address var
acc_default = account_default.address 

st.markdown("### balance in an Ethereum address passed as a var") 
check_sum_1 = w3.toChecksumAddress(str(acc_default))
balance = w3.eth.get_balance(check_sum_1)

st.markdown(acc_default)
st.markdown(balance)
st.text("\n")


# list public constructor accounts and balances from Loan.sol smart contract

##########################################################
# r:    omit streamlit footer
hide_streamlit_style = """
    <style>
        #MainMenu {visibility: hidden;}
        footer {visibility: hidden;}
    </style>
"""
st.markdown(hide_streamlit_style, unsafe_allow_html=True) 