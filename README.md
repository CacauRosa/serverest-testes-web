# Testes Automatizados Web com Robot eXpress - ServeRest

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
![Sprint](https://img.shields.io/badge/Sprint-07-blue)
![Tech](https://img.shields.io/badge/Robot_Framework-✓-green)
![Library](https://img.shields.io/badge/Browser_Library-✓-orange)

> Repositório da Squad 1 — Gotham | Compass UOL — Estágio QA

---

## Índice

- [Descrição da Atividade](#descrição-da-atividade)
- [Principais Ferramentas e Tecnologias Utilizadas](#principais-ferramentas-e-tecnologias-utilizadas)
- [Estrutura dos Testes](#estrutura-dos-testes)
- [Ambiente e Requisitos de Instalação](#ambiente-e-requisitos-de-instalação)
- [Participantes da Squad Gotham](#participantes-da-squad-gotham)
- [Considerações Finais](#considerações-finais)
- [Estrutura do Projeto](#estrutura-do-projeto)

---

## Descrição da Atividade

Com base nos conteúdos estudados ao longo do curso Robot eXpress e nos exercícios práticos realizados, esta atividade teve como objetivo aplicar os conhecimentos adquiridos na automação de testes Web utilizando a ferramenta **Robot Framework**.

Cada integrante da squad ficou responsável por implementar **ao menos dois casos de teste** utilizando os recursos abordados no curso.

---

## Principais Ferramentas e Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [Browser Library](https://github.com/MarketSquare/robotframework-browser)
- [Python](https://www.python.org/)
- [VS Code](https://code.visualstudio.com/)
- Aplicação alvo dos testes: [ServeRest - Front-end](https://compassuolfront.serverest.dev/)

---

## Estrutura dos Testes

Os testes foram organizados em arquivos `.robot`, cada um contendo cenários específicos voltados para as funcionalidades da aplicação:

---

## Estrutura do Projeto

```
serverest-testes-web/
|-- resources/
|   |-- base.resource                 # Keywords e configurações globais
|   |-- login_keywords.resource       # Keywords específicas para testes de login
|   |-- produtos_keywords.resource    # Keywords específicas para testes de produtos
|   `-- usuarios_keywords.resource    # Keywords específicas para testes de usuários
|
|-- tests/
|   |-- login_tests.robot             # Casos de teste para funcionalidade de login
|   |-- produtos_tests.robot          # Casos de teste para funcionalidade de produtos
|   `-- usuarios_tests.robot          # Casos de teste para funcionalidade de usuários
|
|-- variables/
|   `-- variables.resource            # Variáveis globais utilizadas nos testes
|
|-- results/                          # Resultados da execução dos testes
|   |-- login/                        # Resultados dos testes de login
|   |-- produtos/                     # Resultados dos testes de produtos
|   `-- usuarios/                     # Resultados dos testes de usuários
|
|-- README.md                         # Documentação do projeto
`-- requirements.txt                  # Dependências do projeto
```

**Obs**: O endpoint `/carrinho` está em construção na aplicação web do ServeRest no momento da realização dos testes. Portanto, não é possível automatizá-lo.

Cada cenário foi implementado com foco em boas práticas de automação, como:

- Clareza nas `keywords`
- `keywords` em **inglês** e `test cases` em **português**
- Reutilização de trechos comuns
- Organização por área funcional

---

## Ambiente e Requisitos de Instalação

Este projeto utiliza o `Robot Framework` com a `Browser Library` para testes automatizados na aplicação ServeRest.

### Dependências

**robotframework-browser**
- **Versão:** 19.6.0
- Integração entre Robot Framework e Playwright.
- Suporte a múltiplos navegadores (Chromium, Firefox, WebKit)
- Captura de screenshots, modo headless ou com GUI
- Geração de relatórios detalhados

**Robot Framework**
- **Versão:** 7.3.1
- Framework principal dos testes

**RequestsLibrary**
- **Versão:** 1.0.2
- Permite testes de API integrados ao Robot

**FakerLibrary**
- **Versão:** 37.3.0
- Geração de dados aleatórios para os testes

### Instalação das dependências

```bash
pip install -r requirements.txt
```

### Inicialização dos navegadores (após instalar robotframework-browser)

```bash
rfbrowser init
```

### Notas Técnicas

- O projeto segue o padrão **Page Object Model** para organização dos testes.
- Os testes são executados no **Chromium** por padrão.
- Os relatórios são armazenados na pasta `results`.

---

## Participantes da Squad Gotham

- [Anna Beatriz Santoro](https://github.com/annasantoro-glitch) – Usuários  
- [Ádony Lagares](https://github.com/adony-lagares) – Login  
- [Ana Carolina Rosa](https://github.com/CacauRosa) – Produtos  
- [Marcos Paulo](https://github.com/Marcosdev03) – Produtos  

---

## Considerações Finais

Esta atividade foi essencial para consolidar o entendimento sobre automação de testes com Robot Framework, especialmente no contexto de aplicações Web. A experiência prática proporcionou maior domínio das ferramentas e reforçou a importância da padronização e organização de testes em equipe.
