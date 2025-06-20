# PHASE 1: ДЕТАЛЬНЫЙ ПЛАН СОЗДАНИЯ .MDC ФАЙЛОВ

**Дата**: 2024-12-09
**Режим**: VAN.RULES
**Фаза**: Phase 1 - Cursor Workaround Implementation
**Обновление**: Добавлены git workflow и расширенный анализ тестов

---

## 🎯 ЦЕЛЬ PHASE 1

Создать все 37 .mdc файлов (было 31) с правилами разработки, используя Cursor workaround процесс из changing_the_rules.md. Включить новые правила для git workflow и анализа больших тестовых наборов.

---

## 📋 ПОЛНЫЙ СПИСОК .MDC ФАЙЛОВ (37 файлов)

### Planning (4 файла)
1. `phased-approach.mdc` - Поэтапный подход к разработке
2. `progress-documentation.mdc` - Документирование прогресса
3. `problem-prioritization.mdc` - Приоритизация проблем
4. `isolated-design.mdc` - Изолированное проектирование

### Implementation (4 файла)
5. `stub-avoidance.mdc` - Избежание заглушек
6. `robust-search.mdc` - Надежный поиск
7. `system-coordination.mdc` - Координация системы
8. `dependency-checking.mdc` - Проверка зависимостей

### Testing (7 файлов) - ОБНОВЛЕНО
9. `bun-core-rules.mdc` - Основные правила Bun
10. `bun-features.mdc` - Функции Bun
11. `performance-testing.mdc` - Тестирование производительности
12. `edge-cases.mdc` - Граничные случаи
13. `test-organization.mdc` - Организация тестов
14. `large-test-analysis.mdc` - **НОВЫЙ** Анализ больших тестовых наборов
15. `test-failure-patterns.mdc` - **НОВЫЙ** Паттерны падения тестов

### Debugging (3 файла)
16. `tracing-methodology.mdc` - Методология трассировки
17. `detailed-logging.mdc` - Детальное логирование
18. `invariant-validation.mdc` - Валидация инвариантов

### Documentation (3 файла)
19. `decision-recording.mdc` - Запись решений
20. `statistics-tracking.mdc` - Отслеживание статистики
21. `usage-examples.mdc` - Примеры использования

### Integration (4 файла)
22. `isolated-design-rules.mdc` - Правила изолированного дизайна
23. `integration-planning.mdc` - Планирование интеграции
24. `integration-testing.mdc` - Тестирование интеграции
25. `dependency-documentation.mdc` - Документирование зависимостей

### Refactoring (3 файла)
26. `gradual-refactoring.mdc` - Постепенный рефакторинг
27. `backward-compatibility.mdc` - Обратная совместимость
28. `quality-metrics.mdc` - Метрики качества

### Git Workflow (4 файла) - **НОВАЯ КАТЕГОРИЯ**
29. `commit-strategies.mdc` - **НОВЫЙ** Стратегии коммитов
30. `branch-management.mdc` - **НОВЫЙ** Управление ветками
31. `change-documentation.mdc` - **НОВЫЙ** Документирование изменений
32. `backup-verification.mdc` - **НОВЫЙ** Верификация резервных копий

### Workflow (5 файлов) - ОБНОВЛЕНО
33. `van-mode-integration.mdc` - Интеграция VAN режима
34. `plan-mode-integration.mdc` - Интеграция PLAN режима
35. `implement-mode-integration.mdc` - Интеграция IMPLEMENT режима
36. `qa-mode-integration.mdc` - **НОВЫЙ** Интеграция QA режима
37. `reflect-archive-integration.mdc` - Интеграция REFLECT/ARCHIVE режима

---

## 🔄 CURSOR WORKAROUND ПРОЦЕСС

### Шаг 1: Подготовка (5 мин)
```bash
# Проверка git статуса
git status

# Создание backup точки
git tag -a "backup-rules-integration-$(date +%Y%m%d-%H%M)" -m "Backup before rules integration"

# Переименование директории
mv .cursor _cursor
```

