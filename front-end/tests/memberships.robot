*** Settings ***
Documentation        Suite de teste de adesões de planos

Resource    ../resources/Base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão

    ${data}    Get Json fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    SignIn admin    

    Go to memberships
    Create new membership    ${data}    

    Toast should be    Matrícula cadastrada com sucesso.  


