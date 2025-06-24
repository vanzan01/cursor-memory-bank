# Архитектура системы `cursor-memory-bank`

## 1. Обзор

`cursor-memory-bank` — это сложный, многоуровневый фреймворк для Cursor AI, разработанный для управления полным циклом разработки программного обеспечения. Его основная цель — обеспечить структурированный, повторяемый и надежный процесс, от первоначального анализа задачи до ее финальной архивации.

Система построена на принципах изоляции, модульности и контекстно-зависимой активации правил для максимальной эффективности и точности работы AI.

## 2. Ключевые принципы архитектуры

1.  **Изоляция и Модульность:** Система разделена на независимые режимы (`VAN`, `PLAN`, `CREATIVE` и т.д.) и рабочие процессы (`Refactoring`, `Integration`). Каждый модуль имеет четкую зону ответственности, что упрощает его поддержку и расширение.
2.  **Контекст — это всё:** Ядром системы является строгий менеджмент контекста. Задачи, запросы пользователя, состояние сессии и даже дата — все это управляется централизованно, чтобы AI всегда имел самую актуальную информацию и не терял фокус.
3.  **Адаптация к сложности:** Система распознает сложность задачи (Уровни 1-4) и автоматически загружает соответствующий набор правил и рабочих процессов. Простые задачи решаются быстро, а сложные проходят через все необходимые этапы планирования и проектирования.
4.  **Автоматизация с возможностью контроля:** Система предлагает два глобальных режима управления:
    *   `UNIVERSAL` (автопилот): Полностью автоматическое выполнение всех фаз разработки.
    *   `STEP_BY_STEP` (ручное управление): Пошаговое выполнение с подтверждением от пользователя на каждом этапе.
5.  **Управляемое пользователем взаимодействие:** Файл `interaction-mode.txt` (`AUTO`/`MANUAL`) позволяет пользователю в любой момент переключить стиль работы AI: от полностью автономного до интерактивного, с запросом подтверждения на ключевых этапах.

## 3. Многоуровневая структура правил

Система организована в логические уровни, каждый из которых строится на предыдущем. Эту иерархию лучше всего иллюстрирует **Дерево связности правил**.

```mermaid
graph TD
    subgraph "LEVEL 0: CORE SYSTEM (Always On)"
        A1["**Task & Context Management**"]
        A2["**Request Versioning (REVIEW)**"]
        A3["**✅ Datetime & Interaction Mode**"]
    end

    subgraph "LEVEL 1: ENVIRONMENT SETUP (VAN Phase)"
        B1["**Git Setup & File Verification**"]
    end

    subgraph "LEVEL 2: DEVELOPMENT PHASES (MODES)"
        C1["VAN<br>Validation & Migration"]
        C2["PLAN<br>Interactive Planning"]
        C3["IMPLEMENT<br>Phased Implementation"]
        C4["QA<br>Quality Assurance"]
        C5["REFLECT<br>Retrospective & Learning"]
    end

    subgraph "LEVEL 3: ADVANCED WORKFLOWS (Contextual)"
        D1["**✅ Integration WF**<br>dependency-documentation,<br>integration-testing..."]
        D2["**✅ Refactoring WF**<br>quality-metrics,<br>gradual-refactoring..."]
        D3["**✅ Advanced Reporting**<br>creative-analysis,<br>statistics-tracking..."]
        D4["**✅ Failure Pattern Analysis**<br>test-failure-patterns.mdc"]
    end

    subgraph "LEVEL 4: SUPERVISOR MODES (New)"
        E1["**UNIVERSAL (Autopilot)**"]
        E2["**STEP_BY_STEP (Manual Pilot)**"]
    end

    %% Connections
    A1 & A2 & A3 -- "Основа" --> C1 & C2 & C3 & C4 & C5
    C1 -- "Инициирует" --> B1

    C3 -- "L3/L4" --> D1
    C4 -- "Test Analysis" --> D4
    C5 -- "L3/L4" --> D2
    C5 -- "Reporting" --> D3

    E1 & E2 -- "Управляют" --> C1 & C2 & C3 & C4 & C5
```
-   **LEVEL 0: Ядро системы:** Правила, которые активны всегда (`alwaysApply: true`). Они управляют задачами, контекстом, датой и режимом взаимодействия, формируя фундамент всей системы.
-   **LEVEL 1: Настройка окружения:** Правила, которые запускаются в самом начале работы (в режиме `VAN`). Они проверяют Git, файловую систему и готовят рабочее пространство.
-   **LEVEL 2: Фазы разработки (Режимы):** Основные рабочие режимы, видимые пользователю (`PLAN`, `IMPLEMENT` и т.д.). Каждый режим решает свою конкретную задачу в цикле разработки.
-   **LEVEL 3: Продвинутые рабочие процессы:** Специализированные модули, которые вызываются контекстно в зависимости от сложности задачи. Например, `Refactoring Workflow` активируется в режиме `REFLECT` для задач уровня L3/L4.
-   **LEVEL 4: Режимы-супервайзоры:** Высокоуровневые режимы `UNIVERSAL` и `STEP_BY_STEP`, которые координируют работу всех остальных фаз.

