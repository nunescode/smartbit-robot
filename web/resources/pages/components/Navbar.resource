*** Settings ***
Documentation    Ações e elementos da barra de navegação

Library    Browser

*** Keywords ***
Go to memberships
    Click    css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas
    ...    visible    5

User is logged in
    [Arguments]    ${email}

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State    ${element}     visible    5
    Get Text                   ${element}     equal      ${email}