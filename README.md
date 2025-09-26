# 🚀 Projeto Pokédex Mobile em SwiftUI

## Visão Geral

Este projeto é uma **aplicação iOS nativa** que simula uma Pokédex moderna. Foi desenvolvido em **SwiftUI** e utiliza a PokeAPI para buscar dados e imagens dos Pokémon.

O principal propósito deste repositório é demonstrar o domínio sobre o *framework* SwiftUI, o gerenciamento de estados reativos (`ObservableObject`) e a implementação de arquiteturas de dados assíncronas (`async/await`) em um ambiente de desenvolvimento atualizado.

Este é um exercício intencional de **revisitar e consolidar conceitos fundamentais de desenvolvimento iOS**, aplicando as melhores e mais recentes práticas do Swift.

---

## 🎯 Destaques Técnicos e Conhecimento Demonstrado

O desenvolvimento desta Pokédex foi estruturado para exibir proficiência nas seguintes áreas, buscando sempre a **legibilidade, segurança e manutenibilidade** do código:

### 1. Concorrência e *Networking* Modernos
* **`async/await`**: Utilização da sintaxe de concorrência moderna do Swift (introduzida no Swift 5.5+) para buscar e decodificar dados da PokeAPI de forma segura e eficiente.
* **Decodificação Segura**: Implementação de lógica de *networking* que retorna tipos `Result` ou usa o padrão `async throws`, garantindo que a aplicação se recupere graciosamente de falhas de rede ou erros de decodificação.

### 2. Gerenciamento de Estado Reativo (MVVM)
* **`@StateObject` e `@EnvironmentObject`**: Uso estratégico de *property wrappers* para gerenciar o ciclo de vida do **`ViewModel`** e injetar a dependência através da hierarquia de Views.
* **`ObservableObject` e `@Published`**: Modelagem da lógica de negócios e estado da aplicação dentro do `ViewModel`, garantindo que a UI se atualize automaticamente em resposta a mudanças de dados (reatividade).

### 3. Arquitetura e Componentização em SwiftUI
* **Componentes Otimizados**: Uso do **`LazyVGrid`** para exibição eficiente de grandes listas e do **`AsyncImage`** para carregamento assíncrono de imagens da web com gestão dos estados de carregamento (`ProgressView`) e erro.
* **Busca em Tempo Real**: Implementação de um filtro de busca reativo que atualiza a lista enquanto o usuário digita.

---

## 🛠️ Tecnologias Utilizadas

| Componente | Detalhe Técnico |
| :--- | :--- |
| **Linguagem** | Swift 5.8+ |
| **UI Framework** | SwiftUI (iOS 15+) |
| **Arquitetura** | MVVM (Model-View-ViewModel) |
| **Dados** | PokeAPI (Requisições HTTP/JSON) |
| **Concorrência** | Swift Concurrency (`async`/`await`) |

---

## 🏃 Como Rodar o Projeto

1.  **Clone o Repositório:**
    ```bash
    git clone [SUBSTITUA_PELA_URL_DO_SEU_REPOSITORIO]
    cd NomeDoSeuProjeto
    ```
2.  **Abra no Xcode:**
    Abra o arquivo `.xcodeproj` ou `.xcworkspace`.
3.  **Compile:**
    Selecione um simulador (ex: iPhone 15) e pressione `Cmd + R` para construir e rodar o projeto.

---

> 👨‍💻 **Nota:** Este projeto reflete meu compromisso contínuo com a **excelência técnica**. A aplicação de concorrência moderna e a refatoração demonstram minha capacidade de **transicionar de práticas legadas para os padrões mais atuais da Apple**, resultando em um código limpo, seguro e manutenível.
