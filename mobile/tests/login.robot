*** Settings ***
Documentation        Suite de teste de login

Resource    ../resources/Base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve logar com o IP e CPF
    [Tags]    login

    ${data}    Get Json fixture    login

    Insert Membership    ${data}

    Signin with document    ${data}[account][cpf]
    User is logged in

Não deve logar com CPF não cadastrado
    [Tags]    fail

    Signin with document    30890557080
    Popup have text         Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com CPF inválido
    [Tags]    cpf_invalid

    Signin with document    30890557081
    Popup have text         CPF inválido, tente novamente

Não deve logar sem informar CPF 
    [Tags]    cpf_empty

    Signin with document    ${EMPTY}
    Popup have text         Informe o número do seu CPF
    