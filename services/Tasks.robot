*** Settings ***
Documentation        Arquivo para testa o consumo da API com tasks

Resource        ./Service.resource

*** Tasks ***
Testanto a API
    Set user token
    Get account by name    Dominic Toreto