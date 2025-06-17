*** Settings ***
Documentation     Suite de testes para a funcionalidade de usuários na interface web.
Resource          ../resources/usuarios_keywords.resource

Suite Setup       Start Session
Suite Teardown    Fechar Navegador

*** Test Cases ***

CT-001 - Cadastro válido de usuário
    Register New User

CT-002 - Cadastro com e-mail duplicado
    Register User With Duplicate Email

CT-003 - Ausência do campo obrigatório email
    Register User Without Email

CT-004 - Ausência do campo obrigatório nome
    Register User Without Name

# O campo de exclusão ainda não foi incluído.
# CT-005 - Deletar usuário existente
#    Generate Random User Data
#    Delete Registered Use
