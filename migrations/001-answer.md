Отлично, я полностью понимаю задачу. Это стратегически важное улучшение, которое сделает систему `memory-bank` по-настоящему универсальной и независимой от платформы. Мы преобразуем правила из конкретных инструкций для одной среды в абстрактные, принципиальные руководства, которые AI сможет адаптировать под любой технологический стек.

Я буду общаться с вами на русском, но весь генерируемый код, названия файлов, комментарии и документация будут на английском языке, в соответствии с лучшими практиками, которые мы установили.

### **Предлагаемый план рефакторинга**

Я предлагаю разбить эту большую задачу на несколько логических фаз, чтобы мы могли контролировать процесс и проверять результат на каждом этапе.

1.  **Фаза 1: Перевод и унификация имен файлов (Foundation).**
    -   Я системно пройду по всем файлам правил.
    -   Переведу все описания, заголовки и текст в `description` на английский язык.
    -   Переименую файлы, содержащие кириллицу (например, `legacy-migration-guide.md`), в английские эквиваленты в `kebab-case`.
    -   Это создаст единую и консистентную базу для дальнейшей работы.

2.  **Фаза 2: Абстракция и преобразование в псевдокод (Core Refactoring).**
    -   Я проанализирую каждое правило на наличие платформенно-зависимых команд (`mkdir`, `ls`, `npm`, `bun` и т.д.).
    -   Я заменю эти команды на высокоуровневые описания действий или псевдокод, который описывает *намерение*, а не *конкретную реализацию*. Например, вместо `mkdir -p my-dir` будет `ensure_directory_exists("my-dir")`.
    -   Я добавлю комментарии, указывающие, что это псевдокод, который AI должен адаптировать.

3.  **Фаза 3: Внедрение логики управления скриптами (New Capability).**
    -   Я разработаю или дополню существующее правило (например, `Core/command-execution.mdc`), чтобы включить в него новую логику:
        1.  Перед выполнением "скрипта" AI должен проверить, существует ли он в `memory-bank/scripts/`.
        2.  Если скрипт не существует, AI должен сгенерировать его на основе псевдокода из правила и сохранить в `memory-bank/scripts/`.
        3.  Только после этого выполнять команду.

4.  **Фаза 4: Финальный обзор.**
    -   Мы вместе проведем финальную проверку, чтобы убедиться, что все правила абстрагированы, понятны и система готова к работе в любом окружении.

---

Давайте начнем с демонстрации на конкретном примере, чтобы вы увидели, как это будет выглядеть. Возьмем правило `Core/datetime-manager.mdc`, так как оно фундаментально и содержит команды, которые нужно абстрагировать.

Вот как я его преобразую:

`edit_file`
`./.cursor/rules/isolation_rules/Core/datetime-manager.mdc`
```mdc
---
description: "Centralized system for date and time management. Ensures the correct retrieval and setting of the system date, acting as the single source of truth for all date/time operations."
globs: "**/**"
alwaysApply: true
---

# DATETIME MANAGER SYSTEM

> **TL;DR:** This module is the single source of truth for all date and time operations. It ensures that the system always operates with an up-to-date date retrieved from the execution environment, not a hardcoded value.

## ⚙️ Core Functions

### 1. System Date Initialization and Verification

**Principle:** This function must be called at the very beginning of any stateful workflow (`VAN`, `UNIVERSAL`, `STEP_BY_STEP`, etc.) to establish a consistent timestamp for the session.

```
// Pseudocode for the AI assistant.
// This logic should be adapted to the project's specific language and framework.
function initialize_system_date() {
  // 1. Get the current date and time from the system's execution environment.
  // The format should be standardized (e.g., ISO 8601).
  current_datetime = system.getCurrentDateTime("YYYY-MM-DD HH:mm:ss")
  current_date = extract_date_from_datetime(current_datetime)

  // 2. Get the canonical path for the date file using the Task Artifact Manager.
  // This ensures the path is consistent across the system.
  date_file_path = get_task_artifact_path("current_date_file") // e.g., memory-bank/system/current-date.txt

  // 3. Ensure the parent directory for the system file exists.
  ensure_directory_exists(parent_of(date_file_path))

  // 4. Write the current date to the file.
  write_file(date_file_path, current_date)

  // 5. Output a confirmation message for traceability.
  print("✅ System date initialized to: " + current_date)
}
```

### 2. Date and Time Retrieval Functions

**Principle:** All other rules and processes MUST use these functions to get date and time information, instead of calling system functions directly. This maintains consistency.

```
// Pseudocode for the AI assistant.

// Function to get only the date (YYYY-MM-DD).
function get_current_date() {
  // This function should read the date stored by initialize_system_date().
  date_file_path = get_task_artifact_path("current_date_file")
  return read_file(date_file_path)
}

// Function to get the full, real-time datetime string.
// This can be a direct system call as it represents the "current moment"
// for logging or timestamping, distinct from the session's "start date".
function get_current_datetime() {
  return system.getCurrentDateTime("YYYY-MM-DD HH:mm:ss")
}
```

## ✅ Integration Protocol

- All instructional mode files (e.g., `custom_modes/*.md`) must begin their execution flow by calling `initialize_system_date()`.
- All rules requiring date information must call `get_current_date()` to ensure they are using the session-consistent date.
- For real-time timestamps (e.g., in logs), `get_current_datetime()` should be used.
```

Если вы согласны с этим планом и примером рефакторинга, мы можем начать с **Фазы 1: Перевод и унификация имен файлов**. Я начну с подготовки списка файлов для переименования и перевода.