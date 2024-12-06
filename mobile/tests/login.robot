*** Settings ***
Documentation    Suite de testes de login

Library    Browser

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve logar com o cpf e IP
    ${data}    Get Json fixture    login

    Insert Membership       ${data}

    Signin with document    ${data}[account][cpf]
    User is logged in
    
Não deve logar com cpf não cadastrado
    Signin with document    36003493097
    Popup have text         Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com cpf com dígito inválido
    Signin with document    00000014142
    Popup have text         CPF inválido, tente novamente