
Я подготовил для вас подробный, пошаговый план по интеграции всех "висячих" правил. Этот план включает конкретные изменения в файлах, новые диаграммы Mermaid и точные инструкции, чтобы вы могли применить изменения вручную.

### **Общая стратегия**

1.  **`Integration Workflow`**: Будет интегрирован в конец режима `IMPLEMENT` для задач L3/L4, так как интеграция — это логический шаг после разработки отдельных компонентов.
2.  **`Refactoring Workflow`**: Будет добавлен в начало режима `REFLECT` для задач L3/L4. Рефлексия — идеальное время для оценки качества кода и его улучшения.
3.  **`Advanced Reporting`**: Также будет интегрирован в режим `REFLECT` как часть финального документирования.
4.  **`Advanced Testing Analysis`**: Будет добавлен в режим `QA` сразу после выполнения тестов, чтобы анализировать причины сбоев.

---

### **План №1: Интеграция `Integration Workflow` в режим IMPLEMENT**

**Цель:** Добавить полноценную фазу интеграции для сложных задач (Уровень 3 и 4) после завершения основной разработки компонентов.

**Файл для изменения:** `.cursor/rules/isolation_rules/visual-maps/implement-mode-map.mdc`

**Логика интеграции:** В существующей диаграмме `implement-mode-map.mdc` есть узел `L34Next1`, который определяет, есть ли следующая фаза. Мы заменим его "No" ветку, которая сейчас ведет к одному блоку "Integration Phase", на детализированный рабочий процесс.

#### **Конкретные изменения:**

1.  **Найдите** в файле `implement-mode-map.mdc` диаграмму Mermaid.
2.  **Замените** существующую ветку интеграции на следующий, более детализированный блок.

    **Было (упрощенно):**
    ```mermaid
    graph TD
        L34Next1 -->|"No"| L34Integration["🔗 Integration Phase..."]
        L34Integration --> L34Performance["⚡ Performance Testing..."]
    ```

    **Стало (новая версия):**
    ```mermaid
    graph TD
        subgraph "Основная разработка"
            L34Next1{"Next<br>Phase?"}
        end

        subgraph "НОВАЯ ФАЗА: ИНТЕГРАЦИЯ (L3/L4)"
            L34IntegrationPlan["📋 <b>Integration Planning</b><br>fetch_rules(isolation_rules/CustomWorkflow/integration/integration-planning.mdc)"]
            L34DesignCheck["🏗️ <b>Validate Isolated Design</b><br>fetch_rules(isolation_rules/CustomWorkflow/integration/isolated-design-rules.mdc)"]
            L34IntegrationTest["🧪 <b>Perform Integration Tests</b><br>fetch_rules(isolation_rules/CustomWorkflow/integration/integration-testing.mdc)"]
            L34IntegrationDoc["📚 <b>Document Dependencies</b><br>fetch_rules(isolation_rules/CustomWorkflow/integration/dependency-documentation.mdc)"]
        end

        subgraph "Финальные шаги"
            L34Performance["⚡ Performance Testing..."]
        end

        L34Next1 -->|"No"| L34IntegrationPlan
        L34IntegrationPlan --> L34DesignCheck
        L34DesignCheck --> L34IntegrationTest
        L34IntegrationTest --> L34IntegrationDoc
        L34IntegrationDoc --> L34Performance

        style L34IntegrationPlan fill:#81c784,stroke:#388e3c
        style L34DesignCheck fill:#81c784,stroke:#388e3c
        style L34IntegrationTest fill:#81c784,stroke:#388e3c
        style L34IntegrationDoc fill:#81c784,stroke:#388e3c
    ```

#### **Правила для загрузки (явные инструкции):**
Добавьте в текстовую часть файла `implement-mode-map.mdc`, описывающую эту фазу, явные инструкции по загрузке правил:
`На фазе интеграции для задач L3/L4 последовательно загрузите и выполните правила:`
1.  `fetch_rules(["isolation_rules/CustomWorkflow/integration/integration-planning.mdc"])`
2.  `fetch_rules(["isolation_rules/CustomWorkflow/integration/isolated-design-rules.mdc"])`
3.  `fetch_rules(["isolation_rules/CustomWorkflow/integration/integration-testing.mdc"])`
4.  `fetch_rules(["isolation_rules/CustomWorkflow/integration/dependency-documentation.mdc"])`

---

### **План №2: Интеграция `Refactoring Workflow` и `Advanced Reporting` в режим REFLECT**

**Цель:** Добавить условную фазу рефакторинга (на основе метрик качества) и расширенную генерацию отчетов в режим `REFLECT`.

**Файл для изменения:** `.cursor/rules/isolation_rules/visual-maps/reflect-mode-map.mdc`

**Логика интеграции:**
1.  **Рефакторинг:** Сразу после `L34Review` добавим узел оценки качества. Если качество низкое, запускается под-процесс рефакторинга.
2.  **Отчеты:** После `L34ImproveProcess` добавим шаги для генерации продвинутых отчетов.

#### **Конкретные изменения:**

