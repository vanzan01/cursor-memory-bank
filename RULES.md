Отличная идея! Превращение твоих `DEVELOPMENT_RULES.md` (и сопутствующих `DEVELOPMENT_PROMPT_RULES.md`, `DEVELOPMENT_WORKFLOW_RULES.md`) в набор `.mdc` файлов, которые Memory Bank может подтягивать в нужный момент, — это именно то, для чего система и создавалась. Это позволит AI быть в курсе твоих специфических предпочтений и методологий.

Давай разобьем твои правила на логические `.mdc` файлы и разместим их в предполагаемой структуре. Я предлагаю создать новую папку внутри `.cursor/rules/isolation_rules/` (или, если ты хочешь их четко отделить от "системных" правил Memory Bank, то `.cursor/rules/custom_project_rules/`). Для примера, давай используем `.cursor/rules/isolation_rules/CustomWorkflow/`.

Вот список правил `.mdc`, которые мы можем создать, и как они будут интегрированы:

**Предлагаемая Структура Файлов:**

```
.cursor/rules/isolation_rules/
├── CustomWorkflow/
│   ├── custom-planning-rules.mdc
│   ├── custom-implementation-rules.mdc
│   ├── custom-testing-bun-rules.mdc
│   ├── custom-integration-rules.mdc
│   ├── custom-debugging-rules.mdc
│   ├── custom-documentation-rules.mdc
│   ├── custom-refactoring-rules.mdc
│   ├── custom-pr-checklist.mdc
│   └── custom-key-lessons.mdc  <-- Это, возможно, для REFLECT/ARCHIVE
└── ... (остальные системные папки и файлы Memory Bank)
```

Теперь содержимое для каждого файла `.mdc`:

---

**1. `.cursor/rules/isolation_rules/CustomWorkflow/custom-planning-rules.mdc`**

```mdc
---
description: Custom project planning rules based on B+ Tree project experience.
globs: ["**/custom-planning-rules.mdc", "**/planning/**"]
alwaysApply: false
---
# Custom Project Planning Rules

## 1. Фазовый подход к разработке (Rule #1 из DEVELOPMENT_RULES.md)
- Разработка должна быть разбита на четкие, последовательные фазы.
- Каждая фаза должна иметь определенные цели и критерии завершения.
- Пример фазового плана:
  ```markdown
  ## Phase 1: Stabilize Core & Fix Bugs ✅
  1. Fix critical memory/performance issue
  2. Implement basic functionality with CoW
  3. Fix parent-child relationship corruption
  4. Implement commit() logic

  ## Phase 2: Complete Transaction Logic ✅
  5. Implement transactional operations
  6. Implement 2PC API
  7. Add complex scenarios support

  ## Phase 3: Fix Advanced Operations ✅
  8. Fix CoW Node Operations
  9. Handle edge cases and boundary conditions
  10. Implement conflict detection

  ## Phase 4: Refactor & Test ✅
  11. Write comprehensive tests
  12. Implement garbage collection
  13. Performance optimization
  ```

## 2. Документирование прогресса планирования (Rule #2 из DEVELOPMENT_RULES.md)
- Текущие размышления и идеи по планированию записываются в `activeContext.md` или в описание задачи в `tasks.md`.
- Удачные идеи помечаются ✅, неудачные идеи ❌.
- Идеи не удаляются, чтобы не возвращаться к ним.
- После успешного планирования этапа, план фиксируется в `tasks.md`.

## 3. Приоритизация проблем и задач (Rule #3 из DEVELOPMENT_RULES.md)
- Используй следующую систему приоритетов:
  ```typescript
  enum ProblemPriority {
    CRITICAL = 'critical',    // Блокирует основной функционал
    HIGH = 'high',           // Влияет на производительность или важный функционал
    MEDIUM = 'medium',       // Улучшения UX, некритичные баги
    LOW = 'low'             // Nice to have, мелкие доработки
  }
  ```
- В `PLAN Mode` необходимо явно определять приоритет для основных задач и подзадач.

## 4. Изолированное проектирование фаз (Rule #17 из DEVELOPMENT_RULES.md)
- По возможности, проектируй фазы и крупные компоненты изолированно.
- Определяй четкие интерфейсы между изолированными частями.
- Это упростит параллельную разработку (если применимо) и тестирование.
```