### Шаг 2: Подготовка файлов для редактирования (5 мин)
```bash
# Переименование существующих .mdc файлов
find _cursor -name "*.mdc" -exec sh -c 'mv "$1" "$1.md"' _ {} \;

# Создание структуры CustomWorkflow
mkdir -p _cursor/rules/isolation_rules/CustomWorkflow/{planning,implementation,testing,debugging,documentation,integration,refactoring,git-workflow,workflow}
```

### Шаг 3: Создание .mdc.md файлов (30 мин)
Создание всех 37 файлов с расширением .mdc.md для редактирования

### Шаг 4: Восстановление структуры (5 мин)
```bash
# Переименование обратно в .mdc
find _cursor -name "*.mdc.md" -exec sh -c 'mv "$1" "${1%.md}"' _ {} \;

# Восстановление директории
mv _cursor .cursor
```

---

## 📝 СТАНДАРТНЫЙ ШАБЛОН .MDC ФАЙЛА

```yaml
---
description: "[Краткое описание правила]"
globs: ["**/CustomWorkflow/[category]/**", "**/[relevant-pattern]/**"]
alwaysApply: false
---
# [Название правила]

## Описание
[Детальное описание правила и его применения]

## Применение в Memory Bank
- **VAN Mode**: [Как применяется в VAN режиме]
- **PLAN Mode**: [Как применяется в PLAN режиме]
- **IMPLEMENT Mode**: [Как применяется в IMPLEMENT режиме]
- **QA Mode**: [Как применяется в QA режиме] # НОВОЕ
- **REFLECT/ARCHIVE Mode**: [Как применяется в REFLECT/ARCHIVE режиме]

## Правила и рекомендации
1. [Первое правило]
2. [Второе правило]
3. [Третье правило]

## Примеры
```[language]
[Примеры кода или команд]
```

## Связанные правила
- [Ссылки на связанные .mdc файлы]

## Метрики успеха
- [Критерии успешного применения правила]
```

---

## 🧪 ДЕТАЛЬНЫЕ СПЕЦИФИКАЦИИ НОВЫХ ФАЙЛОВ

### large-test-analysis.mdc
```yaml
---
description: "Правила анализа больших тестовых наборов через файловый вывод"
globs: ["**/CustomWorkflow/testing/**", "**/large-tests/**", "**/qa/**"]
alwaysApply: false
---
# Анализ Больших Тестовых Наборов

## Описание
Правила для эффективного анализа больших тестовых наборов (>100 тестов) через сохранение результатов в файлы и последующий анализ паттернов падений.

## Критерии активации
- Количество тестов > 100
- Время выполнения тестов > 30 секунд
- Наличие интеграционных или E2E тестов
- Сложные тестовые сценарии

## Процесс анализа
```bash
# Шаг 1: Полный захват вывода тестов
bun test > test_output.log 2>&1

# Шаг 2: Анализ общей статистики
echo "=== ОБЩАЯ СТАТИСТИКА ===" > test_analysis.log
grep -E "(pass|fail)" test_output.log | wc -l >> test_analysis.log
grep "(fail)" test_output.log | wc -l >> test_analysis.log

# Шаг 3: Извлечение падающих тестов
echo "=== ПАДАЮЩИЕ ТЕСТЫ ===" >> test_analysis.log
grep "(fail)" test_output.log >> test_analysis.log

# Шаг 4: Группировка по модулям
echo "=== ГРУППИРОВКА ПО МОДУЛЯМ ===" >> test_analysis.log
grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq -c | sort -nr >> test_analysis.log

# Шаг 5: Анализ контекста ошибок
grep -A 10 -B 5 "(fail)" test_output.log > failing_tests_context.log

