*** Settings ***
Documentation        Ações e elementos da tela de login

Library    AppiumLibrary

*** Keywords ***
Signin with document
    [Arguments]    ${cpf}

    Input Text    xpath=//android.widget.EditText[@resource-id="ipAddress"]    10.0.0.40
    Input Text    xpath=//android.widget.EditText[@resource-id="cpf"]          ${cpf}

    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]