## 4. Процесс загрузки правил и файлов

Запуск любого режима инициирует цепочку загрузки правил. Пользовательская команда активирует "файл инструкций", который, в свою очередь, загружает "карту процесса", а та — конкретные правила.

**Граф загрузки файлов** наглядно показывает эту иерархию.

```mermaid
graph TD
    subgraph "User Input"
        U_VAN["`VAN`"]
        U_IMPLEMENT["`IMPLEMENT`"]
        U_REFLECT["`REFLECT`"]
        U_QA["`QA`"]
        U_UNIVERSAL["`UNIVERSAL`"]
        U_STEP_BY_STEP["`STEP_BY_STEP`"]
    end

    subgraph "Instruction Files (Entry Points)"
        I_VAN["van_instructions.md"]
        I_IMPLEMENT["implement_instructions.md"]
        I_REFLECT["reflect_archive_instructions.md"]
        I_QA["qa_instructions.md"]
        I_UNIVERSAL["universal_instructions.md"]
        I_STEP["step_by_step_instructions.md"]
    end

    subgraph "Process Maps (Hubs)"
        VM_VAN["visual-maps/van_mode_split/van-mode-map.mdc"]
        VM_IMPLEMENT["visual-maps/implement-mode-map.mdc"]
        VM_REFLECT["visual-maps/reflect-mode-map.mdc"]
        VM_QA["visual-maps/qa-mode-map.mdc"]
    end

    subgraph "Integrated Workflows (Contextual)"
        IntegrationWF["✅ CustomWorkflow/integration/*.mdc"]
        RefactoringWF["✅ CustomWorkflow/refactoring/*.mdc"]
        AdvancedTestingWF["✅ CustomWorkflow/testing/test-failure-patterns.mdc"]
    end

    U_IMPLEMENT --> I_IMPLEMENT
    U_REFLECT --> I_REFLECT
    U_QA --> I_QA

    I_IMPLEMENT --> VM_IMPLEMENT
    I_REFLECT --> VM_REFLECT
    I_QA --> VM_QA

    %% NEW INTEGRATIONS
    VM_IMPLEMENT -- "L3/L4 Tasks" --> IntegrationWF
    VM_REFLECT -- "L3/L4 Tasks" --> RefactoringWF
    VM_QA -- "Test Analysis" --> AdvancedTestingWF

    %% Supervisor Modes
    U_UNIVERSAL --> I_UNIVERSAL
    U_STEP_BY_STEP --> I_STEP
    I_UNIVERSAL & I_STEP -- "Loads all phases" --> VM_VAN & VM_IMPLEMENT & VM_REFLECT & VM_QA
```

## 5. Ключевые подсистемы

### 5.1. Task Management 2.0
Система полностью отходит от монолитного `tasks.md` в пользу атомарной структуры:
-   **Структура:** `memory-bank/tasks/{todo,in_progress,done}/`
-   **Именование:** `YYYY-MM-DD-PRIORITY-CATEGORY-task-name.md`
-   **Преимущества:** Упрощает автоматизацию, отслеживание и архивацию задач.

### 5.2. Context & Request Versioning
Это двойная система для сохранения "ментального состояния" AI и истории диалога.
-   **`current-context.md`:** Содержит самый последний запрос пользователя (`LATEST_REQUEST`) и полную историю предыдущих запросов (`REQUEST_HISTORY`).
-   **Механизм:** Перед обработкой новой команды система автоматически перемещает старый запрос в историю.
-   **Преимущества:** Предотвращает потерю контекста, позволяет AI понимать эволюцию задачи.

### 5.3. Datetime Manager & Interaction Mode
-   **`datetime-manager.mdc`:** Централизованно устанавливает текущую дату и время из командной строки в начале каждой сессии. Это решает проблему использования AI устаревших или захардкоженных дат.
-   **`interaction-mode.txt`:** Файл, содержащий `AUTO` или `MANUAL`. Позволяет пользователю "на лету" переключать поведение AI, требуя либо полного доверия, либо ручного подтверждения ключевых решений.

## 6. Заключение

Архитектура `cursor-memory-bank` представляет собой зрелый и мощный фреймворк. Она сочетает в себе строгую структуру (фазы, уровни сложности) с необходимой гибкостью (режимы `AUTO`/`MANUAL`, `STEP_BY_STEP`). Централизованное управление контекстом, задачами и датой обеспечивает надежность, а модульная система правил позволяет легко расширять функциональность в будущем.
