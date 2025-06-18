*** Settings ***
Documentation    
Resource         ../resources/login_keywords.resource

Suite Setup       Start Session
Suite Teardown    Fechar Navegador

*** Test Cases ***

CT001 - Login com sucesso (usuário recém-cadastrado)
    New Login User
    Go To Login Page
    Fill Login Form           ${EMAIL_CAD}    ${PASS_CAD}
    Validate Successful Login
    Take Screenshot
    Fechar Navegador

CT002 - Login com senha incorreta
    Go To Login Page
    Fill Login Form           ${EMAIL_CAD}    senha_errada
    Validate Specific Error Message    Email e/ou senha inválidos
    Take Screenshot 
    Fechar Navegador

CT003 - Login com campos vazios
    Go To Login Page
    Fill Login Form           ${EMPTY}    ${EMPTY}
    Click                     data-testid=entrar
    Validate Specific Error Message    Email é obrigatório
    Validate Specific Error Message    Password é obrigatório
    Take Screenshot
    Fechar Navegador