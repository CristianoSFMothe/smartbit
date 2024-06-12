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