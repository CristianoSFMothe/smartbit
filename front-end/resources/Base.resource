*** Settings ***
Documentation        Arquivpo principal

Library    Browser
Library    lib/Account.py

Resource    pages/Landing.resource
Resource    pages/Welcome.resource


*** Keywords ***
Start Session
    New Browser     chromium    headless=False
    New Page        http://localhost:3000    