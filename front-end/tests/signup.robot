*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Library        Browser

Resource       ../resources/Base.resource

*** Test Cases ***
Deve inicia o cadastro do cliente

    ${account}    Get Fake Account

    Start Session    
    Submit sigunp form    ${account}

    Wait For Elements State     text=Falta pouco para fazer parte da família Smartbit!
    ...                         visible    5

Campo nome deve ser obrigatório
    [Tags]    required_name

    ${account}    Create Dictionary
    ...           name=${EMPTY}
    ...           email=cristiano@gmail.com
    ...           cpf=91314080016

    Start Session    
    Submit sigunp form    ${account}
    Notice should be      Por favor informe o seu nome completo

Campo email deve ser obrigatório
    [Tags]    required_email

    ${account}    Create Dictionary
    ...           name=Cristiano Ferreira
    ...           email=${EMPTY}
    ...           cpf=91314080016

    Start Session    
    Submit sigunp form    ${account}
    Notice should be      Por favor, informe o seu melhor e-mail

Campo documento deve ser obrigatório
    [Tags]    required_cpf

    ${account}    Create Dictionary
    ...           name=Cristiano Ferreira
    ...           email=cristiano@gmail.com
    ...           cpf=${EMPTY}

    Start Session    
    Submit sigunp form    ${account}
    Notice should be      Por favor, informe o seu CPF

Email no formato inválido
    [Tags]    invalid_email

    ${account}    Create Dictionary
    ...           name=Cristiano Ferreira
    ...           email=cristiano*gmail.co
    ...           cpf=91314080016

    Start Session    
    Submit sigunp form    ${account}
    Notice should be      Oops! O email informado é inválido

Documento no formato inválido
    [Tags]    invalid_cpf

    ${account}    Create Dictionary
    ...           name=Cristiano Ferreira
    ...           email=cristiano@gmail.com
    ...           cpf=9131408001A

    Start Session    
    Submit sigunp form    ${account}
    Notice should be      Oops! O CPF informado é inválido

*** Keywords ***
Submit sigunp form
    [Arguments]      ${account}

    Click            css=button >> text=Bora treinar conosco?

    Get Text        css=#signup h2   equal    
    ...             Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name        ${account}[name]
    Fill Text        id=email       ${account}[email]
    Fill Text        id=cpf         ${account}[cpf]

    Click            css=button >> text=Cadastrar


Start Session
    New Browser     chromium    headless=False
    New Page        http://localhost:3000    

Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=form .notice

    Wait For Elements State     ${element} 
    ...                         visible    5

    Get Text    ${element}     equal    ${target}