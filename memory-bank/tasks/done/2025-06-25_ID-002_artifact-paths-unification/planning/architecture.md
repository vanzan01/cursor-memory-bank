# АРХИТЕКТУРА: УНИФИКАЦИЯ ПУТЕЙ АРТЕФАКТОВ

**Задача:** 2025-06-25_ID-002_artifact-paths-unification
**Дата создания:** 2025-06-25
**Режим:** PLAN
**Сложность:** Level 3

## 🏗️ АРХИТЕКТУРНЫЙ ОБЗОР

### ТЕКУЩАЯ АРХИТЕКТУРА (ПРОБЛЕМНАЯ):
```
memory-bank/
├── creative/           ❌ Разрозненные артефакты
├── planning/          ❌ Разрозненные артефакты
├── implementation/    ❌ Разрозненные артефакты
├── qa/               ❌ Разрозненные артефакты
├── archive/          ❌ Разрозненные артефакты
├── universal/        ❌ Разрозненные артефакты
└── system/           ✅ Системные файлы (правильно)
```

### ЦЕЛЕВАЯ АРХИТЕКТУРА (Memory Bank 2.0.0):
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
```

## 🔧 АРХИТЕКТУРНЫЕ КОМПОНЕНТЫ

### 1. ACTIVE TASK PATH RESOLVER
**Описание:** Компонент для получения пути активной задачи
**Функция:** `get_active_task_path()`
**Статус:** ✅ Существует (в Core/active-task-manager.mdc)

```bash
# Пример использования:
active_task_path=$(get_active_task_path)
# Возвращает: memory-bank/tasks/[status]/[task-directory]
```

### 2. ARTIFACT PATH BUILDER
**Описание:** Построение путей для артефактов на основе активной задачи
**Паттерн:** `$active_task_path/[subfolder]/[artifact-name]`

```bash
# Примеры построения путей:
planning_requirements="$active_task_path/planning/requirements.md"
creative_component="$active_task_path/creative/component-name.md"
qa_report="$active_task_path/qa/qa-report.md"
```

### 3. FALLBACK MECHANISM
**Описание:** Обработка случаев, когда активная задача не определена
**Логика:**
1. Проверить `get_active_task_path()`
2. Если пуст → использовать legacy `tasks.md`
3. Если ошибка → сообщить пользователю

### 4. MODE INSTRUCTION UPDATER
**Описание:** Обновление всех инструкций режимов для использования новых путей
**Компоненты:**
- Path replacement logic
- Variable substitution
- Validation checks

## 📋 ДЕТАЛЬНЫЙ ПЛАН ЗАМЕН

### MAPPING СТАРЫХ ПУТЕЙ НА НОВЫЕ:

#### CREATIVE MODE:
```bash
# СТАРЫЕ ПУТИ:
memory-bank/creative/[project-specific-files]
memory-bank/creative/[component-name].md
memory-bank/style-guide.md

# НОВЫЕ ПУТИ:
$active_task_path/creative/[component-name].md
$active_task_path/creative/style-guide.md
```

#### PLAN MODE:
```bash
# СТАРЫЕ ПУТИ:
memory-bank/planning/[task-name]-requirements.md
memory-bank/planning/[task-name]-architecture.md

# НОВЫЕ ПУТИ:
$active_task_path/planning/requirements.md
$active_task_path/planning/architecture.md
$active_task_path/planning/implementation-plan.md
```

#### IMPLEMENT MODE:
```bash
# СТАРЫЕ ПУТИ:
memory-bank/implementation/[task-name]-build-log.md
memory-bank/implementation/[task-name]-test-results.md

# НОВЫЕ ПУТИ:
$active_task_path/implementation/build-log.md
$active_task_path/implementation/test-results.md
```

#### QA MODE:
```bash
# СТАРЫЕ ПУТИ:
memory-bank/qa/[task-name]-qa-report.md
memory-bank/qa/[task-name]-test-log.md
memory-bank/qa/[task-name]-issues.md

# НОВЫЕ ПУТИ:
$active_task_path/qa/qa-report.md
$active_task_path/qa/test-log.md
$active_task_path/qa/issues.md
```

#### REFLECT & ARCHIVE MODE:
```bash
# СТАРЫЕ ПУТИ:
memory-bank/archive/[task-name]/

# НОВЫЕ ПУТИ:
$active_task_path/reflection/reflection.md
$active_task_path/release/commit-message.txt
$active_task_path/release/release-notes.md
$active_task_path/release/changelog.md
```

#### UNIVERSAL MODE:
```bash
# СТАРЫЕ ПУТИ:
memory-bank/universal/[date]-request-log.md

