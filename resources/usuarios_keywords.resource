*** Settings ***
Documentation        Base file with variables, keywords, and utility functions used in user functionality.
Library              Browser
Resource             ../resources/base.resource

*** Variables ***
${USER_PAGE_URL}      https://compassuolfront.serverest.dev/cadastrarusuarios
${FIELD_NAME}         id=nome
${FIELD_EMAIL}        id=email
${FIELD_PASSWORD}     id=password
${BTN_REGISTER}       data-testid=cadastrar
${ALERT_MESSAGE}      css=.alert
${DELETE_BUTTON}      id=delete-user

*** Keywords ***

# === Navigation ===

Open User Registration Page
    Start Session
    Go To    ${USER_PAGE_URL}

Open Registration Page And Form
    Open User Registration Page
    Wait For Elements State    ${FIELD_NAME}    visible    timeout=60s

# === Form Helpers ===

Fill Registration Form
    [Arguments]    ${nome}    ${email}    ${password}
    Fill Text    ${FIELD_NAME}    ${nome}
    Fill Text    ${FIELD_EMAIL}    ${email}
    Fill Text    ${FIELD_PASSWORD}    ${password}

Submit Registration
    Click    ${BTN_REGISTER}

Validate Alert Message
    [Arguments]    ${expected_message}
    Wait For Elements State    ${ALERT_MESSAGE}    visible
    ${message}=    Get Text    ${ALERT_MESSAGE}
    Should Contain    ${message}    ${expected_message}

# === User Scenarios ===

Generate Random User Data
    ${rand}=       Evaluate    random.randint(1000, 9999)    modules=random
    ${email}=      Set Variable    user${rand}@teste.com
    Set Suite Variable    ${EMAIL_CAD}    ${email}
    Set Suite Variable    ${PASS_CAD}     123456
    Set Suite Variable    ${NAME_CAD}     Robot Teste ${rand}

Register New User
    Generate Random User Data
    Open Registration Page And Form
    Fill Registration Form    ${NAME_CAD}    ${EMAIL_CAD}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Wait For Elements State    css=a.alert-link    visible    timeout=10s
    ${msg}=    Get Text    css=a.alert-link
    Should Be Equal As Strings  ${msg}    Cadastro realizado com sucesso
    Fechar Navegador

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
