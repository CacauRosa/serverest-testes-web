*** Settings ***
Documentation        Base file with variables, keywords, and utility functions used in user functionality.
Library              Browser
Resource             ../resources/base.resource

*** Variables ***
${DELETE_BUTTON}      id=delete-user

*** Keywords ***

# === User Scenarios ===

Register User With Duplicate Email
    Generate Random User Data
    # Primeiro cadastro com email único
    Open Registration Page And Form
    Fill Registration Form    ${NAME_CAD}    ${EMAIL_CAD}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Validate Alert Message    Cadastro realizado com sucesso

    # Segundo cadastro usando o mesmo email
    Open Registration Page And Form
    ${dup_name}=  Set Variable    Duplicate ${NAME_CAD}
    Fill Registration Form    ${dup_name}    ${EMAIL_CAD}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Validate Alert Message    Este email já está sendo usado
    Fechar Navegador

Register User Without Name
    Generate Random User Data
    Open Registration Page And Form
    Fill Registration Form    ${EMPTY}    ${EMAIL_CAD}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Validate Alert Message    Nome é obrigatório
    Fechar Navegador

Register User Without Email
    Generate Random User Data
    Open Registration Page And Form
    Fill Registration Form    ${NAME_CAD}    ${EMPTY}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Validate Alert Message    Email é obrigatório
    Fechar Navegador

Delete Registered User
    Open Registration Page And Form
    Fill Registration Form    ${NAME_CAD}    ${EMAIL_CAD}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Wait For Elements State    ${DELETE_BUTTON}    visible
    Click    ${DELETE_BUTTON}
    Validate Alert Message    Usuário deletado com sucesso
    Fechar Navegador