# НОВЫЕ ПУТИ:
memory-bank/system/universal/[date]-request-log.md
```

## 🔄 АЛГОРИТМ ОБНОВЛЕНИЯ

### Phase 1: Подготовка
1. **Backup текущих инструкций**
2. **Анализ всех путей** (уже выполнено)
3. **Создание mapping таблицы** (выполнено выше)

### Phase 2: Обновление инструкций
```bash
# Для каждого режима:
for mode in creative plan implement qa reflect_archive universal; do
    echo "Updating ${mode}_instructions.md..."

    # 1. Заменить старые пути на новые
    # 2. Добавить проверку активной задачи
    # 3. Добавить fallback логику
    # 4. Обновить mandatory artifacts
done
```

### Phase 3: Валидация
```bash
# Проверить все замены:
grep -r "memory-bank/creative/" custom_modes/     # Должно быть 0 результатов
grep -r "memory-bank/planning/" custom_modes/    # Должно быть 0 результатов
grep -r "memory-bank/implementation/" custom_modes/ # Должно быть 0 результатов
grep -r "memory-bank/qa/" custom_modes/          # Должно быть 0 результатов
grep -r "memory-bank/archive/" custom_modes/     # Должно быть 0 результатов

# Проверить использование переменных:
grep -r "\$active_task_path" custom_modes/       # Должно быть много результатов
```

## 🛠️ ТЕХНИЧЕСКИЕ ДЕТАЛИ

### TEMPLATE ДЛЯ ОБНОВЛЕНИЯ РЕЖИМОВ:

```bash
# В начале каждого режима добавить:
echo "=== ПОЛУЧЕНИЕ АКТИВНОЙ ЗАДАЧИ ==="
active_task_path=$(get_active_task_path)

if [ -z "$active_task_path" ]; then
    echo "⚠️  No active task selected. Using legacy mode."
    echo "Please set active task with: set_active_task(path)"
    # Fallback logic here
    exit 1
fi

echo "✅ Active task: $active_task_path"

# Создание папок:
mkdir -p "$active_task_path/[mode-folder]"

# Создание артефактов:
artifact_path="$active_task_path/[mode-folder]/[artifact-name]"
```

### VALIDATION CHECKS:
```bash
# В каждом режиме добавить проверки:
validate_active_task() {
    if [ ! -d "$active_task_path" ]; then
        echo "❌ Active task directory not found: $active_task_path"
        return 1
    fi

    if [ ! -f "$active_task_path/_task.md" ]; then
        echo "❌ Task file not found: $active_task_path/_task.md"
        return 1
    fi

    echo "✅ Active task validated: $active_task_path"
    return 0
}
```

## 🔒 БЕЗОПАСНОСТЬ И НАДЕЖНОСТЬ

### ERROR HANDLING:
1. **Проверка существования активной задачи**
2. **Graceful fallback на legacy режим**
3. **Валидация путей перед созданием файлов**
4. **Информативные сообщения об ошибках**

### BACKWARD COMPATIBILITY:
1. **Поддержка legacy `tasks.md`**
2. **Автоматическое обнаружение старой структуры**
3. **Migration подсказки для пользователей**

### TESTING STRATEGY:
1. **Unit tests для каждого режима**
2. **Integration tests для полного workflow**
3. **Edge case testing (нет активной задачи)**
4. **Performance regression testing**

## 📊 МЕТРИКИ УСПЕХА

### КОЛИЧЕСТВЕННЫЕ МЕТРИКИ:
- [ ] **0** старых путей в инструкциях режимов
- [ ] **6** обновленных режимов
- [ ] **100%** использование `$active_task_path`
- [ ] **0** ошибок при создании артефактов

### КАЧЕСТВЕННЫЕ МЕТРИКИ:
- [ ] Все артефакты создаются в правильных местах
- [ ] Система gracefully обрабатывает отсутствие активной задачи
- [ ] Обратная совместимость работает
- [ ] Документация обновлена и понятна

## 🚀 ПЛАН РАЗВЕРТЫВАНИЯ

### ПОРЯДОК ОБНОВЛЕНИЯ:
1. **UNIVERSAL** - самый простой (только логи)
2. **PLAN** - средний (requirements + architecture)
3. **CREATIVE** - средний (компоненты + стили)
4. **IMPLEMENT** - средний (логи + результаты)
5. **QA** - сложный (отчеты + логи + проблемы)
6. **REFLECT & ARCHIVE** - сложный (рефлексия + релиз)

### ROLLBACK PLAN:
1. Backup всех оригинальных файлов
2. Git commit после каждого режима
3. Возможность отката к предыдущему состоянию
4. Восстановление из backup при критических ошибках

---

**Создано:** 2025-06-25 в PLAN режиме
**Статус:** ARCHITECTURE COMPLETE → READY FOR IMPLEMENTATION PLAN