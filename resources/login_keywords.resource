
*** Settings ***
Documentation        Base file with variables, keywords, and utility functions used in login functionality.

Resource             base.resource

*** Keywords ***
New Login User
    Generate Random User Data
    Register New User
    Click    data-testid=logout

Go To Login Page
    Start Session
    Wait For Elements State    id=email    visible

Fill Login Form
    [Arguments]    ${EMAIL_CAD}    ${PASS_CAD}
    Wait For Elements State    id=email        visible
    Fill Text    id=email        ${EMAIL_CAD}
    Fill Text    id=password     ${PASS_CAD}
    Click        data-testid=entrar

Validate Successful Login
    Wait Until Keyword Succeeds    10s    1s    URL Should Contain Either    /admin/home    /produtos

URL Should Contain Either
    [Arguments]    ${opt1}    ${opt2}
    ${url}=    Get Url
    ${match1}=    Run Keyword And Return Status    Should Contain    ${url}    ${opt1}
    ${match2}=    Run Keyword And Return Status    Should Contain    ${url}    ${opt2}
    Run Keyword If   ${match1} or ${match2}    Fail    URL '${url}' não contém '${opt1}' nem '${opt2}'

Validate Specific Error Message
    [Arguments]    ${mensagem}
    Wait For Elements State    xpath=//div[@class="alert alert-secondary alert-dismissible"]/span[normalize-space(.)="${mensagem}"]    visible
    ${texto}=   Get Text    xpath=//div[@class="alert alert-secondary alert-dismissible"]/span[normalize-space(.)="${mensagem}"]
    Should Be Equal    ${texto}    ${mensagem}
