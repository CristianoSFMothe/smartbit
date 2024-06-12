*** Settings ***
Documentation        Arquivpo principal

Library    Browser
Library    lib/Account.py

Resource    pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Accounts.resource


*** Keywords ***
Start Session
    New Browser     chromium    headless=False
    New Page        http://localhost:3000    