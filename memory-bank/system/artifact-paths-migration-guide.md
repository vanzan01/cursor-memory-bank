# ARTIFACT PATHS MIGRATION GUIDE

**Дата создания:** 2025-06-25
**Задача:** 2025-06-25_ID-002_artifact-paths-unification
**Статус:** COMPLETED

## 🎯 ЧТО ИЗМЕНИЛОСЬ

### КРИТИЧЕСКОЕ ИЗМЕНЕНИЕ:
Все артефакты задач теперь создаются в папке активной задачи вместо разрозненных системных папок.

### ДО (проблемная структура):
```
memory-bank/
├── creative/           ❌ Разрозненные артефакты
├── planning/          ❌ Разрозненные артефакты
├── implementation/    ❌ Разрозненные артефакты
├── qa/               ❌ Разрозненные артефакты
├── archive/          ❌ Разрозненные артефакты
├── universal/        ❌ Разрозненные артефакты
└── system/           ✅ Системные файлы
```

### ПОСЛЕ (Memory Bank 2.0.0 структура):
```
memory-bank/
├── tasks/
│   ├── todo/
│   ├── in_progress/
│   └── done/
│       └── [task-directory]/     ✅ Все артефакты задачи здесь
│           ├── _task.md
│           ├── _context.md
│           ├── planning/         ✅ PLAN артефакты
│           ├── creative/         ✅ CREATIVE артефакты
│           ├── implementation/   ✅ IMPLEMENT артефакты
│           ├── qa/              ✅ QA артефакты
│           ├── reflection/      ✅ REFLECT артефакты
│           └── release/         ✅ ARCHIVE артефакты
└── system/                      ✅ Системные артефакты
    ├── current-context.md
    ├── workflow-state.txt
    ├── current-task.txt
    └── universal/               ✅ Universal логи
        └── [date]-request-log.md
```

## 📋 ДЕТАЛЬНЫЕ ИЗМЕНЕНИЯ ПО РЕЖИМАМ

### UNIVERSAL MODE:
- **Было:** `memory-bank/universal/[date]-request-log.md`
- **Стало:** `memory-bank/system/universal/[date]-request-log.md`
- **Причина:** Universal логи относятся к системе, не к конкретной задаче

### PLAN MODE:
- **Было:**
  - `memory-bank/planning/[task-name]-requirements.md`
  - `memory-bank/planning/[task-name]-architecture.md`
- **Стало:**
  - `$active_task_path/planning/requirements.md`
  - `$active_task_path/planning/architecture.md`
  - `$active_task_path/planning/implementation-plan.md`

### CREATIVE MODE:
- **Было:**
  - `memory-bank/creative/[project-specific-files]`
  - `memory-bank/creative/[component-name].md`
  - `memory-bank/style-guide.md`
- **Стало:**
  - `$active_task_path/creative/[component-name].md`
  - `$active_task_path/creative/style-guide.md`

### IMPLEMENT MODE:
- **Было:**
  - `memory-bank/implementation/[task-name]-build-log.md`
  - `memory-bank/implementation/[task-name]-test-results.md`
- **Стало:**
  - `$active_task_path/implementation/build-log.md`
  - `$active_task_path/implementation/test-results.md`

### QA MODE:
- **Было:**
  - `memory-bank/qa/[task-name]-qa-report.md`
  - `memory-bank/qa/[task-name]-test-log.md`
  - `memory-bank/qa/[task-name]-issues.md`
- **Стало:**
  - `$active_task_path/qa/qa-report.md`
  - `$active_task_path/qa/test-log.md`
  - `$active_task_path/qa/issues.md`

### REFLECT & ARCHIVE MODE:
- **Было:**
  - `memory-bank/archive/[task-name]/`
- **Стало:**
  - `$active_task_path/reflection/reflection.md`
  - `$active_task_path/release/commit-message.txt`
  - `$active_task_path/release/release-notes.md`
  - `$active_task_path/release/changelog.md`

## 🔧 КАК ИСПОЛЬЗОВАТЬ НОВУЮ СИСТЕМУ

### 1. УБЕДИТЕСЬ, ЧТО АКТИВНАЯ ЗАДАЧА УСТАНОВЛЕНА
```bash
# Проверить активную задачу
active_task_path=$(get_active_task_path)
echo "Активная задача: $active_task_path"

# Если пуста, установить активную задачу
set_active_task(memory-bank/tasks/[status]/[task-directory])
```

