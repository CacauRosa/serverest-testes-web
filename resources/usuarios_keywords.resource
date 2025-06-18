*** Settings ***
Documentation        Base file with variables, keywords, and utility functions used in user functionality.

Resource             base.resource

*** Variables ***
${BTN_LIST_USERS}       css=[data-testid="listar-usuarios"]

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
    Take Screenshot

    # Segundo cadastro usando o mesmo email
    Open Registration Page And Form
    ${dup_name}=  Set Variable    Duplicate ${NAME_CAD}
    Fill Registration Form    ${dup_name}    ${EMAIL_CAD}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Validate Alert Message    Este email já está sendo usado
    Take Screenshot

Register User Without Name
    Generate Random User Data
    Open Registration Page And Form
    Fill Registration Form    ${EMPTY}    ${EMAIL_CAD}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Validate Alert Message    Nome é obrigatório
    Take Screenshot

Register User Without Email
    Generate Random User Data
    Open Registration Page And Form
    Fill Registration Form    ${NAME_CAD}    ${EMPTY}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Validate Alert Message    Email é obrigatório
    Take Screenshot

List All Users
    Register New User
    Wait For Elements State    ${BTN_LIST_USERS}    visible    timeout=15s
    Click    ${BTN_LIST_USERS}
    Take Screenshot