# Шаг 6: Поиск паттернов производительности
echo "=== МЕДЛЕННЫЕ ТЕСТЫ ===" >> test_analysis.log
grep -E "\([0-9]{3,}ms\)" test_output.log | sort -nr | head -20 >> test_analysis.log
```

## Применение в Memory Bank
- **QA Mode**: Автоматический анализ при обнаружении >100 тестов
- **IMPLEMENT Mode**: Проверка после значимых изменений в коде
- **REFLECT Mode**: Анализ паттернов падений для документирования
- **VAN Mode**: Оценка сложности тестирования при планировании

## Правила принятия решений
1. **При >10 падающих тестах**: Группировать по модулям и исправлять по приоритету
2. **При >50% падений в модуле**: Анализировать архитектурные проблемы
3. **При timeout ошибках**: Анализировать производительность и ресурсы
4. **При зависимостных падениях**: Проверять порядок выполнения тестов

## Интеграция с git workflow
- Сохранение test_analysis.log в репозиторий при критических изменениях
- Коммит failing_tests_context.log для отслеживания регрессий
- Тегирование версий с известными проблемами тестов

## Метрики успеха
- Время анализа < 5 минут для любого количества тестов
- 100% падающих тестов категоризированы
- Все критические паттерны выявлены и документированы
```

### test-failure-patterns.mdc
```yaml
---
description: "Правила выявления и анализа паттернов падения тестов"
globs: ["**/CustomWorkflow/testing/**", "**/failure-analysis/**", "**/qa/**"]
alwaysApply: false
---
# Анализ Паттернов Падения Тестов

## Описание
Систематический подход к выявлению, категоризации и анализу паттернов падения тестов для быстрого выявления системных проблем.

## Типы паттернов падений
1. **Групповые падения**: Целые группы/модули тестов падают одновременно
2. **Временные падения**: Тесты падают по timeout или временным ограничениям
3. **Зависимостные падения**: Падения из-за порядка выполнения или состояния
4. **Ресурсные падения**: Падения из-за памяти, CPU или I/O ограничений
5. **Конфигурационные падения**: Падения из-за настроек окружения
6. **Интеграционные падения**: Падения при взаимодействии компонентов

## Команды анализа паттернов
```bash
# Анализ типов ошибок
echo "=== АНАЛИЗ ТИПОВ ОШИБОК ===" > failure_patterns.log

# 1. Поиск timeout ошибок
echo "--- TIMEOUT ОШИБКИ ---" >> failure_patterns.log
grep -i "timeout\|timed out" test_output.log >> failure_patterns.log

# 2. Поиск memory ошибок
echo "--- MEMORY ОШИБКИ ---" >> failure_patterns.log
grep -i "memory\|heap\|oom" test_output.log >> failure_patterns.log

# 3. Поиск connection ошибок
echo "--- CONNECTION ОШИБКИ ---" >> failure_patterns.log
grep -i "connection\|network\|refused" test_output.log >> failure_patterns.log

# 4. Поиск assertion ошибок
echo "--- ASSERTION ОШИБКИ ---" >> failure_patterns.log
grep -i "assertion\|expected\|actual" test_output.log >> failure_patterns.log

# 5. Группировка по частоте
echo "--- ЧАСТОТА ОШИБОК ПО МОДУЛЯМ ---" >> failure_patterns.log
grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq -c | sort -nr >> failure_patterns.log

