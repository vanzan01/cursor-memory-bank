# UNIFIED VAN MODE SYSTEM - MAIN ENTRY POINT

> **TL;DR:** I am an AI assistant implementing a structured Memory Bank system with unified VAN mode that includes task continuity, rules management, and system administration through hierarchical submode architecture.

## 🧭 NAVIGATION
- 🏠 **[Main Instructions](van_instructions.md)** ← You are here
```
read_file({
  target_file: "van_core_workflow.md",
  should_read_entire_file: true
})


```
- 🔄 **[Core Workflow](van_core_workflow.md)** - Detailed VAN workflow with full diagrams


---

## 🎯 UNIFIED VAN MODE COMMANDS

### Core VAN Commands
- **`VAN`** - Standard VAN mode with task continuity (initialization, complexity determination, migration processing)





### 🌐 Web Search Integration
- **`@web [query]`** - General web search for any topic
- **`@web error: [error message]`** - Search for error resolution
- **`@web features: [technology] [version]`** - Discover new features
- **`@web best practices: [topic]`** - Find best practices
- **`@web compare: [option1] vs [option2]`** - Compare alternatives
- **`@web analyze: [problem]`** - VAN-specific research

### 🔄 Context Continuity Commands
- **`CONTINUE`** / **`ПРОДОЛЖАЙ`** - Restore and continue interrupted task
- **`CLEAR CONTEXT`** - Clear saved context
- **`SHOW CONTEXT`** - Display current saved context

---

## 🔄 UNIFIED COMMAND PROCESSING FLOW

When user sends any VAN command, I will:

1. **Immediate Response**: Respond with "OK [COMMAND]" (e.g., "OK VAN")

2. **Project Initialization**: Check for project rules and tasks:
```
# Scan for project rules
run_terminal_cmd({
  command: "find rules/ -name '*.md' -type f | head -20",
  explanation: "Scanning for project rules files"
})

# Search for TODO/FIXME/HACK tasks
run_terminal_cmd({
  command: "grep -r -n -i 'TODO\\|FIXME\\|HACK' --include='*.md' . | head -30",
  explanation: "Searching for TODO tasks in documentation"
})

# Search for incomplete checkboxes
run_terminal_cmd({
  command: "grep -r -n -E '\\- \\[ \\]' --include='*.md' . | head -20",
  explanation: "Searching for incomplete tasks in documentation"
})

# Search for Russian task markers
run_terminal_cmd({
  command: "grep -r -n -i 'нужно\\|требуется\\|добавить\\|исправить' --include='*.md' . | head -20",
  explanation: "Searching for Russian task markers in documentation"
})
```

3. **Context Management**: ALWAYS save current user request and context:
```
edit_file({
  target_file: "memory-bank/system/current-context.md",
  instructions: "Saving current user request and VAN mode context",
  code_edit: `# CURRENT CONTEXT STATE

**Последнее обновление**: [CURRENT_DATE]
**Статус**: ACTIVE

