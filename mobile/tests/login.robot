*** Settings ***
Documentation        Suite de teste de login

Resource    ../resources/Base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve logar com o IP e CPF

    Input Text    xpath=//android.widget.EditText[@resource-id="ipAddress"]    10.0.0.40
    Input Text    xpath=//android.widget.EditText[@resource-id="cpf"]          08073810042

    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]    30s
    Element Name Should Be   xpath=//android.widget.TextView[@resource-id="myAccountTitle"]    Sua transformação começa aqui!