**Интеграция:** Этот файл должен загружаться в `PLAN Mode`. В `custom_modes/plan_instructions.md` нужно добавить вызов `fetch_rules` для этого файла.

---

**2. `.cursor/rules/isolation_rules/CustomWorkflow/custom-implementation-rules.mdc`**

```mdc
---
description: Custom project implementation rules.
globs: ["**/custom-implementation-rules.mdc", "**/implementation/**", "**/coding/**"]
alwaysApply: false
---
# Custom Project Implementation Rules

## 1. Избегание заглушек в продакшене (Rule #5 из DEVELOPMENT_RULES.md)
- Если создается заглушка (stub), немедленно создай задачу в `tasks.md` на ее замену полноценной реализацией.
- Тесты должны проверять работу с реальной реализацией, а не с заглушками.
- Перед завершением этапа IMPLEMENT, убедись, что все временные заглушки заменены.
  ```typescript
  // ❌ НЕПРАВИЛЬНО: Заглушки остаются в финальном коде
  function merge_with_left_cow<T, K extends ValueType>(/* ... */) {
    // TODO: Implement real merge logic (ЗАДАЧА НА ЗАМЕНУ!)
    return originalNode // Заглушка
  }
  ```

## 2. Robust поиск и навигация (Rule #6 из DEVELOPMENT_RULES.md)
- При реализации функций поиска или навигации по структурам данных (особенно в CoW системах), предусматривай fallback-механизмы.
- Пример: поиск сначала по working copy ID, затем по original ID.
  ```typescript
  function findChildIndex<T, K extends ValueType>(
    parent: Node<T, K>,
    childOriginalId: number,
    txCtx: TransactionContext<T, K>
  ): number {
    // Сначала ищем по working copy ID
    // ...
    // Fallback: ищем по original ID
    // ...
    throw new Error(`Child not found`)
  }
  ```

## 3. Координация между системами (Rule #7 из DEVELOPMENT_RULES.md)
- Для сложных взаимодействий между частями системы используй явные механизмы координации (флаги, события, очереди).
- Избегай неявных зависимостей и побочных эффектов, которые трудно отследить.
- Пример: использование флага `_skipParentSeparatorUpdate` для предотвращения двойного обновления.
  ```typescript
  function borrow_from_left_cow<T, K extends ValueType>(/* ... */) {
    (fNode as any)._skipParentSeparatorUpdate = true;
    // ...
    updateParentSeparators(/* ... */); // Ручное обновление
    return result;
  }
  ```
```

**Интеграция:** Этот файл должен загружаться в `IMPLEMENT Mode`. В `custom_modes/implement_instructions.md` нужно добавить вызов `fetch_rules`.

---

**3. `.cursor/rules/isolation_rules/CustomWorkflow/custom-testing-bun-rules.mdc`**

