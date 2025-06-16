*** Settings ***
Library        Browser

Resource       ../variables/variables.resource
Resource       carrinho_keywords.resource
Resource       login_keywords.resource
Resource       produtos_keywords.resource
Resource       usuarios_keywords.resource

*** Keywords ***
Start Session
    New Browser     browser=chromium      headless=False
    New Page        ${BASE_URL}