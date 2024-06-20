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
Resource    pages/Memberships.resource
Resource    pages/components/Toast.resource
Resource    pages/components/Navbar.resource
Resource    pages/components/BoxNotice.resource
Resource    pages/components/Modal.resource

*** Variables ***
${ADMIN_EMAIL}    sac@smartbit.com    
${ADMIN_PASS}     pwd123


*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False    
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       http://localhost:3000    

Get Json fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load Json From File    
    ...        ${EXECDIR}/resources/fixtures/${file_name}.json
    ...        encoding=utf-8

    RETURN    ${data}[${scenario}]

SignIn admin

    Go to login page
    Submit login form    ${ADMIN_EMAIL}   ${ADMIN_PASS}
    User is logged in    ${ADMIN_EMAIL}

Search by name
    [Arguments]        ${name}

    Fill Text    css=input[placeholder^=Busque]    ${name}

    Wait For Elements State    css=strong >> text=Total: 1
    ...                        visible    5

Should filter by name
    [Arguments]    ${name}

    Wait For Elements State    css=table tbody tr >> text=${name}
    ...                        visible    5
