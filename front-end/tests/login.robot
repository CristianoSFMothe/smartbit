*** Settings ***
Documentation    Cenários de teste de Login SAC


Resource    ../resources/Base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar como Gestor de Academia
    [Tags]    access_login_sac
    
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com 

Não deve logar com senha incorreta
    [Tags]    pass_inv
    
    Go to login page
    Submit login form    sac@smartbit.com    pwd1234
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com e-mail não cadastrado
    [Tags]    email_inv
    
    Go to login page
    Submit login form    404@smartbit.com    pwd1234
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com dados incorretos
    [Tags]        email_fall
    [Template]    Login with verify notice

    ${EMPTY}               ${EMPTY}    Os campos email e senha são obrigatórios.
    ${EMPTY}               pdw123      Os campos email e senha são obrigatórios.
    sac@smartbit.com       ${EMPTY}    Os campos email e senha são obrigatórios.
    www.sacsmartbit.com    pwd1234     Oops! O email informado é inválido
    sac&smartbit.com       pwd1234     Oops! O email informado é inválido
    111121233              pwd1234     Oops! O email informado é inválido
    asfasrqr               pwd1234     Oops! O email informado é inválido
    @#/*-%&                pwd1234     Oops! O email informado é inválido
    teste*gmail.com        pwd1234     Oops! O email informado é inválido
    teste.com@$&*          pwd1234     Oops! O email informado é inválido
    
    
*** Keywords ***
Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}

    Go to login page
    Submit login form    ${email}      ${password}
    Notice should be     ${output_message}