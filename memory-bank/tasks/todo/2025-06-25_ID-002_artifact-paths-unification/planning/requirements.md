# ТРЕБОВАНИЯ: УНИФИКАЦИЯ ПУТЕЙ АРТЕФАКТОВ

**Задача:** 2025-06-25_ID-002_artifact-paths-unification
**Дата создания:** 2025-06-25
**Режим:** PLAN
**Сложность:** Level 3

## 🎯 АНАЛИЗ ТЕКУЩИХ ПРОБЛЕМ

### 📊 НАЙДЕННЫЕ ПРОБЛЕМНЫЕ ПУТИ:

#### 1. CREATIVE INSTRUCTIONS (2 файла)
- ❌ `memory-bank/creative/[project-specific-files]`
- ❌ `memory-bank/creative/[component-name].md`
- ❌ `memory-bank/style-guide.md`

#### 2. PLAN INSTRUCTIONS
- ❌ `memory-bank/planning/[task-name]-requirements.md`
- ❌ `memory-bank/planning/[task-name]-architecture.md`

#### 3. IMPLEMENT INSTRUCTIONS
- ❌ `memory-bank/implementation/[task-name]-build-log.md`
- ❌ `memory-bank/implementation/[task-name]-test-results.md`

#### 4. QA INSTRUCTIONS
- ❌ `memory-bank/qa/[task-name]-qa-report.md`
- ❌ `memory-bank/qa/[task-name]-test-log.md`
- ❌ `memory-bank/qa/[task-name]-issues.md`

#### 5. REFLECT & ARCHIVE INSTRUCTIONS
- ❌ `memory-bank/archive/[task-name]/`

#### 6. UNIVERSAL INSTRUCTIONS
- ❌ `memory-bank/universal/[date]-request-log.md`

#### 7. DESIGN INSTRUCTIONS (legacy)
- ❌ `memory-bank/creative/[project-specific-files]`

## 🎯 ФУНКЦИОНАЛЬНЫЕ ТРЕБОВАНИЯ

### FR-001: Унификация путей задачных артефактов
**Приоритет:** HIGH
**Описание:** Все артефакты, связанные с конкретной задачей, ДОЛЖНЫ создаваться в папке этой задачи.

**Правило:** `$active_task_path/[subfolder]/[artifact]`

### FR-002: Системные артефакты остаются системными
**Приоритет:** HIGH
**Описание:** Системные артефакты ДОЛЖНЫ оставаться в системной папке.

**Системные артефакты:**
- `memory-bank/system/current-context.md`
- `memory-bank/system/workflow-state.txt`
- `memory-bank/system/current-task.txt`

### FR-003: Universal логи в системной папке
**Приоритет:** MEDIUM
**Описание:** Universal режим создает логи в системной папке, но в подпапке universal.

**Правило:** `memory-bank/system/universal/[date]-request-log.md`

### FR-004: Использование активной задачи
**Приоритет:** HIGH
**Описание:** Все режимы ДОЛЖНЫ получать путь активной задачи через `get_active_task_path()`.

### FR-005: Graceful fallback
**Приоритет:** MEDIUM
**Описание:** Если активная задача не определена, система ДОЛЖНА работать с legacy `tasks.md`.

## 🔧 ТЕХНИЧЕСКИЕ ТРЕБОВАНИЯ

### TR-001: Структура папок задачи
**Описание:** Каждая задача ДОЛЖНА иметь стандартную структуру папок.

```
$active_task_path/
├── _task.md                    # основная информация (существует)
├── _context.md                 # контекст и состояние (существует)
├── planning/                   # PLAN MODE артефакты
│   ├── requirements.md         # детальные требования
│   ├── architecture.md         # архитектурные решения
│   └── implementation-plan.md  # план реализации
├── creative/                   # CREATIVE MODE артефакты
│   ├── [component-name].md     # творческие решения
│   └── style-guide.md          # руководство по стилю
├── implementation/             # IMPLEMENT MODE артефакты
│   ├── build-log.md           # логи сборки
│   └── test-results.md        # результаты тестов
├── qa/                        # QA MODE артефакты
│   ├── qa-report.md           # отчет QA
│   ├── test-log.md            # логи тестирования
│   └── issues.md              # найденные проблемы
├── reflection/                # REFLECT MODE артефакты
│   └── reflection.md          # рефлексия проекта
└── release/                   # ARCHIVE MODE артефакты
    ├── commit-message.txt     # сообщение коммита
    ├── release-notes.md       # заметки к релизу
    └── changelog.md           # список изменений
```

