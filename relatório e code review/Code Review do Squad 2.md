# Code Review – QA-ntastic Five - Projeto de Automação Web com Robot Framework (ServeRest)

## Introdução

Este documento apresenta a análise técnica (code review) do [projeto de Automação Web utilizando Robot Framework desenvolvido pela **Squad 2 - QA-ntastic Five**](https://github.com/ThaisNogueiraB/serverest-robotframework-tests) como parte das atividades do estágio em QA da Compass UOL.  
A análise foi conduzida pela **Squad 1 - Gotham**, responsável por revisar e avaliar o código com foco em boas práticas, qualidade estrutural e manutenibilidade.

---

## Pontos Positivos

### Estrutura do Projeto

- Boa separação entre diretórios de testes e recursos (`tests/` e `resources/`).  
  - Isso facilita a navegação no projeto, permitindo que testes e componentes reutilizáveis fiquem bem organizados.

- Organização clara dos arquivos por funcionalidades.  
  - Cada funcionalidade tem seus próprios arquivos, o que ajuda na escalabilidade e manutenção do projeto.

- README bem documentado, com explicações adequadas sobre o projeto e como executá-lo.  
  - Fornece autonomia para novos colaboradores e facilita o onboarding de quem for utilizar ou revisar o projeto futuramente.

### Boas Práticas de Automação

- Implementação de keywords reutilizáveis, promovendo reutilização e clareza.  
  - Isso evita duplicação de código e facilita manutenções futuras.

- Uso de arquivos de configuração externos (`api.json`) para armazenar dados de testes.  
  - Separa os dados do código, seguindo o princípio de separação de responsabilidades e facilitando alterações dinâmicas.

### Cobertura de Testes

- Testes cobrindo funcionalidades principais como login, cadastro de usuários e produtos.  
  - Foco adequado nos fluxos mais críticos da aplicação, garantindo uma base de validação funcional sólida.

- Geração de evidências visuais com screenshots, importante para análise de falhas.  
  - Útil especialmente em ambientes de QA, pois fornece evidências visuais em caso de erro.

### Colaboração em Equipe

- Indícios de trabalho colaborativo com comentários indicando autoria das contribuições.  
  - Essa transparência evidencia comunicação e responsabilidade entre os membros.

- Divisão clara de responsabilidades entre os membros do time mostrado na separação das branchs no GitHub, refletindo organização interna.  
  - Ajuda a manter a fluidez do projeto, evitando sobrecarga ou retrabalho.

### Configuração e Manutenção

- Setup e Teardown definidos adequadamente para garantir o estado correto dos testes.  
  - Esses blocos garantem que cada teste inicie em um estado previsível e limpo, aumentando a confiabilidade dos testes.

- Uso de `requirements.txt` para gestão de dependências.  
  - Melhora a reprodutibilidade do ambiente de testes em qualquer máquina ou CI/CD pipeline.

- Centralização de variáveis sensíveis e de ambiente em arquivos específicos.  
  - Boa prática de segurança e organização, facilita alterações em ambientes distintos.

---

## Sugestões de Melhoria

### Padronização

- Padronizar nomes de arquivos (por exemplo, uniformizar `_test.robot` vs `_tests.robot`).  
  - Manter uma convenção única ajuda na leitura do repositório e evita confusão na hora de referenciar arquivos.

### Gestão de Esperas

- Evitar uso de `Sleep` fixo e adotar esperas condicionais como `Wait For Element State`.  
  - `Sleep` fixas tornam os testes mais lentos e frágeis; usar esperas inteligentes melhora desempenho e confiabilidade.

### Organização de Keywords

- Evitar criar keywords com mesma funcionalidade e optar por colocar keyword utilizada em mais de um teste em `common.resource`, como feito na maior parte do projeto.  
  - Evita duplicidade e mantém o repositório mais limpo, além de promover maior reutilização e facilidade de manutenção.

### Cenários de teste

- Criar cenários de teste com caminhos ruins.  
  - Adicionar testes negativos (ex: login inválido, cadastro com campos vazios) fortalece a cobertura e ajuda a encontrar falhas ocultas.

---

## Conclusão

O projeto entregue pela Squad 2 demonstra um excelente início na jornada de automação de testes.  
A estrutura organizada, o uso de boas práticas e a cobertura de testes estratégicos revelam um bom domínio dos conceitos iniciais do Robot Framework e automação web.

As sugestões aqui apresentadas são incrementais e têm como objetivo refinar ainda mais a qualidade do projeto.