# 6. Анализ производительности
echo "--- МЕДЛЕННЫЕ ТЕСТЫ (>1000ms) ---" >> failure_patterns.log
grep -E "\([0-9]{4,}ms\)" test_output.log | sort -nr >> failure_patterns.log
```

## Применение в Memory Bank
- **QA Mode**: Автоматическое выявление системных проблем
- **IMPLEMENT Mode**: Предотвращение регрессий через анализ паттернов
- **REFLECT Mode**: Документирование известных проблем и решений
- **PLAN Mode**: Планирование исправлений на основе приоритетов

## Правила приоритизации исправлений
1. **Критический приоритет**: >50% тестов в модуле падают
2. **Высокий приоритет**: Групповые падения (>5 тестов одновременно)
3. **Средний приоритет**: Повторяющиеся паттерны ошибок
4. **Низкий приоритет**: Единичные падения без паттерна

## Автоматизация анализа
```bash
# Скрипт автоматического анализа паттернов
analyze_test_patterns() {
    local test_output="$1"
    local patterns_file="failure_patterns_$(date +%Y%m%d_%H%M).log"

    # Подсчет общей статистики
    local total_tests=$(grep -E "(pass|fail)" "$test_output" | wc -l)
    local failed_tests=$(grep "(fail)" "$test_output" | wc -l)
    local failure_rate=$((failed_tests * 100 / total_tests))

    echo "Общая статистика: $total_tests тестов, $failed_tests падений ($failure_rate%)" > "$patterns_file"

    # Анализ критичности
    if [ $failure_rate -gt 50 ]; then
        echo "🚨 КРИТИЧЕСКОЕ СОСТОЯНИЕ: >50% тестов падают" >> "$patterns_file"
    elif [ $failure_rate -gt 20 ]; then
        echo "⚠️ ВЫСОКИЙ РИСК: >20% тестов падают" >> "$patterns_file"
    elif [ $failure_rate -gt 5 ]; then
        echo "⚡ СРЕДНИЙ РИСК: >5% тестов падают" >> "$patterns_file"
    else
        echo "✅ НИЗКИЙ РИСК: <5% тестов падают" >> "$patterns_file"
    fi

    # Детальный анализ паттернов
    analyze_error_patterns "$test_output" >> "$patterns_file"
}
```

## Интеграция с git workflow
- Автоматическое создание issues для критических паттернов
- Коммит анализа паттернов в репозиторий
- Связывание паттернов с конкретными коммитами

## Метрики успеха
- 100% падающих тестов категоризированы по паттернам
- Время выявления критических проблем < 2 минут
- Автоматическая приоритизация исправлений
- Снижение повторяющихся паттернов на 80%
```

### commit-strategies.mdc
```yaml
---
description: "Стратегии коммитов для разных фаз разработки в Memory Bank"
globs: ["**/CustomWorkflow/git-workflow/**", "**/commit/**", "**/git/**"]
alwaysApply: false
---
# Стратегии Коммитов для Memory Bank

## Описание
Систематический подход к коммитам, интегрированный с фазами Memory Bank для обеспечения трассируемости и контекста разработки.

## Фазовые стратегии коммитов

### PLAN Phase Commits
```bash
# Структура: PLAN: [Component] - [Planning aspect]
git commit -m "PLAN: User Authentication - Architecture design and security considerations"
git commit -m "PLAN: Database Schema - Entity relationships and migration strategy"
git commit -m "PLAN: API Design - Endpoint specifications and validation rules"
```

### IMPLEMENT Phase Commits
```bash
# Структура: IMPLEMENT: [Feature] - [Implementation details]
git commit -m "IMPLEMENT: User login - JWT token generation and validation"
git commit -m "IMPLEMENT: Password reset - Email service integration and token management"
git commit -m "IMPLEMENT: User profile - CRUD operations and data validation"
```

### QA Phase Commits
```bash
# Структура: QA: [Fix/Test] - [Issue resolution or test addition]
git commit -m "QA: Fix memory leak in data processing - Resolved issue affecting large datasets"
git commit -m "QA: Add integration tests for auth flow - Cover login/logout scenarios"
git commit -m "QA: Performance optimization - Reduce API response time by 40%"
```

### REFLECT Phase Commits
```bash
# Структура: REFLECT: [Documentation] - [Insights and learnings]
git commit -m "REFLECT: Document performance optimizations - Added lessons learned and metrics"
git commit -m "REFLECT: Update architecture decisions - Record trade-offs and alternatives"
git commit -m "REFLECT: Archive task completion - Final metrics and success criteria"
```

## Применение в Memory Bank
- **VAN Mode**: Создание backup коммитов перед началом работы
- **PLAN Mode**: Коммиты планов, архитектуры и проектных решений
- **IMPLEMENT Mode**: Инкрементальные коммиты по фичам и компонентам
- **QA Mode**: Коммиты исправлений, тестов и оптимизаций
- **REFLECT Mode**: Коммиты документации, рефлексии и архивирования

## Правила коммитов
1. **Атомарность**: Один коммит = одна логическая единица изменений
2. **Контекстность**: Префикс фазы для понимания контекста
3. **Описательность**: Краткое описание + детальное воздействие
4. **Трассируемость**: Связь с tasks.md и Memory Bank статусами

## Автоматизация коммитов
```bash
# Функция для автоматических коммитов по фазам
memory_bank_commit() {
    local phase="$1"
    local component="$2"
    local description="$3"
    local details="$4"

    # Проверка статуса git
    if ! git diff-index --quiet HEAD --; then
        # Формирование сообщения коммита
        local commit_msg="${phase}: ${component} - ${description}"
        if [ -n "$details" ]; then
            commit_msg="${commit_msg} - ${details}"
        fi

        # Выполнение коммита
        git add .
        git commit -m "$commit_msg"

        # Обновление tasks.md с информацией о коммите
        echo "✅ Committed: $commit_msg" >> memory-bank/tasks.md
    fi
}

