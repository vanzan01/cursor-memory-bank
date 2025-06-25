# ПЛАН РЕАЛИЗАЦИИ: УНИФИКАЦИЯ ПУТЕЙ АРТЕФАКТОВ

**Задача:** 2025-06-25_ID-002_artifact-paths-unification
**Дата создания:** 2025-06-25
**Режим:** PLAN
**Сложность:** Level 3

## 🎯 EXECUTIVE SUMMARY

**Цель:** Унифицировать все пути создания артефактов в Memory Bank системе для соответствия Memory Bank 2.0.0 структуре.

**Масштаб:** 6 режимов, 15+ файлов артефактов, критическая системная целостность.

**Временные рамки:** 1 сессия IMPLEMENT режима (высокий приоритет).

**Риски:** HIGH - может сломать существующие процессы.

## 📋 ДЕТАЛЬНЫЙ ПЛАН РЕАЛИЗАЦИИ

### PHASE 1: ПОДГОТОВКА И BACKUP (15 мин)

#### Step 1.1: Создание backup
```bash
# Создать backup всех инструкций режимов
mkdir -p memory-bank/system/backups/artifact-paths-fix-$(date +%Y%m%d-%H%M)
cp custom_modes/*.md memory-bank/system/backups/artifact-paths-fix-$(date +%Y%m%d-%H%M)/
echo "✅ Backup created"
```

#### Step 1.2: Git commit baseline
```bash
git add .
git commit -m "BACKUP: Before artifact paths unification

- All mode instructions backed up
- Current state preserved
- Ready for artifact paths unification"
echo "✅ Git baseline created"
```

#### Step 1.3: Валидация текущего состояния
```bash
# Проверить количество проблемных путей
echo "=== CURRENT PROBLEMATIC PATHS ==="
grep -r "memory-bank/creative/" custom_modes/ | wc -l
grep -r "memory-bank/planning/" custom_modes/ | wc -l
grep -r "memory-bank/implementation/" custom_modes/ | wc -l
grep -r "memory-bank/qa/" custom_modes/ | wc -l
grep -r "memory-bank/archive/" custom_modes/ | wc -l
grep -r "memory-bank/universal/" custom_modes/ | wc -l
echo "✅ Current state documented"
```

### PHASE 2: ОБНОВЛЕНИЕ РЕЖИМОВ (45 мин)

**Порядок обновления:** От простого к сложному

#### Step 2.1: UNIVERSAL INSTRUCTIONS (5 мин)
**Файл:** `custom_modes/universal_instructions.md`
**Изменения:**
- ❌ `memory-bank/universal/[date]-request-log.md`
- ✅ `memory-bank/system/universal/[date]-request-log.md`

**Детали:**
```bash
# Заменить строку:
OLD: "memory-bank/universal/[date]-request-log.md"
NEW: "memory-bank/system/universal/[date]-request-log.md"

# Добавить создание папки:
mkdir -p memory-bank/system/universal
```

#### Step 2.2: PLAN INSTRUCTIONS (10 мин)
**Файл:** `custom_modes/plan_instructions.md`
**Изменения:**
- ❌ `memory-bank/planning/[task-name]-requirements.md`
- ❌ `memory-bank/planning/[task-name]-architecture.md`
- ✅ `$active_task_path/planning/requirements.md`
- ✅ `$active_task_path/planning/architecture.md`
- ✅ `$active_task_path/planning/implementation-plan.md`

**Template для добавления:**
```bash
# В начало MANDATORY ARTIFACT CREATION добавить:
echo "=== ПОЛУЧЕНИЕ АКТИВНОЙ ЗАДАЧИ ==="
active_task_path=$(get_active_task_path)

if [ -z "$active_task_path" ]; then
    echo "⚠️  No active task selected. Please set active task first."
    echo "Use: set_active_task(memory-bank/tasks/[status]/[task-directory])"
    exit 1
fi

echo "✅ Active task: $active_task_path"
mkdir -p "$active_task_path/planning"
```

