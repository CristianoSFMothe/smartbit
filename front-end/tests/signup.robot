*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource       ../resources/Base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve inicia o cadastro do cliente
    [Tags]    login

    ${account}    Get Fake Account
   
    Submit sigunp form    ${account}  
    Verify welcome messagem 

Tentativa de pré-cadastro
    [Tags]        attempt

    [Template]    Attempt signut

    ${EMPTY}              cristiano@gmail.com    91314080016      Por favor informe o seu nome completo
    Cristiano Ferreira    ${EMPTY}               91314080016      Por favor, informe o seu melhor e-mail
    Cristiano Ferreira    cristiano@gmail.com    ${EMPTY}         Por favor, informe o seu CPF
    Cristiano Ferreira    cristiano*gmail.com    91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    www.teste.com.br       91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    aaabbbb                91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    1111111                91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    */-/@#*                91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    cristiano@gmail.com    91314080022      Oops! O CPF informado é inválido
    Cristiano Ferreira    cristiano@gmail.com    9131408          Oops! O CPF informado é inválido
    Cristiano Ferreira    cristiano@gmail.com    AABBAS           Oops! O CPF informado é inválido
    Cristiano Ferreira    cristiano@gmail.com    @#$%¨%@          Oops! O CPF informado é inválido

*** Keywords ***
Attempt signut
    [Arguments]        ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...           name=${name}
    ...           email=${email}
    ...           cpf=${cpf}
   
    Submit sigunp form    ${account}
    Notice should be      ${output_message}