# Примеры использования
memory_bank_commit "IMPLEMENT" "User Auth" "Add login functionality" "JWT tokens with 24h expiration"
memory_bank_commit "QA" "Performance" "Optimize database queries" "Reduced response time from 200ms to 80ms"
```

## Интеграция с tasks.md
- Автоматическое обновление статусов задач при коммитах
- Связывание коммитов с конкретными пунктами чеклистов
- Отслеживание прогресса через git history

## Метрики успеха
- 100% коммитов имеют правильный фазовый префикс
- Все коммиты связаны с tasks.md статусами
- Возможность восстановления контекста по git history
- Автоматическая трассируемость изменений
```

### backup-verification.mdc
```yaml
---
description: "Правила верификации резервных копий перед критическими изменениями"
globs: ["**/CustomWorkflow/git-workflow/**", "**/backup/**", "**/verification/**"]
alwaysApply: false
---
# Верификация Резервных Копий

## Описание
Систематический процесс создания и верификации резервных копий перед выполнением критических изменений в Memory Bank системе.

## Критерии для создания backup
1. **Крупные рефакторинги**: Изменения архитектуры или структуры
2. **Интеграция новых компонентов**: Добавление внешних зависимостей
3. **Изменения в .cursor/rules**: Модификация правил системы
4. **Миграции данных**: Изменения схемы базы данных
5. **Обновления зависимостей**: Мажорные версии пакетов

## Процесс верификации
```bash
# Шаг 1: Проверка текущего состояния
verify_git_status() {
    echo "=== ПРОВЕРКА GIT СТАТУСА ==="

    # Проверка чистоты рабочей директории
    if ! git diff-index --quiet HEAD --; then
        echo "❌ Рабочая директория не чистая. Необходимо зафиксировать изменения."
        git status --porcelain
        return 1
    fi

    # Проверка синхронизации с remote
    local behind=$(git rev-list --count HEAD..origin/$(git branch --show-current) 2>/dev/null || echo "0")
    local ahead=$(git rev-list --count origin/$(git branch --show-current)..HEAD 2>/dev/null || echo "0")

    if [ "$behind" -gt 0 ]; then
        echo "⚠️ Локальная ветка отстает на $behind коммитов"
    fi

    if [ "$ahead" -gt 0 ]; then
        echo "⚠️ Локальная ветка опережает на $ahead коммитов"
    fi

    echo "✅ Git статус проверен"
}

# Шаг 2: Создание backup точек
create_backup_points() {
    local backup_type="$1"
    local description="$2"
    local timestamp=$(date +%Y%m%d-%H%M)

    echo "=== СОЗДАНИЕ BACKUP ТОЧЕК ==="

    # Создание тега
    local tag_name="backup-${backup_type}-${timestamp}"
    git tag -a "$tag_name" -m "Backup before ${description}"
    echo "✅ Создан тег: $tag_name"

    # Создание backup ветки
    local branch_name="backup-${backup_type}-${timestamp}"
    git checkout -b "$branch_name"
    git checkout -
    echo "✅ Создана backup ветка: $branch_name"

    # Сохранение информации о backup
    echo "Backup created: $tag_name" >> memory-bank/backup-log.md
    echo "Description: $description" >> memory-bank/backup-log.md
    echo "Timestamp: $(date)" >> memory-bank/backup-log.md
    echo "---" >> memory-bank/backup-log.md
}