#### Step 2.3: CREATIVE INSTRUCTIONS (10 mин)
**Файл:** `custom_modes/creative_instructions.md`
**Изменения:**
- ❌ `memory-bank/creative/[project-specific-files]`
- ❌ `memory-bank/creative/[component-name].md`
- ❌ `memory-bank/style-guide.md`
- ✅ `$active_task_path/creative/[component-name].md`
- ✅ `$active_task_path/creative/style-guide.md`

#### Step 2.4: IMPLEMENT INSTRUCTIONS (10 мин)
**Файл:** `custom_modes/implement_instructions.md`
**Изменения:**
- ❌ `memory-bank/implementation/[task-name]-build-log.md`
- ❌ `memory-bank/implementation/[task-name]-test-results.md`
- ✅ `$active_task_path/implementation/build-log.md`
- ✅ `$active_task_path/implementation/test-results.md`

#### Step 2.5: QA INSTRUCTIONS (10 мин)
**Файл:** `custom_modes/qa_instructions.md`
**Изменения:**
- ❌ `memory-bank/qa/[task-name]-qa-report.md`
- ❌ `memory-bank/qa/[task-name]-test-log.md`
- ❌ `memory-bank/qa/[task-name]-issues.md`
- ✅ `$active_task_path/qa/qa-report.md`
- ✅ `$active_task_path/qa/test-log.md`
- ✅ `$active_task_path/qa/issues.md`

#### Step 2.6: REFLECT & ARCHIVE INSTRUCTIONS (10 мин)
**Файл:** `custom_modes/reflect_archive_instructions.md`
**Изменения:**
- ❌ `memory-bank/archive/[task-name]/`
- ✅ `$active_task_path/reflection/reflection.md`
- ✅ `$active_task_path/release/commit-message.txt`
- ✅ `$active_task_path/release/release-notes.md`
- ✅ `$active_task_path/release/changelog.md`

### PHASE 3: ВАЛИДАЦИЯ И ТЕСТИРОВАНИЕ (20 мин)

#### Step 3.1: Автоматическая валидация
```bash
echo "=== VALIDATION CHECKS ==="

# 1. Проверить отсутствие старых путей
echo "Checking for old paths..."
OLD_PATHS_COUNT=0
OLD_PATHS_COUNT=$((OLD_PATHS_COUNT + $(grep -r "memory-bank/creative/" custom_modes/ | wc -l)))
OLD_PATHS_COUNT=$((OLD_PATHS_COUNT + $(grep -r "memory-bank/planning/" custom_modes/ | wc -l)))
OLD_PATHS_COUNT=$((OLD_PATHS_COUNT + $(grep -r "memory-bank/implementation/" custom_modes/ | wc -l)))
OLD_PATHS_COUNT=$((OLD_PATHS_COUNT + $(grep -r "memory-bank/qa/" custom_modes/ | wc -l)))
OLD_PATHS_COUNT=$((OLD_PATHS_COUNT + $(grep -r "memory-bank/archive/" custom_modes/ | wc -l)))

if [ $OLD_PATHS_COUNT -eq 0 ]; then
    echo "✅ No old paths found"
else
    echo "❌ Found $OLD_PATHS_COUNT old paths - NEED TO FIX"
    exit 1
fi

# 2. Проверить использование $active_task_path
ACTIVE_TASK_COUNT=$(grep -r "\$active_task_path" custom_modes/ | wc -l)
if [ $ACTIVE_TASK_COUNT -gt 10 ]; then
    echo "✅ Active task path usage: $ACTIVE_TASK_COUNT occurrences"
else
    echo "❌ Insufficient active task path usage: $ACTIVE_TASK_COUNT"
    exit 1
fi

# 3. Проверить Universal системные пути
UNIVERSAL_SYSTEM_COUNT=$(grep -r "memory-bank/system/universal/" custom_modes/ | wc -l)
if [ $UNIVERSAL_SYSTEM_COUNT -gt 0 ]; then
    echo "✅ Universal system paths found: $UNIVERSAL_SYSTEM_COUNT"
else
    echo "❌ Universal system paths not found"
    exit 1
fi

echo "✅ All validation checks passed"
```

