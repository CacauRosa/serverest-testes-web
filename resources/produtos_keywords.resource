*** Settings***
Documentation        Base file with variables, keywords, and utility functions used in products functionality.

Resource             base.resource

*** Keywords ***

New User and Login
    Generate Random User Data
    Register New User
    Fill Login Form    ${EMAIL_CAD}    ${PASS_CAD}

Go To With Button 
    [Arguments]    ${element}
    Wait For Elements State    ${element}    visible
    Click    ${element}

Check If In Page
    [Arguments]    ${page_text}
    Browser.Get Text    css=h1    equal    ${page_text}

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

    Wait For Elements State    ${element}    visible
    Click    ${element}

Product Should Be Registered
    [Arguments]    ${product_name}

    Wait For Elements State    xpath=//td[text()="${product_name}"]   visible    5

Alert should be
    [Arguments]        ${expected_text}
    Wait For Elements State        xpath=//span[text()="${expected_text}"]
    ...                            visible 

Delete product
    # Adicionamos um prefixo único para garantir que o nome seja único
    ${nome_unico}=    Set Variable    TESTE_EXCLUSAO_${product_data}[nome]
    Set To Dictionary   ${product_data}    nome=${nome_unico}
    Submit Task Form For Product    ${product_data}
    Check If In Page     Lista dos Produtos
    Product Should Be Registered    ${product_data}[nome]

    # Agora excluímos o produto que acabamos de criar
    ${nome_produto}=    Set Variable    ${product_data}[nome]
    
    # Clicando no botão de exclusão do produto específico que acabamos de criar
    Click    xpath=//td[text()="${nome_produto}"]/following-sibling::td//button[contains(@class, "btn-danger")]
    
    # Não há modal de confirmação, então verificamos diretamente se o produto foi excluído
    Sleep    2

    Set Suite Variable    ${nome_produto}

Product Should Be Excluded
    ${count}=    Get Element Count    xpath=//td[text()="${nome_produto}"]
    Should Be Equal As Numbers    ${count}    0    O produto não foi excluído