# Шаг 3: Верификация backup
verify_backup() {
    local tag_name="$1"

    echo "=== ВЕРИФИКАЦИЯ BACKUP ==="

    # Проверка существования тега
    if git tag -l | grep -q "$tag_name"; then
        echo "✅ Тег $tag_name существует"
    else
        echo "❌ Тег $tag_name не найден"
        return 1
    fi

    # Проверка возможности отката
    local current_commit=$(git rev-parse HEAD)
    local backup_commit=$(git rev-parse "$tag_name")

    if [ "$current_commit" != "$backup_commit" ]; then
        echo "✅ Backup точка отличается от текущего состояния"
    else
        echo "⚠️ Backup точка совпадает с текущим состоянием"
    fi

    echo "✅ Backup верифицирован"
}
```

## Применение в Memory Bank
- **VAN Mode**: Автоматическая проверка backup перед началом работы
- **PLAN Mode**: Создание backup перед архитектурными изменениями
- **IMPLEMENT Mode**: Backup перед интеграцией критических компонентов
- **QA Mode**: Backup перед применением крупных исправлений

## Интеграция с Cursor workaround
```bash
# Специальный backup для изменений правил
cursor_rules_backup() {
    echo "=== BACKUP ДЛЯ ИЗМЕНЕНИЙ ПРАВИЛ ==="

    # Проверка состояния
    verify_git_status

    # Создание специального backup
    create_backup_points "rules" "Cursor rules modification"

    # Дополнительная копия .cursor директории
    cp -r .cursor .cursor.backup.$(date +%Y%m%d-%H%M)
    echo "✅ Создана дополнительная копия .cursor директории"

    # Готовность к workaround
    echo "✅ Готов к выполнению Cursor workaround"
}

# Восстановление после workaround
cursor_rules_restore_verify() {
    echo "=== ВЕРИФИКАЦИЯ ПОСЛЕ WORKAROUND ==="

    # Проверка структуры .cursor
    if [ -d ".cursor/rules" ]; then
        echo "✅ Структура .cursor восстановлена"
    else
        echo "❌ Структура .cursor повреждена"
        return 1
    fi

    # Проверка .mdc файлов
    local mdc_count=$(find .cursor -name "*.mdc" | wc -l)
    echo "✅ Найдено $mdc_count .mdc файлов"

    # Проверка отсутствия .mdc.md файлов
    local temp_files=$(find .cursor -name "*.mdc.md" | wc -l)
    if [ "$temp_files" -eq 0 ]; then
        echo "✅ Временные .mdc.md файлы удалены"
    else
        echo "⚠️ Найдены временные файлы: $temp_files"
    fi
}
```

## Автоматические проверки
1. **Pre-commit hooks**: Автоматическая проверка backup перед коммитами
2. **CI/CD интеграция**: Верификация backup в pipeline
3. **Scheduled backups**: Регулярные автоматические backup точки

## Метрики успеха
- 100% критических изменений имеют backup точки
- Время создания backup < 30 секунд
- 0 потерь данных при откатах
- Автоматическая верификация целостности backup
```

### qa-mode-integration.mdc
```yaml
---
description: "Интеграция QA режима с расширенным анализом тестов и git workflow"
globs: ["**/CustomWorkflow/workflow/**", "**/qa/**", "**/testing/**"]
alwaysApply: false
---
# QA Mode Integration

## Описание
Интеграция QA режима в Memory Bank с поддержкой анализа больших тестовых наборов, автоматического выявления паттернов падений и git workflow.

## Активация QA Mode
QA режим активируется автоматически при:
- Завершении IMPLEMENT фазы
- Обнаружении падающих тестов
- Запросе пользователя на проверку качества
- Перед переходом в REFLECT фазу

## Процесс QA Mode
```bash
# Шаг 1: Инициализация QA режима
qa_mode_init() {
    echo "🔍 Активация QA Mode..."

    # Создание QA backup точки
    create_backup_points "qa" "QA phase initialization"

    # Подготовка директорий для анализа
    mkdir -p qa-analysis/{test-results,failure-patterns,performance}

    # Загрузка QA правил
    fetch_rules([
        "isolation_rules/CustomWorkflow/testing/large-test-analysis",
        "isolation_rules/CustomWorkflow/testing/test-failure-patterns",
        "isolation_rules/CustomWorkflow/git-workflow/commit-strategies"
    ])
}

