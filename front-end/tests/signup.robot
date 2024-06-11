*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Library        Browser

Resource       ../resources/Base.resource

*** Test Cases ***
Deve inicia o cadastro do cliente

    ${account}    Get Fake Account

    New Browser     chromium    headless=False
    New Page        http://localhost:3000
    Scroll To Element    id=signup

    Get Text        css=#signup h2   equal    
    ...             Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name        ${account}[name]
    Fill Text        id=email       ${account}[email]
    Fill Text        id=document    ${account}[document]

    Click            css=button >> text=Cadastrar

    Wait For Elements State     text=Falta pouco para fazer parte da família Smartbit!
    ...                         visible    5
Campo nome deve ser obrigatório
    [Tags]    required_name

    ${account}    Get Fake Account

    New Browser     chromium    headless=False
    New Page        http://localhost:3000
    Scroll To Element    id=signup

    Get Text        css=#signup h2   equal    
    ...             Faça seu cadastro e venha para a Smartbit!
  
    Fill Text        id=email       cristiano@gmail.com
    Fill Text        id=document    91314080016

    Click            css=button >> text=Cadastrar

    Wait For Elements State     css=form .notice
    ...                         visible    5

    Get Text    css=form .notice    equal    Por favor informe o seu nome completo

Campo email deve ser obrigatório
    [Tags]    required_email

    ${account}    Get Fake Account

    New Browser     chromium    headless=False
    New Page        http://localhost:3000
    Scroll To Element    id=signup

    Get Text        css=#signup h2   equal    
    ...             Faça seu cadastro e venha para a Smartbit!
  
    Fill Text        id=name        Cristiano Ferreira
    Fill Text        id=document    91314080016

    Click            css=button >> text=Cadastrar

    Wait For Elements State     css=form .notice
    ...                         visible    5

    Get Text    css=form .notice    equal    Por favor, informe o seu melhor e-mail

Campo documento deve ser obrigatório
    [Tags]    required_document

    ${account}    Get Fake Account

    New Browser     chromium    headless=False
    New Page        http://localhost:3000
    Scroll To Element    id=signup

    Get Text        css=#signup h2   equal    
    ...             Faça seu cadastro e venha para a Smartbit!
  
    Fill Text        id=name        Cristiano Ferreira
    Fill Text        id=email       cristiano@gmail.com

    Click            css=button >> text=Cadastrar

    Wait For Elements State     css=form .notice
    ...                         visible    5

    Get Text    css=form .notice    equal    Por favor, informe o seu CPF

    