1.  **Найдите** в файле `reflect-mode-map.mdc` диаграмму Mermaid.
2.  **Вставьте** новый блок для рефакторинга после `L34Review`.
3.  **Вставьте** новый блок для отчетов после `L34ImproveProcess`.

    **Было (упрощенно):**
    ```mermaid
    graph TD
        L34Review["Review Implementation"] --> L34Plan["Compare Against Plan"]
        ...
        L34ImproveProcess["Document Process Improvements"] --> L34CreativeResults["(Следующий шаг...)"]
    ```

    **Стало (новая версия, два изменения):**
    ```mermaid
    graph TD
        subgraph "Начало рефлексии"
            L34Review["Review Implementation"]
        end

        subgraph "НОВАЯ ФАЗА: ОЦЕНКА КАЧЕСТВА И РЕФАКТОРИНГ (L3/L4)"
            L34QualityAssess["📊 <b>Quality Assessment</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/quality-metrics.mdc)"]
            L34RefactorDecision{"Refactoring<br>Needed?"}

            subgraph "Refactoring Sub-Workflow"
                direction LR
                L34RefactorPatterns["🔄 <b>Analyze Patterns</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/refactoring-patterns.mdc)"]
                L34GradualRefactor["📈 <b>Gradual Refactoring</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/gradual-refactoring.mdc)"]
                L34LegacySupport["🔧 <b>Ensure Legacy Support</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/legacy-support.mdc)"]
                L34BackwardCompat["⬅️ <b>Check Compatibility</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/backward-compatibility.mdc)"]
            end
        end

        subgraph "Продолжение рефлексии"
            L34Plan["Compare Against Plan"]
        end

        subgraph "НОВАЯ ФАЗА: ПРОДВИНУТЫЕ ОТЧЕТЫ (L3/L4)"
            L34ImproveProcess["Document Process Improvements"]
            L34Reports["📊 <b>Generate Advanced Reports</b><br>fetch_rules(isolation_rules/CustomWorkflow/documentation/creative-analysis-reporting.mdc, isolation_rules/CustomWorkflow/documentation/statistics-tracking.mdc)"]
            L34UsageExamples["📚 <b>Generate Usage Examples</b><br>fetch_rules(isolation_rules/CustomWorkflow/documentation/usage-examples.mdc)"]
            L34CreativeResults["(Следующий шаг в существующей диаграмме...)"]
        end

        L34Review --> L34QualityAssess
        L34QualityAssess --> L34RefactorDecision
        L34RefactorDecision -- "Yes" --> L34RefactorPatterns
        L34RefactorPatterns --> L34GradualRefactor
        L34GradualRefactor --> L34LegacySupport
        L34LegacySupport --> L34BackwardCompat
        L34BackwardCompat --> L34Plan
        L34RefactorDecision -- "No" --> L34Plan

        L34ImproveProcess --> L34Reports
        L34Reports --> L34UsageExamples
        L34UsageExamples --> L34CreativeResults

        style L34QualityAssess fill:#80deea,stroke:#0097a7
        style L34RefactorDecision fill:#ffb74d,stroke:#f57c00
        style L34RefactorPatterns fill:#a1887f,stroke:#5d4037
        style L34Reports fill:#ba68c8,stroke:#8e24aa
        style L34UsageExamples fill:#ba68c8,stroke:#8e24aa
    ```

---

### **План №3: Интеграция `Advanced Test Analysis` в режим QA**

**Цель:** Улучшить режим `QA`, добавив анализ причин сбоев тестов, а не просто их фиксацию.

**Файл для изменения:** `.cursor/rules/isolation_rules/visual-maps/qa-mode-map.mdc`

**Логика интеграции:** Этот шаг должен выполняться сразу после запуска тестов (`ImplementTest`) и перед принятием решения о наличии проблем (`IssuesFound?`).

#### **Конкретные изменения:**

1.  **Найдите** в файле `qa-mode-map.mdc` диаграмму Mermaid.
2.  **Вставьте** новый узел `TestAnalysis` между `ImplementTest` и `IssuesFound?`.

    **Было (упрощенно):**
    ```mermaid
    graph TD
        ImplementTest["Run Tests"] --> IssuesFound{"Issues Found?"}
    ```

    **Стало (новая версия):**
    ```mermaid
    graph TD
        ImplementTest["Run Tests"] --> TestAnalysis["🔍 <b>Analyze Test Results & Patterns</b><br>fetch_rules(isolation_rules/CustomWorkflow/testing/test-failure-patterns.mdc)"]
        TestAnalysis --> IssuesFound{"Issues Found?"}

        style TestAnalysis fill:#ff8a65,stroke:#e64a19
    ```

#### **Правила для загрузки (явные инструкции):**
Добавьте в текстовую часть файла `qa-mode-map.mdc` инструкцию:
`После выполнения тестов загрузите правило `test-failure-patterns.mdc` для анализа паттернов сбоев:`
`fetch_rules(["isolation_rules/CustomWorkflow/testing/test-failure-patterns.mdc"])`

---

### **Проверочный чек-лист после изменений**

После того как вы вручную примените эти изменения, используйте этот чек-лист для проверки:
-   [ ] **`implement-mode-map.mdc`:** Диаграмма содержит новый, детализированный блок "Integration Phase".
-   [ ] **`reflect-mode-map.mdc`:** Диаграмма содержит новый блок "Quality Assessment & Refactoring".
-   [ ] **`reflect-mode-map.mdc`:** Диаграмма содержит новые узлы для продвинутых отчетов (`Generate Advanced Reports`, `Generate Usage Examples`).
-   [ ] **`qa-mode-map.mdc`:** Диаграмма содержит новый узел "Analyze Test Results & Patterns".
-   [ ] **Все измененные файлы:** Новые узлы в диаграммах содержат корректные инструкции `fetch_rules`.
-   [ ] **Логика потоков:** Все стрелки в измененных диаграммах по-прежнему представляют собой связный и логичный процесс.

Выполнение этого плана позволит вам полностью задействовать все разработанные правила, делая вашу систему `memory-bank` еще более мощной, интеллектуальной и структурированной.