#### Step 3.2: Функциональное тестирование
```bash
echo "=== FUNCTIONAL TESTING ==="

# 1. Тест получения активной задачи
echo "Testing active task resolution..."
active_task_path=$(get_active_task_path)
if [ -n "$active_task_path" ]; then
    echo "✅ Active task resolved: $active_task_path"
else
    echo "⚠️  No active task (expected for this test)"
fi

# 2. Тест создания папок
echo "Testing folder creation..."
test_path="memory-bank/tasks/todo/test-task"
mkdir -p "$test_path/planning"
mkdir -p "$test_path/creative"
mkdir -p "$test_path/implementation"
mkdir -p "$test_path/qa"
mkdir -p "$test_path/reflection"
mkdir -p "$test_path/release"

if [ -d "$test_path/planning" ] && [ -d "$test_path/creative" ]; then
    echo "✅ Folder creation works"
    rm -rf "$test_path"
else
    echo "❌ Folder creation failed"
    exit 1
fi

echo "✅ Functional testing passed"
```

#### Step 3.3: Интеграционное тестирование
```bash
echo "=== INTEGRATION TESTING ==="

# Симуляция каждого режима с текущей активной задачей
if [ -n "$active_task_path" ]; then
    echo "Testing with active task: $active_task_path"

    # Тест создания артефактов
    mkdir -p "$active_task_path/planning"
    echo "Test requirements" > "$active_task_path/planning/test-requirements.md"

    if [ -f "$active_task_path/planning/test-requirements.md" ]; then
        echo "✅ Artifact creation works"
        rm "$active_task_path/planning/test-requirements.md"
    else
        echo "❌ Artifact creation failed"
        exit 1
    fi
else
    echo "⚠️  No active task - skipping integration test"
fi

echo "✅ Integration testing completed"
```

### PHASE 4: ДОКУМЕНТАЦИЯ И ФИНАЛИЗАЦИЯ (10 мин)

#### Step 4.1: Обновление документации
```bash
# Создать migration guide
echo "Creating migration guide..."
cat > memory-bank/system/artifact-paths-migration-guide.md << 'EOF'
# ARTIFACT PATHS MIGRATION GUIDE

## Что изменилось:
- Все артефакты задач теперь создаются в папке активной задачи
- Системные артефакты остаются в memory-bank/system/
- Universal логи перенесены в memory-bank/system/universal/

## Новая структура:
$active_task_path/
├── planning/     # PLAN артефакты
├── creative/     # CREATIVE артефакты
├── implementation/ # IMPLEMENT артефакты
├── qa/          # QA артефакты
├── reflection/  # REFLECT артефакты
└── release/     # ARCHIVE артефакты

## Как использовать:
1. Убедитесь, что активная задача установлена
2. Все режимы автоматически создают артефакты в правильных местах
3. Если активная задача не установлена - система выдаст ошибку с инструкциями
EOF

echo "✅ Migration guide created"
```

#### Step 4.2: Final commit
```bash
git add .
git commit -m "IMPLEMENT: Artifact paths unification complete

✅ ALL 6 MODES UPDATED:
- creative_instructions.md: Uses \$active_task_path/creative/
- plan_instructions.md: Uses \$active_task_path/planning/
- implement_instructions.md: Uses \$active_task_path/implementation/
- qa_instructions.md: Uses \$active_task_path/qa/
- reflect_archive_instructions.md: Uses \$active_task_path/reflection/ and release/
- universal_instructions.md: Uses memory-bank/system/universal/

✅ VALIDATION PASSED:
- 0 old paths remaining
- Active task path integration complete
- Graceful fallback implemented
- Testing successful

✅ SYSTEM INTEGRITY RESTORED:
- Memory Bank 2.0.0 compliance achieved
- All task artifacts properly grouped
- System artifacts remain in system folder

Fixes: #2025-06-25_ID-002_artifact-paths-unification"

echo "✅ Final commit created"
```

## 🔧 ТЕХНИЧЕСКИЕ ДЕТАЛИ РЕАЛИЗАЦИИ

### ШАБЛОН ДЛЯ КАЖДОГО РЕЖИМА:

