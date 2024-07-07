*** Settings ***
Documentation        Camada de integração com a API

Library    RequestsLibrary

*** Keywords ***
Set user token

    ${payload}    Create Dictionary
    ...           email=sac@smartbit.com
    ...           password=pwd123

    ${response}    POST    
    ...            http://localhost:3333/sessions
    ...            json=${payload}
    ...             expected_status=any

    ${token}    Set Variable    Bearer ${response.json()}[token]

    Set Global Variable    ${token}

Get account by name
    [Arguments]    ${name}

    ${headers}    Create Dictionary
    ...           Authorization=${token}    # robotcode: ignore

    ${params}    Create Dictionary
    ...          name=${name}

    ${response}    GET    
    ...            http://localhost:3333/accounts
    ...            params=${params}
    ...            headers=${headers}
    ...            expected_status=any

    RETURN   ${response.json()}[data][0]

    

    