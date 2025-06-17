*** Settings***
Documentation        Arquivo para keywords do endpoint /produtos

Library        Browser
Library        RequestsLibrary
Library        FakerLibrary

Resource       base.resource

*** Keywords ***
New User and Login
    Generate Random User Data
    Register New User
    Fill Login Form    ${EMAIL_CAD}    ${PASS_CAD}

Go To With Button 
    [Arguments]    ${element}

    Wait For Elements State    ${element}    visible    5
    Click    ${element}

Check If In Page
    [Arguments]    ${page_text}

    Get Text    css=h1    equal    ${page_text}

Generate Random Product Data
    ${nome}          FakerLibrary.Word
    ${preco}         FakerLibrary.Random Int    min=50
    ${descricao}     FakerLibrary.Paragraph     nb_sentences=1
    ${quantidade}    FakerLibrary.Random Int    min=20    max=200
    ${product_data}    Create Dictionary
    ...                nome=${nome}
    ...                preco=${preco} 
    ...                descricao=${descricao}
    ...                quantidade=${quantidade} 
    Set Test Variable   ${product_data}

Submit Task Form For Product
    [Arguments]    ${body}

    ${element}    Set Variable    css=button[type=submit]

    Fill Text    css=#nome           ${body}[nome]
    Fill Text    css=#price          ${body}[preco]
    Fill Text    css=#description    ${body}[descricao]
    Fill Text    css=#quantity       ${body}[quantidade]

    Wait For Elements State    ${element}    visible    5
    Click    ${element}

Product Should Be Registered
    [Arguments]    ${product_name}

    Wait For Elements State    xpath=//td[text()="${product_name}"]   visible    5

Alert should be
    [Arguments]        ${expected_text}

    Wait For Elements State        xpath=//span[text()="${expected_text}"]
    ...                            visible        5