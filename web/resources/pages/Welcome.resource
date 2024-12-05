*** Settings ***
Documentation    Ações e elementos da página de boas vindas

Library    Browser

*** Keywords ***

Verify welcome message
    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    # Texto esperado
    ...    visible    5    # Tempo de espera (5 segundos)