```bash
# Добавить в начало MANDATORY ARTIFACT CREATION:
echo "=== ПОЛУЧЕНИЕ АКТИВНОЙ ЗАДАЧИ ==="
active_task_path=$(get_active_task_path)

if [ -z "$active_task_path" ]; then
    echo "⚠️  КРИТИЧЕСКАЯ ОШИБКА: Активная задача не выбрана!"
    echo ""
    echo "🔧 РЕШЕНИЕ:"
    echo "1. Выберите существующую задачу:"
    echo "   ls memory-bank/tasks/todo/"
    echo "   ls memory-bank/tasks/in_progress/"
    echo "   set_active_task(memory-bank/tasks/[status]/[task-directory])"
    echo ""
    echo "2. Или создайте новую задачу в VAN режиме"
    echo ""
    echo "❌ [MODE] режим не может продолжить без активной задачи"
    exit 1
fi

echo "✅ Активная задача: $active_task_path"
echo "📁 Создание папки [mode-folder]..."
mkdir -p "$active_task_path/[mode-folder]"
```

### СПЕЦИФИЧНЫЕ ЗАМЕНЫ ПО РЕЖИМАМ:

#### CREATIVE:
```bash
# Старые пути → Новые пути
"memory-bank/creative/" → "$active_task_path/creative/"
"memory-bank/style-guide.md" → "$active_task_path/creative/style-guide.md"

# Обязательные артефакты:
- $active_task_path/creative/[component-name].md
- $active_task_path/creative/style-guide.md
```

#### PLAN:
```bash
# Старые пути → Новые пути
"memory-bank/planning/" → "$active_task_path/planning/"

# Обязательные артефакты:
- $active_task_path/planning/requirements.md (Level 3-4)
- $active_task_path/planning/architecture.md (Level 4)
- $active_task_path/planning/implementation-plan.md (Level 3-4)
```

#### IMPLEMENT:
```bash
# Старые пути → Новые пути
"memory-bank/implementation/" → "$active_task_path/implementation/"

# Обязательные артефакты:
- $active_task_path/implementation/build-log.md
- $active_task_path/implementation/test-results.md
```

#### QA:
```bash
# Старые пути → Новые пути
"memory-bank/qa/" → "$active_task_path/qa/"

# Обязательные артефакты:
- $active_task_path/qa/qa-report.md
- $active_task_path/qa/test-log.md
- $active_task_path/qa/issues.md (если найдены проблемы)
```

#### REFLECT & ARCHIVE:
```bash
# Старые пути → Новые пути
"memory-bank/archive/" → "$active_task_path/reflection/" и "$active_task_path/release/"

# Обязательные артефакты:
- $active_task_path/reflection/reflection.md
- $active_task_path/release/commit-message.txt
- $active_task_path/release/release-notes.md
- $active_task_path/release/changelog.md
```

#### UNIVERSAL:
```bash
# Старые пути → Новые пути
"memory-bank/universal/" → "memory-bank/system/universal/"

# Обязательные артефакты:
- memory-bank/system/universal/[date]-request-log.md
```

## ⚠️ КРИТИЧЕСКИЕ МОМЕНТЫ

### РИСКИ:
1. **Поломка существующих процессов** - минимизируется тестированием
2. **Проблемы с активной задачей** - решается graceful fallback
3. **Потеря данных** - предотвращается backup'ом

### МИТИГАЦИЯ:
1. **Полный backup перед началом**
2. **Поэтапные git commit'ы**
3. **Автоматическая валидация на каждом шаге**
4. **Rollback план готов**

### SUCCESS CRITERIA:
- [ ] ✅ 0 старых путей в инструкциях
- [ ] ✅ 6 режимов обновлены
- [ ] ✅ Все тесты пройдены
- [ ] ✅ Git commits созданы
- [ ] ✅ Документация обновлена

## 🎯 СЛЕДУЮЩИЕ ШАГИ

После завершения IMPLEMENT:
1. **QA** - протестировать все режимы с реальными задачами
2. **REFLECT** - проанализировать качество решения
3. **ARCHIVE** - зафиксировать изменения и создать релиз

---

**Создано:** 2025-06-25 в PLAN режиме
**Статус:** IMPLEMENTATION PLAN COMPLETE → READY FOR CREATIVE/IMPLEMENT
**Рекомендуемый следующий режим:** IMPLEMENT (немедленная реализация)
**Приоритет:** HIGH - критическая системная проблема