```mdc
---
description: Custom project testing rules with Bun.
globs: ["**/custom-testing-bun-rules.mdc", "**/testing/**", "**/bun/**"]
alwaysApply: false
---
# Custom Project Testing Rules (with Bun)

## General Testing Principles
- **Проверка зависимостей тестов (Rule #4 DEVELOPMENT_RULES.md):** При проверке тестов учитывай, что тесты могут быть зависимыми друг от друга. Строй карту зависимостей и последовательности выполнения тестов. Новые изменения не должны ломать другие тесты.
- **Обязательное тестирование каждой фичи (Rule #10 DEVELOPMENT_RULES.md):** Нет фичи без тестов. Каждая новая функция должна иметь соответствующие тесты.
- **Проверка покрытия функционала на каждом этапе (Rule #11 DEVELOPMENT_RULES.md):** В конце каждого значимого этапа реализации проверяй покрытие тестами. Используй `bun test --coverage`. Определи минимально допустимый процент покрытия для критических функций (например, 95%).
- **Тестирование edge cases (Rule #12 DEVELOPMENT_RULES.md):** Покрывай все разумные граничные случаи (пустые узлы, максимальная емкость, дубликаты ключей и т.д.).

## Bun Test Runner Specifics
- **Используй `bun test`** для всех запусков тестов.
- **Высокогранулированные тесты (Rule #8 DEVELOPMENT_RULES.md):** Группируй тесты по функциональности с помощью `describe` блоков. Каждый `it` (или `test`) должен проверять один конкретный аспект.
- **Изоляция контекста между тестами (Rule #9 DEVELOPMENT_RULES.md):** Используй lifecycle hooks (`beforeEach`, `afterEach`, `beforeAll`, `afterAll`) для настройки и очистки состояния перед/после каждого теста или группы тестов. Это критично для предотвращения взаимовлияния тестов.
- **Тестирование производительности (Rule #13 DEVELOPMENT_RULES.md):** Используй Bun для быстрых тестов производительности. Измеряй время выполнения критических операций.
  ```typescript
  it('should handle large datasets efficiently', () => {
    const startTime = performance.now();
    // ... операция ...
    const duration = performance.now() - startTime;
    expect(duration).toBeLessThan(1000); // Пример
  });
  ```
- **Высокоточное измерение времени (Rule #14 DEVELOPMENT_RULES.md):** Всегда используй `performance.now()` вместо `Date.now()` для точных измерений времени в тестах.
- **Устойчивая генерация ID (Rule #15 DEVELOPMENT_RULES.md):** Если в тестах или коде нужна генерация ID, используй устойчивые к коллизиям методы (например, UUID или комбинацию timestamp + счетчик + random). Тестируй генераторы ID на коллизии под нагрузкой.
- **Тестирование временных коллизий (Rule #16 DEVELOPMENT_RULES.md):** Проверяй, как система обрабатывает множество операций, происходящих почти одновременно (в пределах одной миллисекунды).

## Bun Test Features to Utilize (из DEVELOPMENT_PROMPT_RULES.md)
- **Lifecycle hooks:** `beforeAll`, `beforeEach`, `afterEach`, `afterAll`
- **Mocking:** `mock()`, `jest.fn()`, `spyOn()`, `mock.module()`
- **Conditional tests:** `test.if()`, `test.skipIf()`, `test.todoIf()`
- **Focused testing:** `test.only()`, `describe.only()` (для отладки, удалять перед коммитом)
- **Known failures:** `test.failing()` для отслеживания известных багов
- **Async validation:** `expect.assertions()`, `expect.hasAssertions()`
- **Data-driven tests:** `test.each()`, `describe.each()`
- **Snapshot testing:** `toMatchSnapshot()`, `toMatchInlineSnapshot()`

## Test Organization and Configuration (из DEVELOPMENT_WORKFLOW_RULES.md)
- **Структура файлов тестов:**
  ```
  src/
    feature/
      core.ts
      core.test.ts          # Unit tests
      core.integration.ts   # Integration tests
      core.performance.ts   # Performance tests
  __tests__/
    setup.ts             # Global test setup
    mocks/               # Shared mocks
  ```
- **`bunfig.toml` для конфигурации:**
  ```toml
  [test]
  preload = ["./src/__tests__/setup.ts"] # Пример
  timeout = 10000
  coverage = true
  ```

## Commands for Testing
- `bun test`: запуск всех тестов
- `bun test --watch`: режим наблюдения
- `bun test <pattern>`: фильтр по имени/пути
- `bun test --coverage`: отчет о покрытии
- `bun test --update-snapshots`: обновление снапшотов
- `bun test --bail`: остановка на первой ошибке
```

