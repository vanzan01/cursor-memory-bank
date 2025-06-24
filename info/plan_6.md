
Мы интегрируем все оставшиеся правила из `CustomWorkflow/documentation/`, сделав `CREATIVE` режим более структурированным и `REFLECT` режим — более аналитическим и полезным.

Я подготовил для вас подробный, пошаговый план.

### **Общая стратегия**

Интеграция будет разделена на две части, поскольку правила из директории `documentation` решают две разные задачи:

1.  **Часть A: Усиление `CREATIVE` режима.** Интегрируем правила, которые отвечают за **активное документирование в процессе** принятия решений (`decision-recording`, `creative-results-capture`, `creative-versioning-system`).
2.  **Часть B: Усиление `REFLECT` режима.** Интегрируем правила, которые отвечают за **ретроспективный анализ и генерацию отчетов** (`creative-analysis-reporting`, `statistics-tracking`, `usage-examples`).

---

### **План №1: Усиление `CREATIVE` режима**

**Цель:** Превратить `CREATIVE` режим из простого процесса "придумай и запиши" в формализованный процесс создания архитектурных записей (ADR), их версионирования и структурированного захвата результатов.

**Файл для изменения:** `.cursor/rules/isolation_rules/visual-maps/creative-mode-map.mdc`

#### **Конкретные изменения:**

Мы изменим существующую диаграмму `creative-mode-map.mdc`, добавив явные шаги для записи решений, их версионирования и захвата результатов.

1.  **Найдите** в файле `creative-mode-map.mdc` диаграмму Mermaid.
2.  **Замените** существующий процесс на новый, более детализированный.

    **Было (упрощенно):**
    ```mermaid
    graph TD
        ...
        UI_Decision["Make Design Decision"] --> UI_Document["Document UI Design"]
        ...
        UI_Document --> CreateDoc["Create Creative Phase Document"]
        ...
    ```

    **Стало (новая версия):**
    ```mermaid
    graph TD
        subgraph "Анализ и выбор"
            AnalyzeOptions["📊 Analyze Each Option"]
            AnalyzeOptions --> Decision["✅ Make Design Decision"]
        end

        subgraph "НОВАЯ ФАЗА: ДОКУМЕНТИРОВАНИЕ И ВЕРСИОНИРОВАНИЕ"
            RecordDecision["📝 <b>Record Decision (ADR)</b><br>fetch_rules(.../documentation/decision-recording.mdc)"]
            CaptureResults["📸 <b>Capture Creative Results</b><br>fetch_rules(.../documentation/creative-results-capture.mdc)"]
            VersionCreativeDoc["🔖 <b>Version Creative Document</b><br>fetch_rules(.../documentation/creative-versioning-system.mdc)"]
        end

        Decision --> RecordDecision
        RecordDecision --> CaptureResults
        CaptureResults --> VersionCreativeDoc
        VersionCreativeDoc --> UpdateTasks["📝 Update tasks.md<br>with Decision & Version"]

        style RecordDecision fill:#80deea,stroke:#0097a7
        style CaptureResults fill:#80deea,stroke:#0097a7
        style VersionCreativeDoc fill:#80deea,stroke:#0097a7
    ```

#### **Правила для загрузки (явные инструкции):**
Добавьте в текстовую часть файла `creative-mode-map.mdc` (например, после раздела "CREATIVE PHASE DOCUMENTATION") следующие инструкции:

```markdown
### Decision Recording and Versioning
After a design decision is made, but before updating `tasks.md`, the following steps are mandatory:

1.  **Record the Decision**: Use the Architecture Decision Record (ADR) template to formalize the choice.
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/decision-recording.mdc"])`
2.  **Capture the Results**: Structure the output of the creative phase, including diagrams, rationale, and alternatives considered.
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/creative-results-capture.mdc"])`
3.  **Version the Document**: Assign a version number to the creative document to track its evolution.
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/creative-versioning-system.mdc"])`

