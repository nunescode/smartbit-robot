*** Settings ***
Documentation     Suite de testes de adesões de planos

Resource          ../resources/Base.resource
Library           ../resources/libs/Database.py

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão

    ${data}    Get Json fixture    memberships    create


    Delete Account By Email    ${data}[account][email]
    Log                        ${data}[account][email]

    Insert Account             ${data}[account]
    Log                        ${data}[account]
    
    Signin admin

    Go to memberships
    Create new membership    ${data}

    Toast should be       Matrícula cadastrada com sucesso.

    Sleep    2

Não deve realizar adesão duplicada
    [Tags]    dup

    ${data}    Get Json fixture    memberships    duplicate

    Insert Membership        ${data}

    Signin admin
    Go to memberships
    Create new membership    ${data}
    Toast should be    O usuário já possui matrícula.
    
Deve buscar por nome
    [Tags]     search

    ${data}    Get Json fixture    memberships    search

    Insert Membership        ${data}

    Signin admin
    Go to memberships
    Search by name           ${data}[account][name]
    Should filter by name    ${data}[account][name]

Deve excluir uma matricula
    [Tags]     remove

    ${data}    Get Json fixture    memberships    remove

    Insert Membership        ${data}

    Signin admin
    Go to memberships
    Request removal    ${data}[account][name]
    Confirm removal
    Membership should not be visible    ${data}[account][name]
    