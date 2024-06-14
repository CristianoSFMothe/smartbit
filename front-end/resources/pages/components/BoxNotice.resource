*** Settings ***
Documentation    Coomponentes e ações do Notice

Library    Browser

*** Keywords ***
Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=form .notice

    Wait For Elements State     ${element} 
    ...                         visible    5

    Get Text    ${element}     equal    ${target}