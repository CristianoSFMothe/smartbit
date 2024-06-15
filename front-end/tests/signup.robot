*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource       ../resources/Base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve inicia o cadastro do cliente
    [Tags]    smoke

    ${account}    Create Dictionary
    ...           name=Cristiano Mothe
    ...           email=cristiano@gmail.com
    ...           cpf=42945318008       

    Delete Account By Email         ${account}[email]
    Delete Account By CPF           ${account}[cpf]
   
    Submit sigunp form    ${account}  
    Verify welcome messagem 

Não deve realizar pré-cadastro de usuário com e-mail duplicado
    [Tags]    dup_email

    ${account_email_dup}    Create Dictionary
    ...           name=Cristiano Mothe
    ...           email=crisitiano@gmail.com
    ...           cpf=04528847051       
     
    Delete Account By Email           ${account_email_dup}[email]
    Insert Account Duplicate Email    ${account_email_dup}
    Submit sigunp form                ${account_email_dup}  
    Toast should be                   O e-mail fornecido já foi cadastrado!
    Delete Account By Email           ${account_email_dup}[email]

Não deve realizar pré-cadastro de usuário com CPF duplicado
    [Tags]    dup_cpf

    ${account_cpf_dup}    Create Dictionary
    ...                   name=Cristiano Mothe
    ...                   email=crisitiano@yahoo.com
    ...                   cpf=42945318008       
 
    Delete Account By Email         ${account_cpf_dup}[email]
    Delete Account By CPF           ${account_cpf_dup}[cpf]  
    Insert Account Duplicate CPF    ${account_cpf_dup}
    Submit sigunp form              ${account_cpf_dup}  
    Toast should be                 O CPF fornecido já foi cadastrado!
    


Tentativa de pré-cadastro
    [Tags]        attempt

    [Template]    Attempt signut

    ${EMPTY}              cristiano@gmail.com    91314080016      Por favor informe o seu nome completo
    Cristiano Ferreira    ${EMPTY}               91314080016      Por favor, informe o seu melhor e-mail
    Cristiano Ferreira    cristiano@gmail.com    ${EMPTY}         Por favor, informe o seu CPF
    Cristiano Ferreira    cristiano*gmail.com    91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    www.teste.com.br       91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    aaabbbb                91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    1111111                91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    */-/@#*                91314080016      Oops! O email informado é inválido
    Cristiano Ferreira    cristiano@gmail.com    91314080022      Oops! O CPF informado é inválido
    Cristiano Ferreira    cristiano@gmail.com    9131408          Oops! O CPF informado é inválido
    Cristiano Ferreira    cristiano@gmail.com    AABBAS           Oops! O CPF informado é inválido
    Cristiano Ferreira    cristiano@gmail.com    @#$%¨%@          Oops! O CPF informado é inválido

*** Keywords ***
Attempt signut
    [Arguments]        ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...           name=${name}
    ...           email=${email}
    ...           cpf=${cpf}
   
    Submit sigunp form    ${account}
    Notice should be      ${output_message}



