*** Settings ***
Documentation        Arquivpo principal

Library    Browser
Library    lib/Account.py
Library    lib/Database.py
Library    JSONLibrary

Resource    pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Accounts.resource
Resource    pages/components/Toast.resource
Resource    pages/components/BoxNotice.resource


*** Keywords ***
Start Session
    New Browser     chromium    headless=False
    New Page        http://localhost:3000    

Get Json fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load Json From File    
    ...        ${EXECDIR}/resources/fixtures/${file_name}.json
    ...        encoding=utf-8

    RETURN    ${data}[${scenario}]

    # /home/cristiano/Documentos/GitHub/smartbit/front-end/resources/fixtures/memberships.json