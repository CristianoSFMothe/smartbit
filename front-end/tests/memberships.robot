*** Settings ***
Documentation        Suite de teste de adesões de planos

Resource    ../resources/Base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
    [Tags]    create_membership

    ${data}    Get Json fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    SignIn admin    

    Go to memberships
    Create new membership    ${data}    

    Toast should be    Matrícula cadastrada com sucesso.  

Não deve realizar a adesão duplicado
    [Tags]    dup_membership

    ${data}    Get Json fixture    memberships    duplicate
    
    Insert Membership    ${data} 

    SignIn admin    
    Go to memberships
    Create new membership    ${data}   
    Toast should be    O usuário já possui matrícula.  
