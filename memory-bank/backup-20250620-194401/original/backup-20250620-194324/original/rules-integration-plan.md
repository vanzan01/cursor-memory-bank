# ПЛАН ИНТЕГРАЦИИ ПРАВИЛ РАЗРАБОТКИ В MEMORY BANK

**Дата создания**: 2024-12-09
**Режим**: VAN.RULES
**Цель**: Интеграция пользовательских правил разработки в систему Memory Bank
**Обновление**: Добавлены git workflow и расширенный анализ тестов

---

## 🎯 ЦЕЛИ ИНТЕГРАЦИИ

### Основные задачи:
1. **Структурирование правил**: Разбить монолитные файлы правил на модульные .mdc компоненты
2. **Контекстная загрузка**: Обеспечить автоматическую загрузку правил в соответствующих режимах
3. **Workflow интеграция**: Интегрировать пользовательский workflow в существующие режимы Memory Bank
4. **Bun-специфичные правила**: Создать специализированные правила для тестирования с Bun
5. **Git workflow интеграция**: Интегрировать процессы фиксации изменений из changing_the_rules.md
6. **Расширенный анализ тестов**: Добавить правила для анализа больших тестовых наборов
7. **Системная консистентность**: Обеспечить совместимость с существующей архитектурой Memory Bank

---

## 📋 АНАЛИЗ ИСХОДНЫХ ФАЙЛОВ

### Файлы для интеграции:
- ✅ `DEVELOPMENT_PROMPT_RULES.md` (237 строк) - Правила для AI ассистента
- ✅ `TESTING_BUN.md` (1419 строк) - Документация по Bun тестированию
- ✅ `DEVELOPMENT_RULES.md` (1141 строка) - Основные правила разработки
- ✅ `DEVELOPMENT_WORKFLOW_RULES.md` (175 строк) - Правила workflow
- ✅ `MY_WORKFLOW.md` (175 строк) - Описание пользовательского workflow
- ✅ `RULES.md` (531 строка) - Существующие правила системы
- ✅ `changing_the_rules.md` (353 строки) - Git workflow и процессы фиксации