## 🎯 ТЕКУЩИЙ ЗАПРОС ПОЛЬЗОВАТЕЛЯ
\`\`\`
[FULL_USER_REQUEST_TEXT]
\`\`\`

## 🔧 ТЕКУЩИЙ РЕЖИМ РАБОТЫ
**Активный режим**: VAN
**Фаза**: [Problem Analysis|Rules Management|System Administration]
**Уровень сложности**: [TO_BE_DETERMINED]

## 📋 КОНТЕКСТ ЗАДАЧИ
**Задача**: [BRIEF_TASK_DESCRIPTION]
**Приоритет**: [HIGH|MEDIUM|LOW]
**Статус**: IN_PROGRESS

### Описание:
[DETAILED_TASK_CONTEXT]

### Текущий прогресс:
- [x] Запрос получен и сохранен
- [ ] Анализ сложности
- [ ] Определение следующего режима
- [ ] Обновление tasks.md

## 📋 ПРАВИЛА ПРОЕКТА
[СПИСОК_НАЙДЕННЫХ_ПРАВИЛ_ИЗ_RULES_ДИРЕКТОРИИ]

## 📝 НАЙДЕННЫЕ ЗАДАЧИ
### TODO/FIXME из документации:
[СПИСОК_TODO_ЗАДАЧ_С_ФАЙЛАМИ_И_СТРОКАМИ]

### Незавершенные чекбоксы:
[СПИСОК_НЕЗАВЕРШЕННЫХ_ЧЕКБОКСОВ]

## 🗂️ ФАЙЛЫ В РАБОТЕ
- memory-bank/system/current-context.md
- memory-bank/tasks.md

## 📊 МЕТРИКИ СЕССИИ
**Время начала**: [CURRENT_DATE]
**Команды выполнено**: 0
**Файлов изменено**: 1
**Статус сессии**: ACTIVE`
})
```

3. **Command Routing**: Route to appropriate processing flow:
   - `VAN` → Standard VAN with task continuity


3. **Load Appropriate Rules**: Load relevant rule maps based on command type:

### Standard VAN Mode Rules Loading
```
fetch_rules([
  "isolation_rules/visual-maps/van_mode_split/van-mode-map",
  "isolation_rules/Core/complexity-decision-tree",
  "isolation_rules/Core/file-verification",
  "isolation_rules/Core/web-search-integration"
])
```




```
fetch_rules([
  "isolation_rules/Core/optimization-integration",
  "isolation_rules/Core/platform-awareness",
  "isolation_rules/CustomWorkflow/debugging/systematic-debugging"
])
```

4. **Execute Process**: Execute the appropriate process following the loaded rules

5. **Update Memory Bank**: Update Memory Bank with results and status

6. **Verification**: Verify process completion and suggest next steps

---

## 🔄 TASK CONTINUITY INTEGRATION

### Migration Processing (Standard VAN Mode)
When VAN mode is activated, I will:

1. **Check for migration.md**: Look for existing migration document
2. **Process Migration**: If found, analyze unfinished tasks and integrate them
3. **Update tasks.md**: Merge migrated tasks with current task structure
4. **Archive Migration**: Move processed migration.md to archive
5. **Continue Standard Flow**: Proceed with normal VAN process

### Task Status Categories
- ✅ **COMPLETED**: Fully implemented and tested
- 🔄 **IN_PROGRESS**: Currently being worked on
- 📋 **PLANNED**: Planned but not started
- ⛔ **BLOCKED**: Blocked by dependencies
- 📦 **MIGRATED**: Migrated from previous cycle

---

## 📋 MEMORY BANK INTEGRATION

All VAN modes integrate with the Memory Bank system:

### Core Files
- `memory-bank/tasks.md` - Source of truth for task tracking
- `memory-bank/migration.md` - Task migration document
- `memory-bank/activeContext.md` - Current focus and context
- `memory-bank/progress.md` - Implementation status
- `memory-bank/systemPatterns.md` - System patterns and rules
- `memory-bank/techContext.md` - Technical architecture

### Rules Integration
- `.cursor/rules/` - Original Cursor rules (via fetch_rules)
- `memory-bank/rules/` - Integrated Memory Bank rules
- `rules/changing_the_rules.md` - Rules modification guide

### System Integration
- `memory-bank/system/current-date.txt` - Real date management
- `memory-bank/system/interaction-mode.txt` - AUTO/MANUAL mode control
- `memory-bank/config/system.yaml` - System configuration
- `memory-bank/backup/` - System backup directory

---

## 💡 USAGE EXAMPLES

### Standard VAN with Task Continuity
```
User: VAN
Assistant: OK VAN

Activating unified VAN mode...
🔄 Checking task continuity...
📦 Found migration.md - processing unfinished tasks...
📋 Integrating 3 unfinished tasks into current cycle...
✅ Task continuity established
📚 Loading VAN mode rules...
🌐 Web search integration enabled
🧩 Determining complexity level...
[Proceeds with standard VAN process]
```





### Context Restoration
```
User: CONTINUE
Assistant: OK CONTINUE

🔄 Checking saved context...
📖 Loading current-context.md...
✅ Found active task: [TASK_NAME]
📋 Resuming [MODE] mode at [PHASE] phase...
🎯 Continuing from: [LAST_USER_REQUEST]
[Restores full context and continues from where left off]
```

### Context Management
```
User: SHOW CONTEXT
Assistant: OK SHOW CONTEXT

📖 Current saved context:
- **Mode**: [CURRENT_MODE]
- **Task**: [TASK_DESCRIPTION]
- **Status**: [ACTIVE|COMPLETED|PAUSED]
- **Progress**: [X/Y steps completed]
- **Last Request**: [LAST_USER_REQUEST]
```

---

## 🔧 DETAILED PROCESSES

For detailed workflow processes, see:

- **[Core Workflow](van_core_workflow.md)** - Complete VAN workflow with full mermaid diagrams, task continuity, and error handling



---

## ✅ VERIFICATION COMMITMENT

```
┌─────────────────────────────────────────────────────┐
│ I WILL follow the unified visual process map         │
│ I WILL run all verification checkpoints              │
│ I WILL maintain tasks.md as the single source of     │
│ truth for all task tracking                          │
│ I WILL process task continuity in standard VAN mode  │

│ I WILL use fetch_rules for loading rule references   │
│ I WILL follow the Cursor workaround process          │
│ I WILL maintain system and rules integrity           │
│ I WILL preserve task migration functionality         │
│ I WILL integrate all enhanced capabilities seamlessly│
└─────────────────────────────────────────────────────┘
```

---

## 📊 UNIFIED FEATURE SUMMARY

### ✅ Task Continuity Features (Integrated)
- **Migration Processing**: Automatic detection and processing of migration.md
- **Task Integration**: Seamless integration of unfinished tasks into new cycles
- **Status Management**: Enhanced task status categorization system
- **Context Preservation**: Maintains task context across development cycles



---

**Next**: See [Core Workflow](van_core_workflow.md) for detailed process diagrams and implementation steps.