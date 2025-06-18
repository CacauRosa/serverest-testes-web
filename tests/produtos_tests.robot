*** Settings ***
Documentation        Cenários de testes de produtos

Resource             ../resources/base.resource

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