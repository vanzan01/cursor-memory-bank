# Memory Bank: System Patterns

## Architecture Overview
File-based Memory Bank system для Cursor IDE с поддержкой многоуровневых задач и интегрированными правилами разработки

## Core Patterns

### 1. Memory Bank Structure
```
memory-bank/
├── projectbrief.md      # Основная информация о проекте
├── activeContext.md     # Текущий контекст и состояние
├── systemPatterns.md    # Архитектурные паттерны (этот файл)
├── techContext.md       # Технический контекст
├── progress.md          # Отслеживание прогресса (РАСШИРЕННЫЙ)
├── tasks.md            # Активные задачи
├── creative/           # Документы творческой фазы
├── reflection/         # Документы рефлексии
├── archive/           # Архив завершенных задач
└── development/       # НОВАЯ ДИРЕКТОРИЯ для правил разработки
    ├── phase-tracking.md    # Отслеживание фаз разработки
    ├── test-reports.md      # Отчеты по тестированию
    ├── debug-traces.md      # Трассировки отладки
    └── integration-maps.md  # Карты интеграции компонентов
```

### 2. Mode System (ОБНОВЛЕННЫЙ)
- **VAN**: Инициализация и определение сложности + Platform Detection
- **PLAN**: Планирование задач + Фазовый подход + Изолированное проектирование
- **CREATIVE**: Принятие дизайнерских решений + Архитектурное планирование
- **IMPLEMENT**: Реализация кода + Integrated Testing + Debugging + Refactoring
- **QA**: Техническая валидация + Comprehensive Testing + Performance Analysis
- **REFLECT**: Рефлексия и анализ + Documentation + Lessons Learned
- **ARCHIVE**: Архивирование результатов + Statistics + Examples

### 3. Complexity Levels (РАСШИРЕННЫЙ)
- **Level 1**: Quick Bug Fix (VAN → IMPLEMENT с встроенным тестированием)
- **Level 2**: Simple Enhancement (VAN → PLAN → CREATIVE → IMPLEMENT → QA)
- **Level 3**: Intermediate Feature (полный цикл + Integration Planning)
- **Level 4**: Complex System (полный цикл + Phased Implementation + Advanced Testing)

### 4. Development Rules Integration
- **Фазовый подход**: Интегрирован в PLAN режим
- **Тестирование**: Встроено в IMPLEMENT и QA режимы
- **Отладка**: Специальные процедуры в IMPLEMENT режиме
- **Интеграция**: Планирование в PLAN, выполнение в IMPLEMENT
- **Рефакторинг**: Специальные workflow в IMPLEMENT режиме
- **Документирование**: Расширенные возможности во всех режимах

### 5. Integration Patterns (НОВОЕ)
- Интеграция с .cursor/rules через VAN.RULES
- Синхронизация с существующими правилами
- Автоматическое обновление контекста
- **Фазовое планирование**: Изолированное проектирование → Интеграция
- **Test-Driven Development**: Bun-based testing workflow
- **Debugging Methodology**: Systematic trace → log → debug → fix
- **Quality Assurance**: Multi-level validation and performance testing

## Current Implementation Status
- [x] Basic Memory Bank structure
- [x] Core file creation
- [x] Mode transition logic
- [x] Complexity determination
- [ ] **Development Rules Integration** (В ПРОЦЕССЕ)
- [ ] **Extended Progress Tracking** (В ПРОЦЕССЕ)
- [ ] **Comprehensive Testing Framework** (В ПРОЦЕССЕ)
- [ ] **Advanced Debugging Support** (В ПРОЦЕССЕ)

## Development Rules Categories

### Category A: Planning & Organization (Rules #1-3)
- **Rule #1**: Фазовый подход к разработке
- **Rule #2**: Документирование прогресса с ✅/❌ маркерами
- **Rule #3**: Приоритизация проблем (CRITICAL → HIGH → MEDIUM → LOW)

### Category B: Implementation & Quality (Rules #4-7)
- **Rule #4**: Проверка зависимостей тестов
- **Rule #5**: Избегание заглушек в продакшене
- **Rule #6**: Robust поиск и навигация
- **Rule #7**: Координация между системами

### Category C: Testing & Validation (Rules #8-16)
- **Rule #8**: Высокогранулированные тесты
- **Rule #9**: Изоляция контекста между тестами
- **Rule #10**: Обязательное тестирование каждой фичи
- **Rule #11**: Проверка покрытия функционала на каждом этапе
- **Rule #12**: Тестирование edge cases
- **Rule #13**: Тестирование производительности
- **Rule #14**: Высокоточное измерение времени
- **Rule #15**: Устойчивая генерация ID
- **Rule #16**: Тестирование временных коллизий

### Category D: Integration & Architecture (Rules #17-20)
- **Rule #17**: Изолированное проектирование фаз
- **Rule #18**: Планирование интеграционных шагов
- **Rule #19**: Тестирование интеграционных точек
- **Rule #20**: Документирование интеграционных зависимостей

### Category E: Debugging & Analysis (Rules #21-23)
- **Rule #21**: Трассировка перед исправлением
- **Rule #22**: Детальное логирование
- **Rule #23**: Валидация инвариантов

### Category F: Documentation & Knowledge (Rules #24-26)
- **Rule #24**: Документирование решений
- **Rule #25**: Ведение статистики
- **Rule #26**: Создание примеров использования

### Category G: Refactoring & Maintenance (Rules #27-29)
- **Rule #27**: Постепенный рефакторинг
- **Rule #28**: Сохранение обратной совместимости
- **Rule #29**: Метрики качества кода