**Интеграция:** Этот файл должен загружаться в `IMPLEMENT Mode` (когда пишутся тесты) и, возможно, в `QA Mode` (если там проводится анализ покрытия или запуск специфичных тестов). В `custom_modes/implement_instructions.md` и `custom_modes/qa_instructions.md` (если QA будет отдельным режимом) добавить `fetch_rules`.

---

**4. `.cursor/rules/isolation_rules/CustomWorkflow/custom-integration-rules.mdc`**

```mdc
---
description: Custom project integration rules.
globs: ["**/custom-integration-rules.mdc", "**/integration/**"]
alwaysApply: false
---
# Custom Project Integration Rules

## 1. Планирование интеграционных шагов (Rule #18 из DEVELOPMENT_RULES.md)
- Интеграция ранее изолированно разработанных компонентов должна быть явно спланирована.
- В `PLAN Mode` для сложных фич определяй этапы интеграции.
- Каждый шаг интеграции должен иметь:
  - Описание
  - Зависимости от других компонентов/шагов
  - Критерии валидации
  - Примерную оценку времени
- Пример структуры для шага интеграции:
  ```typescript
  interface IntegrationStep {
    step: number;
    description: string;
    dependencies: string[];
    validation: string[]; // Что должно быть проверено
    estimatedTime: string;
  }
  ```

## 2. Тестирование интеграционных точек (Rule #19 из DEVELOPMENT_RULES.md)
- Создавай отдельные наборы тестов, проверяющие взаимодействие между компонентами/модулями.
- Эти тесты должны выполняться после успешного прохождения unit-тестов для каждого из интегрируемых компонентов.
- Фокусируйся на проверке интерфейсов, потоков данных и контрактов между компонентами.
  ```typescript
  // Пример integration test
  describe('Integration Tests', () => {
    describe('Transaction-Tree Integration', () => {
      it('should maintain tree invariants during transactions', () => {
        // Тестируем интеграцию между деревом и транзакциями
      });
    });
  });
  ```

## 3. Документирование интеграционных зависимостей (Rule #20 из DEVELOPMENT_RULES.md)
- Явно документируй зависимости между компонентами, которые интегрируются.
- Описывай:
  - Используемые интерфейсы.
  - Ожидаемые данные и их формат.
  - Потенциальные конфликты и стратегии их разрешения.
- Эта информация может храниться в `systemPatterns.md` для общих паттернов или в `tasks.md` для конкретной задачи.
  ```markdown
  # Integration Dependency Map (Пример)

  ### Core Tree → Transaction System
  - **Interface:** TreeOperationInterface
  - **Dependencies:** Node access, tree traversal
  - **Potential Conflicts:** Direct node modification vs CoW
  - **Resolution Strategy:** Wrapper pattern
  ```
```

**Интеграция:** Частично в `PLAN Mode` (планирование) и в `IMPLEMENT Mode` (реализация и тестирование интеграции). Добавить `fetch_rules` в `custom_modes/plan_instructions.md` и `custom_modes/implement_instructions.md`.

---

**5. `.cursor/rules/isolation_rules/CustomWorkflow/custom-debugging-rules.mdc`**