# Шаг 2: Анализ тестового покрытия
qa_test_analysis() {
    echo "📊 Анализ тестового покрытия..."

    # Подсчет общего количества тестов
    local test_count=$(find . -name "*.test.*" -o -name "*.spec.*" | wc -l)
    echo "Найдено тестовых файлов: $test_count"

    # Определение стратегии выполнения
    if [ "$test_count" -gt 100 ]; then
        echo "🔄 Большой тестовый набор обнаружен. Применяем анализ через файлы..."
        large_test_suite_analysis
    else
        echo "⚡ Стандартный тестовый набор. Выполняем обычное тестирование..."
        standard_test_execution
    fi
}

# Шаг 3: Выполнение тестов с анализом
large_test_suite_analysis() {
    echo "🧪 Выполнение анализа больших тестовых наборов..."

    # Полное выполнение тестов с захватом вывода
    bun test > qa-analysis/test-results/full_output.log 2>&1
    local exit_code=$?

    # Анализ результатов
    analyze_test_results "qa-analysis/test-results/full_output.log"

    # Анализ паттернов падений
    analyze_failure_patterns "qa-analysis/test-results/full_output.log"

    # Генерация отчета
    generate_qa_report "$exit_code"
}

# Шаг 4: Анализ результатов тестов
analyze_test_results() {
    local test_output="$1"
    local analysis_file="qa-analysis/test-results/analysis.log"

    echo "=== QA АНАЛИЗ РЕЗУЛЬТАТОВ ===" > "$analysis_file"
    echo "Дата: $(date)" >> "$analysis_file"
    echo "" >> "$analysis_file"

    # Общая статистика
    local total_tests=$(grep -E "(pass|fail)" "$test_output" | wc -l)
    local passed_tests=$(grep "(pass)" "$test_output" | wc -l)
    local failed_tests=$(grep "(fail)" "$test_output" | wc -l)
    local success_rate=$((passed_tests * 100 / total_tests))

    echo "Общая статистика:" >> "$analysis_file"
    echo "- Всего тестов: $total_tests" >> "$analysis_file"
    echo "- Прошли: $passed_tests" >> "$analysis_file"
    echo "- Упали: $failed_tests" >> "$analysis_file"
    echo "- Успешность: $success_rate%" >> "$analysis_file"
    echo "" >> "$analysis_file"

    # Определение критичности
    if [ "$success_rate" -lt 80 ]; then
        echo "🚨 КРИТИЧЕСКОЕ СОСТОЯНИЕ: Успешность < 80%" >> "$analysis_file"
        echo "qa_status=CRITICAL" > qa-analysis/status.env
    elif [ "$success_rate" -lt 95 ]; then
        echo "⚠️ ТРЕБУЕТ ВНИМАНИЯ: Успешность < 95%" >> "$analysis_file"
        echo "qa_status=WARNING" > qa-analysis/status.env
    else
        echo "✅ ХОРОШЕЕ СОСТОЯНИЕ: Успешность >= 95%" >> "$analysis_file"
        echo "qa_status=GOOD" > qa-analysis/status.env
    fi
}

# Шаг 5: Анализ паттернов падений
analyze_failure_patterns() {
    local test_output="$1"
    local patterns_file="qa-analysis/failure-patterns/patterns.log"

    echo "🔍 Анализ паттернов падений..."

    # Применение правил из test-failure-patterns.mdc
    analyze_error_types "$test_output" > "$patterns_file"

    # Группировка по модулям
    echo "=== ПАДЕНИЯ ПО МОДУЛЯМ ===" >> "$patterns_file"
    grep "(fail)" "$test_output" | cut -d'>' -f1 | sort | uniq -c | sort -nr >> "$patterns_file"

    # Поиск критических паттернов
    identify_critical_patterns "$test_output" >> "$patterns_file"
}

