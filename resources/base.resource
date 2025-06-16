*** Settings ***
Library        Browser

Resource       ../variables/variables.robot
Resource       carrinho_keywords.robot
Resource       login_keywords.robot
Resource       produtos_keywords.robot
Resource       usuarios_keywords.robot

*** Keywords ***
Start Session
    New Browser     browser=chromium      headless=False
    New Page        ${BASE_URL}