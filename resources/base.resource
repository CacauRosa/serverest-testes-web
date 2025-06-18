*** Settings ***
Documentation    Arquivo de armazenamento de keywords globais

Library          Browser
Library          RequestsLibrary
Library          FakerLibrary
Library          Collections

Resource         ../variables/variables.resource
Resource         login_keywords.resource
Resource         produtos_keywords.resource
Resource         usuarios_keywords.resource

*** Keywords ***

# === Session Settings ===

Start Session
    New Browser     browser=chromium      headless=False
    New Page        ${BASE_URL}

Fechar Navegador
    Close Browser    ALL

# === Navigation ===

Open User Registration Page
    Start Session
    Go To    ${USER_PAGE_URL}    timeout=15s

Open Registration Page And Form
    Open User Registration Page
    Wait For Elements State    ${FIELD_NAME}    visible    timeout=15s

# === User Scenarios ===

Register New User
    Generate Random User Data
    Open Registration Page And Form
    Fill Registration Form    ${NAME_CAD}    ${EMAIL_CAD}    ${PASS_CAD}
    Click    data-testid=checkbox
    Submit Registration
    Wait For Elements State    css=a.alert-link    visible
    ${msg}=    Get Text    css=a.alert-link
    Should Be Equal As Strings  ${msg}    Cadastro realizado com sucesso
    Take Screenshot

# === Registration Data ===

Generate Random User Data
    ${rand}=       Evaluate    random.randint(1000, 9999)    modules=random
    ${email}=      Set Variable    user${rand}@teste.com
    Set Suite Variable    ${EMAIL_CAD}    ${email}
    Set Suite Variable    ${PASS_CAD}     123456
    Set Suite Variable    ${NAME_CAD}     Robot Teste ${rand}

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