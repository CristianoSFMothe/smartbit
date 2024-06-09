*** Settings ***
Documentation        Teste para verificar o Slogan da Smarbit na Landing Page

Library    Browser


*** Test Cases ***

Deve exibir o Slogan na Landing Page
    New Browser     chromium    headless=False
    New Page        http://localhost:3000
    Get Text        css=.headline h2    equal    Sua Jornada Fitness Começa aqui!