### TR-002: Обновление инструкций режимов
**Описание:** Все 6 режимов ДОЛЖНЫ быть обновлены для использования новых путей.

**Список режимов:**
1. `custom_modes/creative_instructions.md`
2. `custom_modes/plan_instructions.md`
3. `custom_modes/implement_instructions.md`
4. `custom_modes/qa_instructions.md`
5. `custom_modes/reflect_archive_instructions.md`
6. `custom_modes/universal_instructions.md`

### TR-003: Использование переменных
**Описание:** Инструкции ДОЛЖНЫ использовать переменную `$active_task_path` вместо хардкода.

**Примеры замен:**
- `memory-bank/creative/` → `$active_task_path/creative/`
- `memory-bank/planning/` → `$active_task_path/planning/`
- `memory-bank/implementation/` → `$active_task_path/implementation/`

### TR-004: Обратная совместимость
**Описание:** Система ДОЛЖНА поддерживать legacy режим для старых задач.

## 🔒 НЕФУНКЦИОНАЛЬНЫЕ ТРЕБОВАНИЯ

### NFR-001: Производительность
**Описание:** Изменения НЕ ДОЛЖНЫ влиять на производительность системы.

### NFR-002: Надежность
**Описание:** Система ДОЛЖНА gracefully обрабатывать отсутствие активной задачи.

### NFR-003: Maintainability
**Описание:** Код ДОЛЖЕН быть легко поддерживаемым и понятным.

### NFR-004: Совместимость
**Описание:** Изменения ДОЛЖНЫ быть совместимы с существующими задачами.

## ⚠️ ОГРАНИЧЕНИЯ И РИСКИ

### ОГРАНИЧЕНИЯ:
1. **Активная задача:** Все режимы зависят от корректной работы `get_active_task_path()`
2. **VAN зависимость:** Система зависит от инициализации Memory Bank 2.0.0 в VAN режиме
3. **Legacy поддержка:** Нужно поддерживать старый формат `tasks.md`

### РИСКИ:
1. **Высокий:** Поломка существующих процессов
2. **Средний:** Проблемы с получением активной задачи
3. **Низкий:** Проблемы совместимости с legacy задачами

## 🎯 КРИТЕРИИ ПРИЕМКИ

### AC-001: Все режимы используют активную задачу
- [ ] CREATIVE режим создает артефакты в `$active_task_path/creative/`
- [ ] PLAN режим создает артефакты в `$active_task_path/planning/`
- [ ] IMPLEMENT режим создает артефакты в `$active_task_path/implementation/`
- [ ] QA режим создает артефакты в `$active_task_path/qa/`
- [ ] REFLECT режим создает артефакты в `$active_task_path/reflection/`
- [ ] ARCHIVE режим создает артефакты в `$active_task_path/release/`

### AC-002: Системные артефакты остаются системными
- [ ] `memory-bank/system/current-context.md` остается в системной папке
- [ ] `memory-bank/system/workflow-state.txt` остается в системной папке
- [ ] `memory-bank/system/current-task.txt` остается в системной папке

### AC-003: Universal логи в правильном месте
- [ ] Universal режим создает логи в `memory-bank/system/universal/`

### AC-004: Graceful fallback работает
- [ ] Система работает без активной задачи (использует legacy режим)
- [ ] Корректные сообщения об ошибках при проблемах с активной задачей

### AC-005: Документация обновлена
- [ ] Все инструкции режимов обновлены
- [ ] Создано руководство по новой структуре
- [ ] Документирован migration guide

## 📋 ЗАВИСИМОСТИ

### ВНЕШНИЕ ЗАВИСИМОСТИ:
1. **VAN режим** - инициализация Memory Bank 2.0.0
2. **Active Task Manager** - функции `get_active_task_path()` и `set_active_task()`

### ВНУТРЕННИЕ ЗАВИСИМОСТИ:
1. **Все режимы** - должны быть обновлены одновременно
2. **Тестирование** - требует активной задачи для проверки

---

**Создано:** 2025-06-25 в PLAN режиме
**Статус:** DRAFT → READY FOR ARCHITECTURE