# Шаг 6: Генерация QA отчета
generate_qa_report() {
    local exit_code="$1"
    local report_file="qa-analysis/qa_report_$(date +%Y%m%d_%H%M).md"

    echo "📋 Генерация QA отчета..."

    cat > "$report_file" << EOF
# QA Report - $(date)

## Общая информация
- **Статус выполнения**: $([ $exit_code -eq 0 ] && echo "✅ УСПЕШНО" || echo "❌ ОШИБКИ")
- **Время выполнения**: $(date)
- **Режим**: QA Mode (Large Test Suite Analysis)

## Результаты тестирования
$(cat qa-analysis/test-results/analysis.log)

## Анализ паттернов падений
$(cat qa-analysis/failure-patterns/patterns.log)

## Рекомендации
$(generate_qa_recommendations)

## Следующие шаги
$(generate_next_steps)
EOF

    echo "✅ QA отчет создан: $report_file"
}
```

## Применение в Memory Bank
- **Автоматическая активация**: При завершении IMPLEMENT фазы
- **Интеграция с git**: Автоматические коммиты результатов QA
- **Связь с tasks.md**: Обновление статусов задач на основе QA результатов
- **Переход в REFLECT**: Автоматический переход при успешном QA

## Правила принятия решений
1. **CRITICAL статус**: Блокировка перехода в REFLECT, требуется исправление
2. **WARNING статус**: Документирование проблем, возможен переход с ограничениями
3. **GOOD статус**: Автоматический переход в REFLECT фазу

## Интеграция с git workflow
```bash
# Автоматические коммиты QA результатов
qa_git_integration() {
    local qa_status=$(cat qa-analysis/status.env | cut -d'=' -f2)

    # Коммит результатов QA
    git add qa-analysis/
    git commit -m "QA: Analysis complete - Status: $qa_status"

    # Обновление tasks.md
    echo "✅ QA Phase completed with status: $qa_status" >> memory-bank/tasks.md

    # Создание тега для критических состояний
    if [ "$qa_status" = "CRITICAL" ]; then
        git tag -a "qa-critical-$(date +%Y%m%d-%H%M)" -m "Critical QA issues detected"
    fi
}
```

## Метрики успеха
- Автоматическое выявление 100% критических проблем
- Время QA анализа < 10 минут для любого размера проекта
- Интеграция с git workflow без ручного вмешательства
- Четкие рекомендации для каждого типа проблем
```

---

## ⏱️ ВРЕМЕННОЙ ПЛАН PHASE 1 (45 мин)

### Минуты 1-5: Подготовка Cursor Workaround
- Проверка git статуса и создание backup
- Переименование .cursor → _cursor
- Создание структуры CustomWorkflow

### Минуты 6-35: Создание .mdc.md файлов
- **Минуты 6-15**: Planning + Git Workflow файлы (8 файлов)
- **Минуты 16-25**: Implementation + Testing файлы (11 файлов)
- **Минуты 26-35**: Debugging + Documentation + Integration + Refactoring + Workflow файлы (18 файлов)

### Минуты 36-40: Восстановление структуры
- Переименование .mdc.md → .mdc
- Переименование _cursor → .cursor

### Минуты 41-45: Верификация
- Проверка корректности всех файлов
- Тестирование загрузки правил
- Финальная проверка

---

## ✅ КРИТЕРИИ УСПЕХА PHASE 1

### Технические критерии:
- [ ] Все 37 .mdc файлов созданы
- [ ] Все файлы имеют корректные метаданные
- [ ] Все glob паттерны корректны
- [ ] Новые git workflow правила интегрированы
- [ ] Правила анализа больших тестов созданы
- [ ] QA Mode интеграция завершена

### Функциональные критерии:
- [ ] Правила загружаются без ошибок
- [ ] Git workflow интегрирован в процесс
- [ ] Анализ больших тестовых наборов работает
- [ ] QA Mode активируется корректно
- [ ] Все режимы Memory Bank поддерживают новые правила

---

**Статус**: 📋 PHASE 1 ПЛАН ОБНОВЛЕН И ГОТОВ К ВЫПОЛНЕНИЮ
**Следующий шаг**: Начать Cursor Workaround Implementation с новыми требованиями