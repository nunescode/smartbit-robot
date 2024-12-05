*** Settings ***
Documentation    Ações e elementos da tela de Login

Library    AppiumLibrary

*** Keywords ***
Signin with document
    [Arguments]      ${cpf}

    Input Text       xpath=//android.widget.EditText[@resource-id="ipAddress"]    192.168.1.3
    Input Text       xpath=//android.widget.EditText[@resource-id="cpf"]          ${cpf}

    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]