```mdc
---
description: Custom project debugging rules.
globs: ["**/custom-debugging-rules.mdc", "**/debug/**"]
alwaysApply: false
---
# Custom Project Debugging Rules

## 1. Трассировка перед исправлением (Rule #21 из DEVELOPMENT_RULES.md)
- Перед тем как начать отладку и исправлять сложные тесты или баги:
  1. Выполни трассировку (пошаговое выполнение) вручную или с помощью логов, записывая ожидаемые и фактические результаты на каждом шаге.
  2. Отметь шаг, на котором возникает расхождение/ошибка.
  3. Сохрани этот лог трассировки в отдельный markdown-файл (например, `debug_trace_yyyy-mm-dd_issue.md`). Ссылку на него можно добавить в `progress.md`.
  4. Только после этого приступай к отладке в коде и исправлению.
- Это помогает лучше понять проблему до внесения изменений.

## 2. Анализ больших тестовых наборов по группам (Rule #21.1 из DEVELOPMENT_RULES.md)
- При большом количестве падающих тестов, не пытайся исправлять их по одному.
- **Системный подход:**
  1. `bun test > test_output.log 2>&1` (Захват полного вывода).
  2. `grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq` (Извлечение уникальных групп тестов, где `>` - разделитель в `describe` блоках).
  3. `bun test -t "Имя Группы"` (Запуск тестов по группам).
  4. `bun test -t "Имя Группы > Имя Подгруппы"` (Детализация при необходимости).
  5. Используй `grep` для анализа `test_output.log` (поиск паттернов ошибок, контекст вокруг ошибок).

## 3. Детальное логирование с Bun (Rule #22 из DEVELOPMENT_RULES.md)
- В сложных участках кода добавляй подробное логирование для отслеживания состояния и потока выполнения.
- Используй префиксы в логах для легкой фильтрации (например, `[REMOVE_TX]`).
- Для тестов можно использовать `spyOn(console, 'log')` из Bun для проверки, что логи выводятся как ожидается.
- Команды для работы с логами:
  - `bun test --verbose`
  - `bun test my_test.test.ts > logs.txt 2>&1`
  - `grep "MY_PREFIX" logs.txt`

## 4. Валидация инвариантов (Rule #23 из DEVELOPMENT_RULES.md)
- Для сложных структур данных (как B+ Tree) создавай функции, проверяющие инварианты системы (например, корректность связей parent-child, порядок ключей, заполненность узлов).
- Вызывай эти функции валидации после ключевых операций во время отладки или даже в тестах, чтобы быстро выявлять нарушения состояния.
  ```typescript
  function validateTreeInvariants<T, K extends ValueType>(tree: BPlusTree<T, K>, operation: string): void {
    console.log(`[VALIDATION] Checking invariants after ${operation}`);
    // ... проверки ...
    if (!valid) throw new Error(`Invariant failed after ${operation}`);
    console.log(`[VALIDATION] All invariants valid after ${operation}`);
  }
  ```
```

**Интеграция:** Этот файл должен загружаться в `IMPLEMENT Mode`, когда происходит отладка. В `custom_modes/implement_instructions.md` добавить `fetch_rules`.

---

**6. `.cursor/rules/isolation_rules/CustomWorkflow/custom-documentation-rules.mdc`**

```mdc
---
description: Custom project documentation rules.
globs: ["**/custom-documentation-rules.mdc", "**/documentation/**", "**/docs/**"]
alwaysApply: false
---
# Custom Project Documentation Rules

## 1. Документирование решений и исправлений (Rule #24 из DEVELOPMENT_RULES.md)
- Каждая решенная проблема или значимое исправление бага должно быть задокументировано.
- Используй формат, похожий на:
  ```markdown
  ## ✅ ИСПРАВЛЕНИЕ #N: Название проблемы
  - **Проблема:** Краткое описание.
  - **Решение:** Описание технического решения.
  - **Техническая реализация:** (опционально) Ключевые фрагменты кода или алгоритм.
  - **Результат:** Что изменилось после исправления.
  - **Файлы:** Какие файлы были затронуты.
  ```
- Эта информация может быть частью `progress.md` или `reflection.md`.

## 2. Ведение статистики (Rule #25 из DEVELOPMENT_RULES.md)
- Отслеживай количественный прогресс, особенно для крупных этапов или всего проекта.
- Пример статистики (может быть в `reflection.md` или `README.md` проекта):
  ```markdown
  **ИТОГОВАЯ СТАТИСТИКА УСПЕХА (Phase X):**
  - ✅ ВСЕ X ТЕСТОВ ПРОХОДЯТ (Y% success rate)
  - ✅ [Фича A]: Полностью реализована
  - ✅ [Фича B]: Частично реализована (Z%)
  - 🚧 [Проблема C]: В процессе решения
  ```

## 3. Создание примеров использования (Rule #26 из DEVELOPMENT_RULES.md)
- Для каждой значимой функции или модуля создавай рабочие примеры использования.
- Примеры должны быть исполняемыми (если это код) и демонстрировать реальные сценарии.
- Это помогает как в документации, так и в тестировании (примеры могут быть основой для интеграционных тестов).
- Примеры могут размещаться в специальной папке `examples/` или в документации.
```

