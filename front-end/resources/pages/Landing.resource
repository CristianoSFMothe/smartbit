*** Settings ***
Documentation        Ações e elementos da Landing Page

Library        Browser

*** Keywords ***
Submit sigunp form
    [Arguments]      ${account_cpf_dup}

    Click            css=button >> text=Bora treinar conosco?

    Get Text        css=#signup h2   equal    
    ...             Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name        ${account_cpf_dup}[name]
    Fill Text        id=email       ${account_cpf_dup}[email]
    Fill Text        id=cpf         ${account_cpf_dup}[cpf]

    Click            css=button >> text=Cadastrar
