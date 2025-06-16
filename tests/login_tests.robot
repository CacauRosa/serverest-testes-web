*** Settings ***
Library    Browser
Resource   ../resources/base.resource
Resource   ../resources/login_keywords.resource

*** Test Cases ***
CT000 - Cadastro de novo usuário
    Open Browser
    Generate Random User Data
    Register New User
    Close Browser

CT001 - Login com sucesso (usuário recém-cadastrado)
    Open Browser
    Go To Login Page
    Fill Login Form           ${EMAIL_CAD}    ${PASS_CAD}
    Validate Successful Login
    Close Browser

CT002 - Login com senha incorreta
    Open Browser
    Go To Login Page
    Fill Login Form           ${EMAIL_CAD}    senha_errada
    Validate Specific Error Message    Email e/ou senha inválidos
    Close Browser

CT003 - Login com campos vazios
    Open Browser
    Go To Login Page
    Click                     data-testid=entrar
    Validate Specific Error Message    Email é obrigatório
    Validate Specific Error Message    Password é obrigatório
    Close Browser