**Интеграция:** Этот файл актуален для `IMPLEMENT Mode` (когда документируются конкретные исправления по ходу), но в основном для `REFLECT/ARCHIVE Mode` (для итоговой документации). Добавить `fetch_rules` в `custom_modes/implement_instructions.md` и `custom_modes/reflect_archive_instructions.md`.

---

**7. `.cursor/rules/isolation_rules/CustomWorkflow/custom-refactoring-rules.mdc`**

```mdc
---
description: Custom project refactoring rules.
globs: ["**/custom-refactoring-rules.mdc", "**/refactor/**"]
alwaysApply: false
---
# Custom Project Refactoring Rules

## 1. Постепенный рефакторинг (Rule #27 из DEVELOPMENT_RULES.md)
- Проводи рефакторинг небольшими, контролируемыми шагами, а не переписывай все сразу.
- **Цикл рефакторинга для одной функции/модуля:**
  1. Создай новую, улучшенную версию функции/модуля (например, с суффиксом `_v2`).
  2. Напиши полный набор тестов для этой новой версии.
  3. После того как все тесты для новой версии проходят, постепенно заменяй вызовы старой версии на новую в коде.
  4. Убедись, что все тесты проекта по-прежнему проходят.
  5. Удали старую версию функции/модуля.

## 2. Сохранение обратной совместимости (Rule #28 из DEVELOPMENT_RULES.md)
- При рефакторинге публичных API старайся сохранять обратную совместимость, если это возможно.
- Если API изменяется, предоставь старый API с пометкой `@deprecated` и логированием предупреждения. Укажи, какой новый API следует использовать.
- Предоставь четкий план миграции для пользователей старого API.
  ```typescript
  /** @deprecated Use newShinyFunction() instead. Will be removed in vX.Y.Z. */
  function oldFunction() {
    console.warn('oldFunction() is deprecated, use newShinyFunction()');
    return newShinyFunction(/* adapt parameters if needed */);
  }
  ```

## 3. Метрики качества кода (Rule #29 из DEVELOPMENT_RULES.md)
- Отслеживай ключевые метрики качества кода до и после рефакторинга:
  - **Test Coverage:** Должно остаться на прежнем уровне или улучшиться.
  - **Cyclomatic Complexity:** Старайся уменьшать для рефакторенных функций (цель < 10-15).
  - **Lines of Code (LOC):** Рефакторинг часто приводит к уменьшению LOC за счет устранения дублирования.
  - **Technical Debt:** Уменьшение количества TODO/FIXME комментариев.
  - **Performance Regression:** Убедись, что рефакторинг не привел к снижению производительности (запускай тесты производительности).
- Фиксируй эти метрики в `progress.md` или `reflection.md` для задачи рефакторинга.
```

**Интеграция:** Этот файл загружается в `IMPLEMENT Mode`, если текущая задача включает рефакторинг. Добавить `fetch_rules` в `custom_modes/implement_instructions.md`.

---

**8. `.cursor/rules/isolation_rules/CustomWorkflow/custom-pr-checklist.mdc`**