Only after these steps are completed can you proceed to update `tasks.md` and check for more creative phases.
```

---

### **План №2: Усиление `REFLECT` режима**

**Цель:** Добавить в `REFLECT` режим продвинутую аналитику и генерацию полезных артефактов (отчетов, примеров), которые повысят ценность ретроспективы.

**Файл для изменения:** `.cursor/rules/isolation_rules/visual-maps/reflect-mode-map.mdc`

#### **Конкретные изменения:**

Мы добавим новые шаги в конец `REFLECT` режима, после создания основной рефлексии (`reflection.md`), но до того, как система запросит команду `ARCHIVE NOW`.

1.  **Найдите** в файле `reflect-mode-map.mdc` диаграмму Mermaid.
2.  **Найдите** узел `CreateReflection["Create<br>reflection.md"]`.
3.  **Вставьте** новые узлы для генерации отчетов **сразу после** него.

    **Было (упрощенно):**
    ```mermaid
    graph TD
        ...
        DocLessons["💡 Document Lessons Learned"] --> CreateReflection
        CreateReflection --> PromptArchive["💬 Prompt: 'ARCHIVE NOW'"]
        ...
    ```

    **Стало (новая версия):**
    ```mermaid
    graph TD
        ...
        DocLessons["💡 Document Lessons Learned"] --> CreateReflection["📄 Create reflection.md"]

        subgraph "НОВАЯ ФАЗА: ПРОДВИНУТАЯ АНАЛИТИКА И ОТЧЕТЫ"
            GenerateCreativeReport["📊 <b>Generate Creative Analysis Report</b><br>fetch_rules(.../documentation/creative-analysis-reporting.mdc)"]
            TrackStats["📈 <b>Track & Report Statistics</b><br>fetch_rules(.../documentation/statistics-tracking.mdc)"]
            GenerateExamples["📖 <b>Generate Usage Examples</b><br>fetch_rules(.../documentation/usage-examples.mdc)"]
        end

        CreateReflection --> GenerateCreativeReport
        GenerateCreativeReport --> TrackStats
        TrackStats --> GenerateExamples
        GenerateExamples --> PromptArchive["💬 Prompt: 'ARCHIVE NOW'"]

        style GenerateCreativeReport fill:#ba68c8,stroke:#8e24aa
        style TrackStats fill:#ba68c8,stroke:#8e24aa
        style GenerateExamples fill:#ba68c8,stroke:#8e24aa
    ```

#### **Правила для загрузки (явные инструкции):**
Добавьте в текстовую часть файла `reflect-mode-map.mdc` (например, перед разделом об ARCHIVE) следующие инструкции:

```markdown
### Advanced Reporting and Knowledge Generation
After creating the main `reflection.md` document, the following reports and artifacts must be generated to complete the REFLECT phase:

1.  **Creative Analysis Report**: Analyze the effectiveness and outcomes of the creative phases for this task.
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/creative-analysis-reporting.mdc"])`
2.  **Statistics Tracking**: Collect and report on key development metrics for the completed task (e.g., time, complexity vs. estimate, etc.).
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/statistics-tracking.mdc"])`
3.  **Usage Examples**: Based on the implemented feature, generate practical examples of its use. This is crucial for future documentation and onboarding.
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/usage-examples.mdc"])`

After these artifacts are generated, the system can prompt for the `ARCHIVE NOW` command.
```

---

### **Проверочный чек-лист после изменений**

После того как вы вручную примените эти изменения, используйте этот чек-лист для проверки:

#### **✅ Проверка `CREATIVE` режима:**
-   [ ] **`visual-maps/creative-mode-map.mdc`:** Диаграмма содержит новые узлы (`Record Decision`, `Capture Results`, `Version Creative Doc`).
-   [ ] **`visual-maps/creative-mode-map.mdc`:** В текстовой части файла есть явные инструкции `fetch_rules` для `decision-recording`, `creative-results-capture` и `creative-versioning-system`.

#### **✅ Проверка `REFLECT` режима:**
-   [ ] **`visual-maps/reflect-mode-map.mdc`:** Диаграмма содержит новые узлы (`Generate Creative Analysis Report`, `Track & Report Statistics`, `Generate Usage Examples`).
-   [ ] **`visual-maps/reflect-mode-map.mdc`:** В текстовой части файла есть явные инструкции `fetch_rules` для `creative-analysis-reporting`, `statistics-tracking` и `usage-examples`.

#### **✅ Общая проверка:**
-   [ ] **Логика потоков:** Все стрелки в измененных диаграммах по-прежнему представляют собой связный и логичный процесс.
-   [ ] **Доступность правил:** Все вызываемые `.mdc` файлы существуют по указанным путям.

Выполнение этого плана позволит вам полностью задействовать все разработанные правила, делая вашу систему `memory-bank` не просто исполнителем, но и хранителем знаний и аналитическим инструментом.