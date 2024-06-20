*** Settings ***
Documentation    Ações e elementos da página de matriculas

Library    Browser

*** Keywords ***
Create new membership
    [Arguments]    ${data}

    Go to memberships form
    Select account        ${data}[account][name]        ${data}[account][cpf]
    Select plan           ${data}[plan][name]
    Fill payment card     ${data}[credit_card]

    Click        css=button[type=submit] >> text=Cadastrar

Go to memberships form

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
    [Arguments]    ${credit_card}

    Fill Text    css=input[name=card_number]    ${credit_card}[number]
    Fill Text    css=input[name=card_holder]    ${credit_card}[holder]
    Fill Text    css=input[name=card_month]     ${credit_card}[month]
    Fill Text    css=input[name=card_year]      ${credit_card}[year]
    Fill Text    css=input[name=card_cvv]       ${credit_card}[cvv]

Request removal by name
    [Arguments]    ${name}

    Click    xpath=//td[text()="${name}"]/..//button

Membershio should not be visible
    [Arguments]    ${name}

    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    detached     5

    