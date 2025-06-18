*** Settings ***
Documentation     Suite de testes para a funcionalidade de usuários na interface web.

Resource         ../resources/base.resource

Suite Setup       Start Session
Suite Teardown    Fechar Navegador

*** Test Cases ***
CT-001 - Cadastro válido de usuário
    [Tags]    cadastro_sucesso
    Register New User

CT-002 - Cadastro com e-mail duplicado
    [Tags]    dup_cadastro_usuario
    Register User With Duplicate Email

CT-003 - Ausência do campo obrigatório email
    [Tags]    ausencia_email
    Register User Without Email

CT-004 - Ausência do campo obrigatório nome
    [Tags]    ausencia_nome
    Register User Without Name

CT-005 - Listar todos os usuários cadastrados
    [Tags]    listar_usuarios
    List All Users
