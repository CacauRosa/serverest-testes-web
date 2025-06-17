*** Settings ***
Documentation    
Library          Browser
Resource         ../resources/login_keywords.resource

Suite Setup       Start Session
Suite Teardown    Fechar Navegador

*** Test Cases ***
CT000 - Cadastro de novo usuário
    Register New User

CT001 - Login com sucesso (usuário recém-cadastrado)
    Go To Login Page
    Fill Login Form           ${EMAIL_CAD}    ${PASS_CAD}
    Validate Successful Login
    Fechar Navegador

CT002 - Login com senha incorreta
    Go To Login Page
    Fill Login Form           ${EMAIL_CAD}    senha_errada
    Validate Specific Error Message    Email e/ou senha inválidos
    Fechar Navegador

CT003 - Login com campos vazios
    Go To Login Page
    Click                     data-testid=entrar
    Validate Specific Error Message    Email é obrigatório
    Validate Specific Error Message    Password é obrigatório
    Fechar Navegador