### Выявленные категории правил:
1. **Планирование** (Rules #1-3, #17-20)
2. **Реализация** (Rules #4-7, #27-29)
3. **Тестирование с Bun** (Rules #8-16)
4. **Отладка** (Rules #21-23)
5. **Документирование** (Rules #24-26)
6. **Интеграция** (Rules #17-20)
7. **Рефакторинг** (Rules #27-29)
8. **Git Workflow** (из changing_the_rules.md)
9. **Расширенный анализ тестов** (для больших тестовых наборов)

---

## 🏗️ ОБНОВЛЕННАЯ СТРУКТУРА ИНТЕГРАЦИИ

### Новая структура в .cursor/rules/:
```
.cursor/rules/isolation_rules/
├── CustomWorkflow/
│   ├── planning/
│   │   ├── phased-approach.mdc
│   │   ├── progress-documentation.mdc
│   │   ├── problem-prioritization.mdc
│   │   └── isolated-design.mdc
│   ├── implementation/
│   │   ├── stub-avoidance.mdc
│   │   ├── robust-search.mdc
│   │   ├── system-coordination.mdc
│   │   └── dependency-checking.mdc
│   ├── testing/
│   │   ├── bun-core-rules.mdc
│   │   ├── bun-features.mdc
│   │   ├── performance-testing.mdc
│   │   ├── edge-cases.mdc
│   │   ├── test-organization.mdc
│   │   ├── large-test-analysis.mdc      # НОВЫЙ
│   │   └── test-failure-patterns.mdc    # НОВЫЙ
│   ├── debugging/
│   │   ├── tracing-methodology.mdc
│   │   ├── detailed-logging.mdc
│   │   └── invariant-validation.mdc
│   ├── documentation/
│   │   ├── decision-recording.mdc
│   │   ├── statistics-tracking.mdc
│   │   └── usage-examples.mdc
│   ├── integration/
│   │   ├── isolated-design-rules.mdc
│   │   ├── integration-planning.mdc
│   │   ├── integration-testing.mdc
│   │   └── dependency-documentation.mdc
│   ├── refactoring/
│   │   ├── gradual-refactoring.mdc
│   │   ├── backward-compatibility.mdc
│   │   └── quality-metrics.mdc
│   ├── git-workflow/                    # НОВАЯ КАТЕГОРИЯ
│   │   ├── commit-strategies.mdc        # НОВЫЙ
│   │   ├── branch-management.mdc        # НОВЫЙ
│   │   ├── change-documentation.mdc     # НОВЫЙ
│   │   └── backup-verification.mdc      # НОВЫЙ
│   └── workflow/
│       ├── van-mode-integration.mdc
│       ├── plan-mode-integration.mdc
│       ├── implement-mode-integration.mdc
│       ├── qa-mode-integration.mdc      # НОВЫЙ
│       ├── reflect-archive-integration.mdc
│       └── pr-checklist.mdc
```

**Обновленный итог**: 37 .mdc файлов (было 31)

---

## 🔄 ПЛАН МОДИФИКАЦИИ (по changing_the_rules.md)

### Phase 1: Анализ и подготовка
1. **Проверка git статуса** - убедиться в чистом состоянии
2. **Анализ существующих правил** - изучить текущую структуру .cursor/rules
3. **Планирование изменений** - создать детальный план модификации
4. **Создание резервных копий** - сохранить текущее состояние

### Phase 2: Cursor Workaround Implementation
1. **Переименование директории**: `mv .cursor _cursor`
2. **Переименование файлов**: `find _cursor -name "*.mdc" -exec sh -c 'mv "$1" "$1.md"' _ {} \;`
3. **Применение изменений**: Создание новых .mdc файлов с правилами
4. **Верификация изменений**: Проверка корректности созданных файлов
5. **Восстановление расширений**: `find _cursor -name "*.mdc.md" -exec sh -c 'mv "$1" "${1%.md}"' _ {} \;`
6. **Восстановление директории**: `mv _cursor .cursor`

### Phase 3: Верификация и тестирование
1. **Тестирование glob паттернов** - проверка корректности путей
2. **Тестирование ссылок** - проверка всех файловых ссылок
3. **Тестирование заголовков** - проверка метаданных
4. **Системное тестирование** - проверка загрузки правил

### Phase 4: Git Integration (НОВАЯ ФАЗА)
1. **Фиксация изменений** - коммит созданных правил
2. **Документирование изменений** - обновление changelog
3. **Создание тегов** - версионирование правил
4. **Backup verification** - проверка сохранности изменений

---

## 📝 ИНТЕГРАЦИЯ С РЕЖИМАМИ MEMORY BANK

### VAN Mode Integration:
- Загрузка `workflow/van-mode-integration.mdc`
- Загрузка `git-workflow/backup-verification.mdc`
- Правила определения сложности задач
- Правила инициализации проекта

### PLAN Mode Integration:
- Загрузка `planning/phased-approach.mdc`
- Загрузка `planning/problem-prioritization.mdc`
- Загрузка `integration/isolated-design-rules.mdc`
- Загрузка `git-workflow/branch-management.mdc`

### IMPLEMENT Mode Integration:
- Загрузка `implementation/stub-avoidance.mdc`
- Загрузка `implementation/robust-search.mdc`
- Загрузка `testing/bun-core-rules.mdc`
- Загрузка `debugging/tracing-methodology.mdc`
- Загрузка `git-workflow/commit-strategies.mdc`

### QA Mode Integration (НОВОЕ):
- Загрузка `testing/large-test-analysis.mdc`
- Загрузка `testing/test-failure-patterns.mdc`
- Загрузка `workflow/qa-mode-integration.mdc`
- Правила для анализа больших тестовых наборов

### CREATIVE Mode Integration:
- Загрузка правил для творческого проектирования
- Интеграция с изолированным дизайном

### REFLECT/ARCHIVE Mode Integration:
- Загрузка `documentation/decision-recording.mdc`
- Загрузка `documentation/statistics-tracking.mdc`
- Загрузка `workflow/reflect-archive-integration.mdc`
- Загрузка `git-workflow/change-documentation.mdc`

---

## 🧪 НОВЫЕ ПРАВИЛА: РАСШИРЕННЫЙ АНАЛИЗ ТЕСТОВ

### large-test-analysis.mdc
```yaml
---
description: "Правила анализа больших тестовых наборов через файловый вывод"
globs: ["**/CustomWorkflow/testing/**", "**/large-tests/**"]
alwaysApply: false
---
# Анализ Больших Тестовых Наборов

## Критерии для файлового анализа
- Более 100 тестов в проекте
- Время выполнения > 30 секунд
- Сложные интеграционные тесты

## Процесс анализа
```bash
# Шаг 1: Захват полного вывода
bun test > test_output.log 2>&1

# Шаг 2: Поиск падающих тестов
grep "(fail)" test_output.log

# Шаг 3: Извлечение уникальных групп тестов
grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq

# Шаг 4: Запуск тестов по группам
bun test -t "Group Name"

# Шаг 5: Анализ контекста ошибок
grep -A 10 -B 5 "(fail)" test_output.log > failing_tests_context.log
```

## Применение в Memory Bank
- В QA Mode: автоматический анализ при > 100 тестах
- В IMPLEMENT Mode: проверка после значимых изменений
- В REFLECT Mode: анализ паттернов падений
```

### test-failure-patterns.mdc
```yaml
---
description: "Правила выявления паттернов падения тестов"
globs: ["**/CustomWorkflow/testing/**", "**/failure-analysis/**"]
alwaysApply: false
---
# Анализ Паттернов Падения Тестов

## Типы паттернов
1. **Групповые падения**: Целые группы тестов падают
2. **Временные падения**: Тесты падают по timeout
3. **Зависимостные падения**: Падения из-за порядка выполнения
4. **Ресурсные падения**: Падения из-за памяти/производительности

## Команды анализа
```bash
# Поиск паттернов ошибок
grep -i "error\|exception\|timeout\|memory" test_output.log

# Анализ производительности по группам
grep -E "\([0-9]{3,}ms\)" test_output.log | sort -nr

# Группировка по типам ошибок
grep -E "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq -c | sort -nr
```

## Применение в Memory Bank
- Автоматическое выявление системных проблем
- Приоритизация исправлений по частоте падений
- Документирование известных проблем
```

---

## 🔧 GIT WORKFLOW ПРАВИЛА

### commit-strategies.mdc
```yaml
---
description: "Стратегии коммитов для разных фаз разработки"
globs: ["**/CustomWorkflow/git-workflow/**", "**/commit/**"]
alwaysApply: false
---
# Стратегии Коммитов

## Фазовые коммиты
- **PLAN Phase**: Коммит планов и архитектуры
- **IMPLEMENT Phase**: Инкрементальные коммиты по фичам
- **QA Phase**: Коммиты исправлений и тестов
- **REFLECT Phase**: Коммит документации и рефлексии

## Правила коммитов
```bash
# Структура коммита
git commit -m "PHASE: Brief description - Detailed impact and scope"

# Примеры
git commit -m "IMPLEMENT: Add user authentication - Complete login/logout flow with JWT tokens"
git commit -m "QA: Fix memory leak in data processing - Resolved issue affecting large datasets"
git commit -m "REFLECT: Document performance optimizations - Added lessons learned and metrics"
```

## Применение в Memory Bank
- Автоматические коммиты после завершения фаз
- Связь коммитов с tasks.md статусами
- Сохранение контекста разработки
```

### backup-verification.mdc
```yaml
---
description: "Правила верификации резервных копий перед изменениями"
globs: ["**/CustomWorkflow/git-workflow/**", "**/backup/**"]
alwaysApply: false
---
# Верификация Резервных Копий

## Обязательные проверки перед изменениями
1. **Git статус чистый**: `git status` показывает clean working tree
2. **Последний коммит сохранен**: Все изменения зафиксированы
3. **Ветка актуальна**: Синхронизация с remote при необходимости
4. **Backup точка создана**: Тег или ветка для отката

## Процесс верификации
```bash
# Проверка статуса
git status

# Создание backup точки
git tag -a "backup-$(date +%Y%m%d-%H%M)" -m "Backup before rules integration"

# Создание backup ветки
git checkout -b "backup-rules-integration-$(date +%Y%m%d)"
git checkout main
```

## Применение в Memory Bank
- Автоматическая проверка в VAN Mode
- Создание backup точек перед крупными изменениями
- Интеграция с Cursor workaround процессом
```

---

## 🚀 ОБНОВЛЕННЫЙ ПЛАН РЕАЛИЗАЦИИ

### Этап 1: Подготовка (30 мин)
1. Анализ существующей структуры
2. Создание детального плана файлов
3. Подготовка шаблонов .mdc файлов

### Этап 2: Создание правил планирования (45 мин)
1. Создание planning/*.mdc файлов
2. Создание git-workflow/*.mdc файлов
3. Интеграция с PLAN Mode
4. Тестирование загрузки

### Этап 3: Создание правил реализации (60 мин)
1. Создание implementation/*.mdc файлов
2. Создание testing/*.mdc файлов (включая новые)
3. Интеграция с IMPLEMENT Mode

### Этап 4: Создание правил отладки и документирования (45 мин)
1. Создание debugging/*.mdc файлов
2. Создание documentation/*.mdc файлов
3. Интеграция с REFLECT/ARCHIVE Mode

### Этап 5: Workflow интеграция (30 мин)
1. Создание workflow/*.mdc файлов (включая qa-mode)
2. Обновление custom_modes файлов
3. Добавление fetch_rules вызовов

### Этап 6: Тестирование и верификация (30 мин)
1. Полное тестирование всех режимов
2. Проверка корректности загрузки правил
3. Финальная верификация

### Этап 7: Git Integration (15 мин) - НОВЫЙ
1. Фиксация всех изменений
2. Создание тегов версий
3. Документирование в changelog
4. Backup verification

**Общее время**: ~4.25 часа (было 4 часа)

---

## 📊 ОБНОВЛЕННЫЕ МЕТРИКИ УСПЕХА

### Количественные показатели:
- ✅ Все 37 .mdc файлов интегрированы (было 31)
- ✅ Все Bun-специфичные правила из TESTING_BUN.md добавлены
- ✅ Workflow из MY_WORKFLOW.md интегрирован в режимы
- ✅ Git workflow из changing_the_rules.md интегрирован
- ✅ Правила анализа больших тестовых наборов добавлены
- ✅ 100% правил имеют корректные метаданные
- ✅ 0 ошибок при загрузке правил

### Качественные показатели:
- ✅ AI автоматически применяет правила в соответствующих режимах
- ✅ Пользователь может легко добавлять новые правила
- ✅ Система остается производительной
- ✅ Правила не конфликтуют между собой
- ✅ Git workflow интегрирован в процесс разработки
- ✅ Большие тестовые наборы анализируются эффективно

---

## ✅ ОБНОВЛЕННЫЙ ЧЕКЛИСТ ГОТОВНОСТИ

### Перед началом:
- [ ] Git статус чистый
- [ ] Резервные копии созданы
- [ ] План детализирован
- [ ] Шаблоны подготовлены

### Во время реализации:
- [ ] Каждый .mdc файл имеет корректные метаданные
- [ ] Все ссылки проверены
- [ ] Glob паттерны корректны
- [ ] Интеграция с режимами работает
- [ ] Git workflow правила созданы
- [ ] Правила анализа тестов созданы

### После завершения:
- [ ] Все правила загружаются без ошибок
- [ ] Режимы работают с новыми правилами
- [ ] Git workflow интегрирован
- [ ] Анализ больших тестов работает
- [ ] Документация обновлена
- [ ] Изменения зафиксированы в git

---

**Статус**: 📋 ПЛАН ОБНОВЛЕН И ГОТОВ К РЕАЛИЗАЦИИ
**Следующий шаг**: Начать Phase 1 - Анализ и подготовка с учетом новых требований