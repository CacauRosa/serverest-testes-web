*** Settings ***
Documentation    Arquivo de armazenamento de keywords globais
Library          Browser

*** Variables ***
${BASE_URL}        https://compassuolfront.serverest.dev

*** Keywords ***
Start Session
    New Browser     browser=chromium      headless=False
    New Page        ${BASE_URL}

Go To Login Page
    Wait For Elements State    text=login    visible
    Click    text=login
    Wait For Elements State    id=email    visible

Fechar Navegador
    Close Browser    ALL