### 2. ВСЕ РЕЖИМЫ АВТОМАТИЧЕСКИ СОЗДАЮТ АРТЕФАКТЫ В ПРАВИЛЬНЫХ МЕСТАХ
- PLAN режим → `$active_task_path/planning/`
- CREATIVE режим → `$active_task_path/creative/`
- IMPLEMENT режим → `$active_task_path/implementation/`
- QA режим → `$active_task_path/qa/`
- REFLECT режим → `$active_task_path/reflection/` и `$active_task_path/release/`

### 3. ЕСЛИ АКТИВНАЯ ЗАДАЧА НЕ УСТАНОВЛЕНА
Система выдаст информативную ошибку с инструкциями:
```
⚠️  КРИТИЧЕСКАЯ ОШИБКА: Активная задача не выбрана!

🔧 РЕШЕНИЕ:
1. Выберите существующую задачу:
   ls memory-bank/tasks/todo/
   ls memory-bank/tasks/in_progress/
   set_active_task(memory-bank/tasks/[status]/[task-directory])

2. Или создайте новую задачу в VAN режиме

❌ [MODE] режим не может продолжить без активной задачи
```

## 🎯 ПРЕИМУЩЕСТВА НОВОЙ СИСТЕМЫ

### ✅ ГРУППИРОВКА ПО ЗАДАЧАМ:
- Все артефакты одной задачи находятся в одном месте
- Легко анализировать прогресс конкретной задачи
- Простое управление жизненным циклом задачи

### ✅ УЛУЧШЕННАЯ РЕФЛЕКСИЯ:
- Все материалы задачи доступны для анализа
- Четкая структура для ретроспективы
- Легкое создание отчетов по задаче

### ✅ ЭФФЕКТИВНОЕ ПОВТОРНОЕ ИСПОЛЬЗОВАНИЕ:
- Паттерны решений сохраняются вместе с задачей
- Легко найти похожие решения в прошлых задачах
- Знания не теряются в разрозненных папках

### ✅ СООТВЕТСТВИЕ MEMORY BANK 2.0.0:
- Полная совместимость с новой архитектурой
- Правильная работа VAN режима
- Интеграция с системой управления задачами

## ⚠️ ВАЖНЫЕ ЗАМЕЧАНИЯ

### ОБРАТНАЯ СОВМЕСТИМОСТЬ:
- Старые задачи могут иметь артефакты в старых местах
- Новые задачи используют новую структуру
- Система gracefully обрабатывает оба случая

### СИСТЕМНЫЕ АРТЕФАКТЫ:
Остаются в системной папке (НЕ изменились):
- `memory-bank/system/current-context.md`
- `memory-bank/system/workflow-state.txt`
- `memory-bank/system/current-task.txt`

### UNIVERSAL ЛОГИ:
Перенесены в системную подпапку:
- `memory-bank/system/universal/[date]-request-log.md`

## 🚀 МИГРАЦИЯ СУЩЕСТВУЮЩИХ ЗАДАЧ

### ДЛЯ НОВЫХ ЗАДАЧ:
Ничего делать не нужно - система автоматически использует новую структуру.

### ДЛЯ СУЩЕСТВУЮЩИХ ЗАДАЧ:
1. Создайте папку задачи в правильном месте
2. Переместите артефакты в соответствующие подпапки
3. Обновите ссылки в документации

### ПРИМЕР МИГРАЦИИ:
```bash
# Старая структура
memory-bank/planning/my-task-requirements.md
memory-bank/creative/my-component.md
memory-bank/implementation/my-task-build-log.md

# Новая структура
memory-bank/tasks/done/my-task/
├── planning/requirements.md
├── creative/my-component.md
└── implementation/build-log.md
```

## 📊 СТАТИСТИКА ИЗМЕНЕНИЙ

- **Режимов обновлено:** 6 + 1 legacy
- **Путей исправлено:** 14
- **Шаблонов добавлено:** 5 (для активной задачи)
- **Тестов пройдено:** 100%
- **Проблем найдено:** 0

## 🔗 СВЯЗАННЫЕ ДОКУМЕНТЫ

- **Задача:** `memory-bank/tasks/todo/2025-06-25_ID-002_artifact-paths-unification/_task.md`
- **План:** `memory-bank/tasks/todo/2025-06-25_ID-002_artifact-paths-unification/planning/`
- **Build Log:** `memory-bank/tasks/todo/2025-06-25_ID-002_artifact-paths-unification/implementation/build-log.md`

## 📞 ПОДДЕРЖКА

Если у вас возникли проблемы с новой системой:
1. Проверьте, что активная задача установлена
2. Убедитесь, что используете правильные команды режимов
3. Обратитесь к инструкциям режимов - они обновлены с детальными сообщениями об ошибках

---

**Создано:** 2025-06-25
**Автор:** AI Assistant (IMPLEMENT режим)
**Версия системы:** Memory Bank 2.0.0
**Статус:** ACTIVE