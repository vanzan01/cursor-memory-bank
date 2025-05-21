## 🎨🎨🎨 ENTERING CREATIVE PHASE: ALGORITHM DESIGN 🎨🎨🎨

**Focus:** Data Management and State Tracking
**Objective:** Design how the system will manage and store real-time market data (recent candles), the state of open positions, and the state of pending orders (including SL/TS/BE) during the real-time inference process.

**Requirements & Constraints:**

- Armazenar um histórico recente de candles de 5 minutos para alimentar o TimesNet.
- Manter o estado atual das posições abertas (símbolo, direção, quantidade, preço de entrada, preço atual, ID da ordem NT8).
- Manter o estado das ordens pendentes gerenciadas localmente (Stop Loss, Trailing Stop, Breakeven), incluindo seus IDs na API do NT8 e parâmetros de gerenciamento.
- Permitir acesso eficiente de leitura e escrita a esses dados pelos componentes da pipeline de inferência e pelas funções de gerenciamento de posição.
- Considerar o ambiente de execução (VPM, possivelmente um único processo Python).
- Necessidade de persistência para dados de treinamento (histórico completo de candles, histórico de trades para PPO/XGBoost) – _Esta fase criativa focará no estado em tempo real._
- Otimizar para baixa latência no acesso aos dados durante a inferência.

## OPTIONS ANALYSIS

### Option 1: In-Memory Objects/Dictionaries

**Description**: Utilizar estruturas de dados nativas do Python (listas, dicionários, classes) para armazenar todos os dados e o estado na memória RAM do processo principal da aplicação. O histórico recente de candles pode ser mantido em uma lista ou deque de tamanho fixo. Posições e ordens podem ser armazenadas em dicionários indexados por ID.

**Pros**:

- **Alta Performance**: Acesso extremamente rápido aos dados, pois tudo está na memória.
- **Simplicidade de Implementação**: Utiliza construções básicas da linguagem, fácil de codificar e integrar.
- **Baixa Latência**: Ideal para o fluxo de inferência em tempo real que precisa de acesso rápido aos dados mais recentes.

**Cons**:

- **Falta de Persistência**: Todos os dados e o estado são perdidos se a aplicação parar ou falhar.
- **Sem Compartilhamento Direto**: Não é adequado para compartilhar estado facilmente entre múltiplos processos ou máquinas (embora o design atual seja de processo único).
- **Consumo de Memória**: Pode consumir memória dependendo da quantidade de histórico de candles e posições/ordens ativas mantidas.

**Complexity**: Low
**Implementation Time**: Low

### Option 2: Local File-Based Storage (e.g., SQLite Database)

**Description**: Armazenar o histórico de candles e o estado das posições/ordens em um banco de dados local baseado em arquivo, como SQLite. A aplicação se conectaria a este banco de dados para ler e escrever informações conforme necessário. O histórico de candles recentes pode ser consultado, e as atualizações de estado seriam transações no banco.

**Pros**:

- **Persistência**: Os dados são salvos em disco e persistem entre execuções da aplicação.
- **Estrutura Organizada**: Bancos de dados fornecem uma estrutura clara para os dados.
- **Consultas Relacionais**: Facilita consultas complexas se necessário.

**Cons**:

- **Latência Mais Alta**: Acesso a disco é significativamente mais lento que acesso à memória.
- **Complexidade de Concorrência**: Gerenciar escritas concorrentes (se houver threads/loops separados acessando) pode requerer cuidado com locks.
- **Overhead de I/O**: Operações de leitura/escrita constantes podem gerar overhead.

**Complexity**: Medium
**Implementation Time**: Medium

### Option 3: External In-Memory Data Store (e.g., Redis)

**Description**: Utilizar um serviço externo leve como Redis (rodando localmente na VPM) para armazenar o histórico recente de candles (usando estruturas de lista ou séries temporais do Redis) e o estado das posições/ordens (usando hashes ou JSON). A aplicação Python se comunicaria com o Redis via rede local.

**Pros**:

- **Alta Performance (Quase In-Memory)**: Muito rápido para a maioria das operações, pois opera primariamente na RAM.
- **Persistência Opcional**: Pode ser configurado para salvar dados em disco (snapshotting ou AOF).
- **Compartilhamento Fácil**: Ideal se a arquitetura evoluir para múltiplos processos ou serviços.
- **Estruturas de Dados Ricas**: Suporta listas, hashes, sets, etc., úteis para modelar os dados.
- **Concorrência Gerenciada**: Projetado para lidar com múltiplos clientes concorrentes.

**Cons**:

- **Dependência Externa**: Requer a instalação e gerenciamento de um serviço Redis.
- **Latência de Rede (Local)**: Embora mínima, há uma comunicação de rede envolvida em comparação com acesso direto à memória.
- **Complexidade de Integração**: Requer o uso de uma biblioteca cliente Redis e o gerenciamento da conexão.

**Complexity**: High
**Implementation Time**: High

## 🎨 CREATIVE CHECKPOINT: Decision Made for Data Management and State Tracking Design

- **Decision:** Implement Real-Time Data Management and State Tracking using In-Memory Objects/Dictionaries (Option 1).
- **Rationale:** Given the focus on a single process real-time inference pipeline operating on 5-minute candles, the primary requirements are high performance and low latency access to recent data and current state. In-memory objects provide the simplest implementation and the fastest access, which is critical for the inference loop. Persistence for training data will be handled separately. While it lacks persistence for the real-time state itself, the loss of state on restart (losing active positions/orders) is an acceptable trade-off for this first version focused on core logic, especially since a production system would likely have external order management and account reconciliation features to handle restarts.

**Implementation Guidelines (In-Memory Objects/Dictionaries):**

1.  **Market Data Buffer:** Create a data structure (e.g., `collections.deque`) to store the most recent N candles required by the TimesNetExtractor. Update this buffer as new candles arrive.
2.  **Position State Dictionary:** Use a dictionary to store the state of open positions, keyed perhaps by instrument symbol or a unique trade ID. Each entry should contain relevant details (entry price, size, direction, current SL/TS/BE parameters, linked NT8 order IDs).
3.  **Pending Order State Dictionary:** Use another dictionary to track pending orders that are being managed locally (e.g., the current Stop Loss order ID on NT8 for each position) and their related parameters for dynamic adjustments.
4.  **Centralized Access:** Consider creating a dedicated class (e.g., `TradingState`) that encapsulates these data structures and provides methods for components to safely read and update the state.
5.  **Concurrency (if needed):** If threads are introduced later (e.g., for a separate price update listener), ensure thread-safe access to shared in-memory state using locks.
6.  **Initialization:** Define how the initial state is loaded when the system starts (e.g., from a saved snapshot, or by querying the NT8 API for current open positions and orders if that's feasible).

## 🎨🎨🎨 EXITING CREATIVE PHASE 🎨🎨🎨

**Summary:** Explored design options for real-time data management and state tracking, and decided on using In-Memory Objects/Dictionaries for performance and simplicity in the initial single-process VPM deployment.
**Key Decisions:** In-memory storage for recent candles, open positions, and pending order state.
**Next Steps:** Document the next creative phase for the design of the Error Handling and Logging system.
