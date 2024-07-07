*** Settings ***
Documentation    Arquivo priuncipal do projeto de teste automatizados para mobile

Library    AppiumLibrary
Library    JSONLibrary
Library    ../../lib/Database.py

Resource    ./actions/login.resource
Resource    ./actions/account.resource
Resource    ./actions/mybody.resource
Resource    ./actions/components/popup.resource
Resource    ./actions/components/menu.resource

Resource    ../../services/Service.resource

*** Keywords ***
Start session

    Open Application    http://localhost:4723    
    ...                 platformName=Android
    ...                 deviceName=Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    Wait Until Page Contains    IP da API    30s


Finish session
    
    Capture Page Screenshot
    Close Application

Get Json fixture
    [Arguments]    ${scenario}

    ${data}    Load Json From File    
    ...        ${EXECDIR}/resources/fixtures/data.json
    ...        encoding=utf-8

    RETURN    ${data}[${scenario}]