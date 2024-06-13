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
    [Tags]    email_404
    
    Go to login page
    Submit login form    404@smartbit.com    pwd1234
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!
    