```mdc
---
description: Custom project Pull Request checklist.
globs: ["**/custom-pr-checklist.mdc", "**/pullrequest/**", "**/review/**"]
alwaysApply: false
---
# Custom Project Pull Request Checklist (на основе Bun)

## Перед коммитом и созданием PR:
- [ ] Все тесты проходят локально: `bun test`
- [ ] Добавлены новые тесты для новой функциональности, использующие Bun matchers и API.
- [ ] Существующие тесты обновлены, если логика изменилась.
- [ ] Обновлена соответствующая документация (README, JSDoc, комментарии в коде, `progress.md`, `tasks.md`).
- [ ] Проверена производительность (если применимо): `bun test --timeout 30000 Performance` (или аналогичные команды для твоих тестов производительности).
- [ ] Нет известных memory leaks (используй `test.failing` для отслеживания известных, но еще не исправленных проблем).
- [ ] Код отформатирован согласно стилю проекта (например, с помощью Prettier, если используется).
- [ ] Используются lifecycle hooks (`beforeEach`, `afterEach` и т.д.) для корректной настройки и очистки тестового окружения.
- [ ] Snapshot тесты (если используются) обновлены: `bun test --update-snapshots`.
- [ ] Покрытие кода проверено и соответствует требованиям проекта: `bun test --coverage`.
- [ ] Убраны временные/отладочные `console.log` и `test.only()`, `describe.only()`.
- [ ] Название коммита и PR соответствует принятым в проекте конвенциям.
- [ ] В описании PR есть ссылка на соответствующую задачу в `tasks.md` (если применимо).
```

**Интеграция:** Этот файл может быть загружен в конце `IMPLEMENT Mode` или в начале `REFLECT/ARCHIVE Mode` как напоминание перед фиксацией изменений. Добавить `fetch_rules` в `custom_modes/implement_instructions.md` или `custom_modes/reflect_archive_instructions.md`.

---

**9. `.cursor/rules/isolation_rules/CustomWorkflow/custom-key-lessons.mdc`**

```mdc
---
description: Key lessons learned from B+ Tree project, applicable to general development.
globs: ["**/custom-key-lessons.mdc", "**/lessons/**", "**/retrospective/**"]
alwaysApply: false
---
# Key Development Lessons Learned (из B+ Tree проекта)

## 1. Сложность растет экспоненциально
- **Наблюдение:** Простые изменения могут сломать множество тестов в сложных системах.
- **Принцип Memory Bank:** Используй фазовый подход (VAN, PLAN, CREATIVE, IMPLEMENT) для управления сложностью. В `PLAN` тщательно анализируй зависимости. В `IMPLEMENT` проверяй влияние на существующий функционал (`bun test` после каждого значимого изменения).

## 2. Тестирование - это инвестиция
- **Наблюдение:** Высокогранулированные тесты и тесты на edge cases помогают быстро находить проблемы и выявлять фундаментальные ошибки архитектуры. Тесты производительности предотвращают критические проблемы.
- **Принцип Memory Bank:** В `IMPLEMENT Mode` активно используй AI для генерации тестов по правилам из `custom-testing-bun-rules.mdc`. В `REFLECT Mode` анализируй, достаточно ли было тестов.

## 3. Документирование экономит время
- **Наблюдение:** Подробные логи (особенно при отладке), документирование принятых решений и примеры использования значительно ускоряют разработку и онбординг.
- **Принцип Memory Bank:** В `IMPLEMENT Mode` документируй прогресс в `progress.md`. В `REFLECT/ARCHIVE Mode` используй AI для создания `reflection.md` и архивных документов, включая примеры (согласно `custom-documentation-rules.mdc`).

## 4. Координация между системами критична
- **Наблюдение:** В сложных системах нужны явные механизмы координации.
- **Принцип Memory Bank:** В `PLAN Mode` идентифицируй точки интеграции. В `CREATIVE Mode` проектируй механизмы координации. В `IMPLEMENT Mode` реализуй их (см. `custom-implementation-rules.mdc` и `custom-integration-rules.mdc`).

## 5. Производительность важна с самого начала
- **Наблюдение:** Проблемы с производительностью (например, memory leaks, неэффективные алгоритмы) могут заблокировать разработку.
- **Принцип Memory Bank:** В `CREATIVE Mode` рассматривай аспекты производительности при выборе решений. В `IMPLEMENT Mode` регулярно запускай тесты производительности (см. `custom-testing-bun-rules.mdc`).

## 6. Bun-специфичные уроки
- **Watch mode (`--watch`)** ускоряет TDD.
- **Module mocking** упрощает тестирование сложных зависимостей.
- **Conditional tests** помогают с кроссплатформенной разработкой.
- **Snapshot testing** хорош для сложных структур данных.
- **Parametrized tests (`test.each`)** сокращают дублирование кода.
- **Анализ вывода тестов (`grep`, `cut`, `sort`, `uniq`)** критичен для больших наборов тестов.
- **Принцип Memory Bank:** Все эти возможности Bun должны активно использоваться в `IMPLEMENT Mode` при написании и запуске тестов (AI должен помогать с этим, основываясь на `custom-testing-bun-rules.mdc` и `custom-debugging-rules.mdc`).
```

