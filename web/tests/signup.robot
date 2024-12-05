*** Settings ***
# Configurações gerais do arquivo de teste

# Descrição geral do propósito do teste
Documentation        Cenários de testes de pré-cadastro de clientes

# Importa um arquivo de recursos contendo keywords reutilizáveis e funções básicas
Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Take Screenshot

*** Variables ***
${VALID_EMAIL}    nunes@testesd.br
${VALID_CPF}      41991734042


*** Test Cases ***
# Caso de teste 1: Deve iniciar o cadastro do cliente com sucesso
Deve iniciar o cadastro do cliente
    [Tags]    smoke
    
    ${account}        Get Fake Account    # Gera uma conta fictícia para simular os dados do cliente 

    # Envia o formulário de cadastro com os dados gerados
    Submit signup form    ${account}    

    # Aguarda que o elemento contendo o texto esperado seja exibido
    Verify welcome message

# Caso de teste 2: Verifica que o campo "nome" é obrigatório
Tentativa de pré-cadastro
    [Template]    Attempt signup

    ${EMPTY}            ${VALID_EMAIL}          ${VALID_CPF}        Por favor informe o seu nome completo
    Kulas Lakeberg      ${EMPTY}                ${VALID_CPF}        Por favor, informe o seu melhor e-mail
    Tukia Gakelerb      ${VALID_EMAIL}          ${EMPTY}            Por favor, informe o seu CPF
    Katia Bakelerg      friulus&teste.com       ${VALID_CPF}        Oops! O email informado é inválido
    Jucas               invalidemail@           ${VALID_CPF}        Oops! O email informado é inválido
    João                usere&email.com         ${VALID_CPF}        Oops! O email informado é inválido
    Maria               maria@email             ${VALID_CPF}        Oops! O email informado é inválido
    Maria               maria*email.com         ${VALID_CPF}        Oops! O email informado é inválido
    Maria               www.combr&gmail.com    ${VALID_CPF}         Oops! O email informado é inválido
    Tukia               ${VALID_EMAIL}          000.000.000-00      Oops! O CPF informado é inválido
    Kulas Lakeberg      ${VALID_EMAIL}          1723340a117         Oops! O CPF informado é inválido
    Kulas Lakeberg      ${VALID_EMAIL}          11111111111         Oops! O CPF informado é inválido
    Katia Bakelerg      ${VALID_EMAIL}          123                 Oops! O CPF informado é inválido
    Katia Bakelerg      ${VALID_EMAIL}          1                   Oops! O CPF informado é inválido
    Katia Bakelerg      ${VALID_EMAIL}          123                 Oops! O CPF informado é inválido
    Katia Bakelerg      ${VALID_EMAIL}          076.222.313-31      Oops! O CPF informado é inválido
    Katia Bakelerg      ${VALID_EMAIL}          asd                 Oops! O CPF informado é inválido
    Katia Bakelerg      ${VALID_EMAIL}          12222222            Oops! O CPF informado é inválido
    Katia Bakelerg      ${VALID_EMAIL}          ******              Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit signup form    ${account}
    Notice should be      ${output_message}