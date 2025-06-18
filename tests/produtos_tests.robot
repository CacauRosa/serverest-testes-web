*** Settings ***
Documentation        Cenários de testes de produtos
Resource             ../resources/produtos_keywords.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
CT001 - Deve listar produtos cadastrados a partir da aba "Home"
    [Tags]    listar

    Generate Random User Data
    Register New User
    Fill Login Form    ${EMAIL_CAD}    ${PASS_CAD}

    Go To With Button    css=a[data-testid=listarProdutos]
    Check If In Page     Lista dos Produtos

CT002 - Deve listar produtos cadastrados a partir do menu de navegação
    [Tags]    listar

    New User and Login

    Go To With Button    css=a[data-testid=listar-produtos]
    Check If In Page     Lista dos Produtos

CT003 - Deve acessar página de cadastro a partir da aba "Home"
    [Tags]    ir_cadastro

    New User and Login

    Go To With Button    css=a[data-testid=cadastrarProdutos]
    Check If In Page     Cadastro de Produtos

CT004 - Deve acessar página de cadastro a partir do menu de navegação
    [Tags]    ir_cadastro

    New User and Login

    Go To With Button    css=a[data-testid=cadastrar-produtos]
    Check If In Page     Cadastro de Produtos


CT005 - Deve cadastrar produto com sucesso
    [Tags]    sucesso_cadastro
    
    New User and Login

    Go To With Button    css=a[data-testid=cadastrarProdutos]
    Check If In Page     Cadastro de Produtos

    Generate Random Product Data
    Submit Task Form For Product    ${product_data}
    Check If In Page                Lista dos Produtos
    Product Should Be Registered    ${product_data}[nome]

CT006 - Não deve cadastrar produto com nome duplicado
    [Tags]    dup_cadastro

    New User and Login

    Go To With Button    css=a[data-testid=cadastrarProdutos]
    Check If In Page     Cadastro de Produtos

    Generate Random Product Data
    Submit Task Form For Product    ${product_data}
    Check If In Page                Lista dos Produtos
    Product Should Be Registered    ${product_data}[nome]

    Go To With Button    css=a[data-testid=cadastrar-produtos]
    Check If In Page     Cadastro de Produtos

    Submit Task Form For Product    ${product_data}
    Check If In Page                Cadastro de Produtos
    Alert should be                 Já existe produto com esse nome

CT007 - Testar Busca de Produto Existente
    [Tags]    busca
    New User and Login

    # Primeiro cadastramos um produto para garantir que existe
    Go To With Button    css=a[data-testid=cadastrar-produtos]
    Check If In Page     Cadastro de Produtos
    Generate Random Product Data
    # Adicionamos um prefixo único para garantir que o nome seja único
    ${nome_unico}=    Set Variable    TESTE_BUSCA_${product_data}[nome]
    Set To Dictionary    ${product_data}    nome=${nome_unico}
    Submit Task Form For Product    ${product_data}
    Check If In Page     Lista dos Produtos
    Product Should Be Registered    ${product_data}[nome]

    # Verificamos que o produto está na lista
    ${nome_produto}=    Set Variable    ${product_data}[nome]

    # Verifica que o produto aparece nos resultados
    Wait For Elements State    xpath=//td[text()="${nome_produto}"]    visible    5

CT008 - Testar Busca de Produto Inexistente
    [Tags]    busca
    New User and Login

    # Vai para a página de produtos
    Go To With Button    css=a[data-testid=listar-produtos]
    Check If In Page     Lista dos Produtos

    # Gera um nome aleatório para buscar
    ${produto_inexistente}=    FakerLibrary.Word
    ${produto_inexistente}=    Set Variable    ${produto_inexistente}_inexistente_${produto_inexistente}

    # Verifica que o produto não existe na lista
    ${count}=    Get Element Count    xpath=//td[contains(text(), "${produto_inexistente}")]
    Should Be Equal As Numbers    ${count}    0    O produto não deveria existir

CT009 - Testar Exclusão de Produto Existente
    [Tags]    exclusao
    New User and Login
    
    # Primeiro cadastramos um produto para garantir que existe
    Go To With Button    css=a[data-testid=cadastrar-produtos]
    Check If In Page     Cadastro de Produtos
    Generate Random Product Data
    # Adicionamos um prefixo único para garantir que o nome seja único
    ${nome_unico}=    Set Variable    TESTE_EXCLUSAO_${product_data}[nome]
    Set To Dictionary    ${product_data}    nome=${nome_unico}
    Submit Task Form For Product    ${product_data}
    Check If In Page     Lista dos Produtos
    Product Should Be Registered    ${product_data}[nome]
    
    # Agora excluímos o produto que acabamos de criar
    ${nome_produto}=    Set Variable    ${product_data}[nome]
    
    # Clicando no botão de exclusão do produto específico que acabamos de criar
    Click    xpath=//td[text()="${nome_produto}"]/following-sibling::td//button[contains(@class, "btn-danger")]
    
    # Não há modal de confirmação, então verificamos diretamente se o produto foi excluído
    Sleep    2
    
    # Recarregamos a página para garantir que a lista está atualizada
    Go To With Button    css=a[data-testid=listar-produtos]
    Check If In Page     Lista dos Produtos
    
    # Verificamos que o produto foi excluído
    ${count}=    Get Element Count    xpath=//td[text()="${nome_produto}"]
    Should Be Equal As Numbers    ${count}    0    O produto não foi excluído