**Интеграция:** Этот файл очень полезен для `REFLECT/ARCHIVE Mode` при анализе проделанной работы и извлечении уроков. Также может быть полезен в `PLAN Mode` для напоминания об общих принципах. Добавить `fetch_rules` в `custom_modes/reflect_archive_instructions.md` и, возможно, в `custom_modes/plan_instructions.md`.

---

**Касательно `DEVELOPMENT_PROMPT_RULES.md` и `DEVELOPMENT_WORKFLOW_RULES.md`:**

*   Многие правила из них уже интегрированы в созданные выше `.mdc` файлы (особенно в `custom-testing-bun-rules.mdc` и `custom-debugging-rules.mdc`).
*   **`DEVELOPMENT_PROMPT_RULES.md`:** Часть "Documentation Protocol" и "Implementation Checklist" хорошо ложится в инструкции для `IMPLEMENT Mode` (`custom_modes/implement_instructions.md`). Часть "Quality Gates" – в `QA Mode` (если он будет) или в завершающие шаги `IMPLEMENT Mode`.
*   **`DEVELOPMENT_WORKFLOW_RULES.md`:** "Core Principles" и "Implementation Flow" могут быть частью общего `main-optimized.mdc` или отдельного `core-workflow-principles.mdc`. "File Organization" и "Test File Structure" хорошо подходят для `custom-testing-bun-rules.mdc`. "Large Test Suite Analysis" уже в `custom-debugging-rules.mdc`.

**Следующие шаги:**

1.  **Создать эти файлы `.mdc`** в указанной структуре с предложенным содержимым.
2.  **Обновить файлы инструкций для Custom Modes** (`custom_modes/*.md`):
    *   В каждый `*_instructions.md` файл, соответствующий режиму, добавь шаги для загрузки релевантных `custom-*.mdc` правил через `fetch_rules`.
    *   Например, в `custom_modes/plan_instructions.md` в секцию "IMPLEMENTATION STEPS" добавить:
        ```
        ### Step X: LOAD CUSTOM PLANNING RULES
        fetch_rules({
          rule_names: [".cursor/rules/isolation_rules/CustomWorkflow/custom-planning-rules.mdc"]
        })
        ```
        И так далее для каждого режима и релевантного ему набора кастомных правил.
3.  **Тестирование:** Попробовать поработать с AI в разных режимах и посмотреть, подтягивает ли он эти правила и следует ли им. Возможно, потребуется доработка промптов в `*_instructions.md` чтобы AI активнее использовал загруженные кастомные правила.

Этот подход позволит тебе гибко управлять тем, какие из твоих наработанных правил будут активны в каком режиме, и постепенно расширять или изменять их.