*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Library        Browser

*** Test Cases ***
Deve inicia o cadastro do cliente
    New Browser     chromium    headless=False
    New Page        http://localhost:3000
    Scroll To Element    id=signup
    Get Text        css=#signup h2   equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name        Cristiano Ferreira
    Fill Text        id=email       cristiano@gmail.com
    Fill Text        id=document    01889233064

    Click            css=button >> text=Cadastrar

    Sleep    3