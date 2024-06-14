*** Settings ***
Documentation        Suite de teste de adesões de planos

Resource    ../resources/Base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão

    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

    Go to Enrolls
    Go to enroll form
    Select account    Cristiano Ferreira    42945318008
    Select plan       Plano Black
    Fill payment card      4242424242424242
    ...                    Cristiano Ferreira
    ...                    12
    ...                    2030
    ...                    123

    Click        css=button[type=submit] >> text=Cadastrar

    Toast should be    Matrícula cadastrada com sucesso.
    
    
    Sleep    3

*** Keywords ***
Go to Enrolls 

    Click    css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas    visible    5

Go to enroll form

    Click    css=a[href="/memberships/new"]

    Wait For Elements State    css=h1 >> text=Nova matrícula    visible    5
    

Select account
    [Arguments]    ${name}    ${cpf}

    Fill Text    css=input[aria-label=select_account]    ${name}
    Click        css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan}

    Fill Text        css=input[aria-label=select_plan]    Plano Black
    Click            css=div[class$=option] >> text=Plano Black

Fill payment card
    [Arguments]    ${number}    ${holder}    ${month}    ${year}    ${cvv}

    Fill Text    css=input[name=card_number]    ${number}
    Fill Text    css=input[name=card_holder]    ${holder}
    Fill Text    css=input[name=card_month]     ${month}
    Fill Text    css=input[name=card_year]      ${year}
    Fill Text    css=input[name=card_cvv]       ${cvv}
