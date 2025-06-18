
*** Settings ***
Resource        base.resource


*** Keywords ***

Generate Random User Data
    ${rand}=    Evaluate    random.randint(1000, 9999)    modules=random
    ${email}=   Set Variable    user${rand}@teste.com
    Set Suite Variable    ${EMAIL_CAD}   ${email}
    Set Suite Variable    ${PASS_CAD}    123456
    Set Suite Variable    ${NAME_CAD}    Robot Teste ${rand}

Register New User
    Go To Login Page
    Click                       text=Cadastre-se
    Wait For Elements State     id=nome    visible
    Fill Text                   id=nome        ${NAME_CAD}
    Fill Text                   id=email       ${EMAIL_CAD}
    Fill Text                   id=password    ${PASS_CAD}
    Click                       data-testid=checkbox
    Click                       data-testid=cadastrar
    Wait For Elements State     css=a.alert-link    visible
    ${msg}=    Get Text         css=a.alert-link
    Should Be Equal As Strings  ${msg}    Cadastro realizado com sucesso

Fill Login Form
    [Arguments]    ${email}    ${password}
    Wait For Elements State    id=email        visible
    Fill Text    id=email        ${email}
    Fill Text    id=password     ${password}
    Click        data-testid=entrar

Validate Successful Login
    Wait Until Keyword Succeeds    10s    1s    URL Should Contain Either    /admin/home    /produtos

URL Should Contain Either
    [Arguments]    ${opt1}    ${opt2}
    ${url}=    Get Url
    ${match1}=    Run Keyword And Return Status    Should Contain    ${url}    ${opt1}
    ${match2}=    Run Keyword And Return Status    Should Contain    ${url}    ${opt2}
    Run Keyword Unless    ${match1} or ${match2}    Fail    URL '${url}' não contém '${opt1}' nem '${opt2}'

Validate Specific Error Message
    [Arguments]    ${mensagem}
    Wait For Elements State    xpath=//div[@class="alert alert-secondary alert-dismissible"]/span[normalize-space(.)="${mensagem}"]    visible
    ${texto}=   Get Text    xpath=//div[@class="alert alert-secondary alert-dismissible"]/span[normalize-space(.)="${mensagem}"]
    Should Be Equal    ${texto}    ${mensagem}
