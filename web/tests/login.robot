*** Settings ***
Documentation     Cenários de testes do Login SAC

Resource          ../resources/Base.resource

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve logar como Gestor de Academia
    Go to login page 
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Não deve logar com senha incorreta
    [Tags]    inv_pass

    Go to login page
    Submit login form    sac@smartbit.com    abc333
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar email não cadastrado
    [Tags]    email_404

    Go to login page
    Submit login form    404@smartbit.com    abc333
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com dados incorretos
    [Template]    Login with verify Notice

    ${EMPTY}            ${EMPTY}    Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123      Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}    Os campos email e senha são obrigatórios.
    nunes.com.br        pwd123      Oops! O email informado é inválido
    n992dr              pwd123      Oops! O email informado é inválido
    !#*##!$%$¨$%        pwd123      Oops! O email informado é inválido
    28999&123123.com    pwd123      Oops! O email informado é inválido
    192.168.1.0         pwd123      Oops! O email informado é inválido
    banzai@gmail*com    pwd123      Oops! O email informado é inválido

*** Keywords ***
Login with verify Notice
    [Arguments]    ${email}    ${password}    ${output_message}

    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be    ${output_message}