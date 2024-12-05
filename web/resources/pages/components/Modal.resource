*** Settings ***
Documentation    Ações e elementos do componente modal

Library    Browser

*** Keywords ***
Confirm removal
    Click    css=.swal2-confirm
    
    