*** Settings ***
Documentation        Ações e elementos da tealda de envio de medidas

Library    AppiumLibrary

*** Keywords ***
Send weight and height
    [Arguments]    ${accout}

    Wait Until Page Contains    Registre ou atualize suas medidas    30s

    Input Text    xpath=//android.widget.EditText[@resource-id="weight"]    ${accout}[weight]
    Input Text    xpath=//android.widget.EditText[@resource-id="height"]    ${accout}[height]
    Click Element   xpath=//android.widget.TextView[@text="Enviar minhas medidas"]