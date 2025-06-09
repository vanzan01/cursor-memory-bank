# Правила разработки на основе опыта B+ Tree проекта

## 📋 Оглавление

- [Правила планирования](#-правила-планирования)
- [Правила реализации](#-правила-реализации)
- [Правила тестирования](#-правила-тестирования)
- [Правила отладки](#-правила-отладки)
- [Правила документирования](#-правила-документирования)
- [Правила рефакторинга](#-правила-рефакторинга)

---

## 🎯 Правила планирования

### 1. **Фазовый подход к разработке**
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

### 2. **Документирование прогресса**
```markdown
# Rules для отслеживания прогресса

- Текущие размышления и идеи записывай в implementation файл
- Удачные идеи помечай ✅, неудачные идеи помечай ❌
- Идеи не удаляй, чтобы не возвращаться к ним в будущих сессиях
- После успешного этапа фиксируй изменения и переходи к следующему
```

### 3. **Приоритизация проблем**
```typescript
// ✅ ПРАВИЛЬНО: Решаем критические проблемы первыми
enum ProblemPriority {
  CRITICAL = 'critical',    // Блокирует основной функционал
  HIGH = 'high',           // Влияет на производительность
  MEDIUM = 'medium',       // Улучшения UX
  LOW = 'low'             // Nice to have
}

// Пример приоритизации из проекта:
// CRITICAL: RangeError: Out of memory в transactional remove
// HIGH: Parent-child relationship corruption в CoW
// MEDIUM: Улучшение производительности merge операций
// LOW: Дополнительные utility функции
```

---

## 🔧 Правила реализации

### 4. **Проверка зависимостей тестов**
```typescript
// ✅ ПРАВИЛЬНО: Проверяем что новые изменения не ломают другие тесты
function validateTestDependencies() {
  // При проверке тестов учитывай, что тесты могут быть зависимыми друг от друга
  // Чтобы не ломать один тест, не ломай другой
  // Строй карту зависимостей и последовательности выполнения тестов
}

// Пример из проекта:
// Исправление merge функций сломало тесты borrow операций
// Потребовалось координировать обновления separator keys
```

### 5. **Избегание заглушек в продакшене**
```typescript
// ❌ НЕПРАВИЛЬНО: Заглушки остаются в финальном коде
function merge_with_left_cow<T, K extends ValueType>(/* ... */) {
  // TODO: Implement real merge logic
  return originalNode // Заглушка
}

// ✅ ПРАВИЛЬНО: Полная реализация
function merge_with_left_cow<T, K extends ValueType>(/* ... */) {
  // Реальная логика merge с CoW
  const workingCopy = Node.forceCopy(originalNode, transactionContext)
  // ... полная реализация
  return workingCopy
}

// Правило: Проверяй что тесты обращаются к новым функциям,
// а не используют заглушки для прохождения
```

### 6. **Robust поиск и навигация**
```typescript
// ✅ ПРАВИЛЬНО: Robust поиск с fallback
function findChildIndex<T, K extends ValueType>(
  parent: Node<T, K>,
  childOriginalId: number,
  txCtx: TransactionContext<T, K>
): number {
  // Сначала ищем по working copy ID
  const workingChild = txCtx.workingNodes.get(childOriginalId)
  if (workingChild) {
    const workingIndex = parent.pointers.indexOf(workingChild.id)
    if (workingIndex !== -1) return workingIndex
  }

  // Fallback: ищем по original ID
  const originalIndex = parent.pointers.indexOf(childOriginalId)
  if (originalIndex !== -1) return originalIndex

  throw new Error(`Child ${childOriginalId} not found in parent ${parent.id}`)
}

// Урок из проекта: Простой поиск по ID часто не работает в CoW системах
```

### 7. **Координация между системами**
```typescript
// ✅ ПРАВИЛЬНО: Флаговая система для координации
function borrow_from_left_cow<T, K extends ValueType>(/* ... */) {
  // Устанавливаем флаг чтобы избежать двойного обновления
  (fNode as any)._skipParentSeparatorUpdate = true
  (fLeftSibling as any)._skipParentSeparatorUpdate = true

  // Выполняем операцию
  const result = performBorrow(/* ... */)

  // Ручное обновление separator keys
  updateParentSeparators(/* ... */)

  return result
}

// Урок: В сложных системах нужна координация между автоматическими и ручными операциями
```

---

## 🧪 Правила тестирования с Bun

### 8. **Высокогранулированные тесты с Bun**
```typescript
// ✅ ПРАВИЛЬНО: Используй Bun test для быстрого выполнения тестов
import { describe, it, expect, beforeEach, afterEach } from 'bun:test'

describe('Merge Operations', () => {
  describe('merge_with_left_cow', () => {
    beforeEach(() => {
      // Настройка для каждого теста
    })

    it('should merge leaf nodes correctly', () => { /* ... */ })
    it('should update parent pointers', () => { /* ... */ })
    it('should handle separator keys', () => { /* ... */ })
    it('should work with working copies', () => { /* ... */ })
  })

  describe('merge_with_right_cow', () => {
    it('should merge internal nodes correctly', () => { /* ... */ })
    it('should preserve tree structure', () => { /* ... */ })
  })
})

// Команды Bun для тестирования:
// bun test                    - запуск всех тестов
// bun test --watch           - режим наблюдения
// bun test merge             - фильтр по имени
// bun test --coverage        - покрытие кода
```

### 9. **Изоляция контекста между тестами с Bun**
```typescript
// ✅ ПРАВИЛЬНО: Используй lifecycle hooks Bun для очистки контекста
import { describe, it, expect, beforeEach, afterEach, beforeAll, afterAll } from 'bun:test'

describe('Transaction Tests', () => {
  let tree: BPlusTree<User, number>
  let txCtx: TransactionContext<User, number>

  beforeAll(() => {
    // Глобальная настройка для всех тестов в группе
    console.log('Setting up test suite')
  })

  beforeEach(() => {
    // Создаем чистое состояние для каждого теста
    tree = new BPlusTree<User, number>(3, false)
    txCtx = new TransactionContext(tree)
  })

  afterEach(() => {
    // Очищаем ресурсы после каждого теста
    if (txCtx) {
      txCtx.cleanup()
    }
    tree = null
    txCtx = null
  })

  afterAll(() => {
    // Глобальная очистка после всех тестов
    console.log('Cleaning up test suite')
  })

  it('should handle transaction isolation', () => {
    // Тест работает с чистым состоянием
    tree.insert_in_transaction(1, { name: 'Alice' }, txCtx)
    expect(tree.size).toBe(1)
  })
})

// Команды для отладки:
// bun test --test-name-pattern "isolation" - фильтр по имени теста
// bun test --bail                         - остановка на первой ошибке
```

### 10. **Обязательное тестирование каждой фичи с Bun**
```typescript
// ✅ ПРАВИЛЬНО: Каждая новая функция должна иметь тесты с Bun
// Правило: Нет фичи без тестов
import { describe, it, expect, test } from 'bun:test'

// Новая функция
function findOptimalMergeCandidate<T, K extends ValueType>(
  node: Node<T, K>,
  txCtx: TransactionContext<T, K>
): Node<T, K> | null {
  // Реализация функции
}

// Обязательные тесты для новой функции с использованием Bun features
describe('findOptimalMergeCandidate', () => {
  it('should return null for nodes without siblings', () => { /* ... */ })
  it('should prefer left sibling when both available', () => { /* ... */ })
  it('should handle edge cases with minimum capacity', () => { /* ... */ })
  it('should work correctly in transaction context', () => { /* ... */ })

  // Используй test.each для параметризованных тестов
  test.each([
    [{ capacity: 3, siblings: 0 }, null],
    [{ capacity: 3, siblings: 1 }, 'left'],
    [{ capacity: 5, siblings: 2 }, 'optimal']
  ])('should handle capacity %p correctly', (input, expected) => {
    // Тест с разными параметрами
  })

  // Используй test.failing для известных багов
  test.failing('should handle concurrent access', () => {
    // Тест который пока не проходит, но должен быть исправлен
  })
})

// Команды для проверки покрытия:
// bun test --coverage                    - отчет о покрытии
// bun test findOptimalMergeCandidate    - тесты конкретной функции
```

### 11. **Проверка покрытия функционала на каждом этапе**
```typescript
// ✅ ПРАВИЛЬНО: Проверяй покрытие в конце каждого этапа
// coverage-check.ts
interface PhaseRequirements {
  phase: string
  requiredFunctions: string[]
  requiredTestCoverage: number
  integrationPoints: string[]
}

const phase1Requirements: PhaseRequirements = {
  phase: "Core Operations",
  requiredFunctions: [
    "insert_in_transaction",
    "remove_in_transaction",
    "find_in_transaction"
  ],
  requiredTestCoverage: 95, // Минимум 95% покрытия
  integrationPoints: ["TransactionContext", "Node operations"]
}

function validatePhaseCompletion(phase: PhaseRequirements): boolean {
  // Проверяем что все функции реализованы
  for (const func of phase.requiredFunctions) {
    if (!isFunctionImplemented(func)) {
      console.error(`❌ Function ${func} not implemented`)
      return false
    }
  }

  // Проверяем покрытие тестами
  const coverage = calculateTestCoverage(phase.requiredFunctions)
  if (coverage < phase.requiredTestCoverage) {
    console.error(`❌ Test coverage ${coverage}% < required ${phase.requiredTestCoverage}%`)
    return false
  }

  // Проверяем интеграционные точки
  for (const point of phase.integrationPoints) {
    if (!isIntegrationTested(point)) {
      console.error(`❌ Integration point ${point} not tested`)
      return false
    }
  }

  console.log(`✅ Phase "${phase.phase}" completed successfully`)
  return true
}

// Пример использования в конце этапа:
// npm run test:coverage
// node coverage-check.js --phase=1
```

### 12. **Тестирование edge cases**
```typescript
// ✅ ПРАВИЛЬНО: Покрывай все граничные случаи
describe('Edge Cases', () => {
  it('should handle empty nodes', () => {
    const emptyNode = Node.createLeaf(txCtx)
    expect(() => merge_with_left_cow(emptyNode, /* ... */)).not.toThrow()
  })

  it('should handle single element nodes', () => { /* ... */ })
  it('should handle maximum capacity nodes', () => { /* ... */ })
  it('should handle orphaned nodes', () => { /* ... */ })
  it('should handle duplicate keys', () => { /* ... */ })
})

// Урок из проекта: Edge cases часто выявляют фундаментальные проблемы
```

### 13. **Тестирование производительности с Bun**
```typescript
// ✅ ПРАВИЛЬНО: Используй Bun для быстрых тестов производительности
import { describe, it, expect, test } from 'bun:test'

describe('Performance', () => {
  it('should handle large datasets efficiently', () => {
    const startTime = performance.now()

    // Выполняем операцию
    for (let i = 0; i < 10000; i++) {
      tree.insert_in_transaction(i, `value${i}`, txCtx)
    }

    const duration = performance.now() - startTime
    expect(duration).toBeLessThan(1000) // Менее 1 секунды для 10k операций
  })

  // Используй test.each для тестирования разных нагрузок
  test.each([
    [1000, 100],   // 1k операций за 100мс
    [5000, 300],   // 5k операций за 300мс
    [10000, 1000]  // 10k операций за 1с
  ])('should handle %i operations in less than %ims', (operations, maxTime) => {
    const startTime = performance.now()

    for (let i = 0; i < operations; i++) {
      tree.insert(i, `value${i}`)
    }

    const duration = performance.now() - startTime
    expect(duration).toBeLessThan(maxTime)
  })

  // Используй test.failing для известных проблем производительности
  test.failing('should handle memory-intensive operations', () => {
    // Тест который выявляет RangeError: Out of memory
    for (let i = 0; i < 1000000; i++) {
      tree.insert(i, `large_value_${i}`.repeat(1000))
    }
  })
})

// Команды для тестирования производительности:
// bun test --timeout 30000 Performance  - увеличенный таймаут
// bun test --rerun-each 5 Performance   - повторные запуски для стабильности
```

### 14. **Высокоточное измерение времени с Bun**
```typescript
// ❌ НЕПРАВИЛЬНО: Использование Date.now() для измерений
function measureOperationTime() {
  const start = Date.now() // Точность только до миллисекунды
  performOperation()
  const duration = Date.now() - start
  return duration
}

// ✅ ПРАВИЛЬНО: Использование performance.now() с Bun для точных измерений
import { describe, it, expect, test } from 'bun:test'

function measureOperationTime() {
  const start = performance.now() // Микросекундная точность
  performOperation()
  const duration = performance.now() - start
  return duration
}

// Пример высоконагруженного теста с Bun
describe('High Load Performance', () => {
  it('should handle rapid consecutive operations', () => {
    const operations = []

    for (let i = 0; i < 1000; i++) {
      const start = performance.now()
      tree.insert(i, `value${i}`)
      const duration = performance.now() - start
      operations.push(duration)
    }

    // Проверяем что операции выполняются стабильно быстро
    const avgDuration = operations.reduce((a, b) => a + b) / operations.length
    expect(avgDuration).toBeLessThan(1) // Менее 1мс в среднем

    // Проверяем что нет аномально медленных операций
    const maxDuration = Math.max(...operations)
    expect(maxDuration).toBeLessThan(10) // Не более 10мс для любой операции
  })

  // Используй test.each для тестирования разных размеров нагрузки
  test.each([
    [100, 0.5],   // 100 операций, среднее время < 0.5мс
    [500, 0.8],   // 500 операций, среднее время < 0.8мс
    [1000, 1.0]   // 1000 операций, среднее время < 1мс
  ])('should handle %i operations with avg time < %fms', (count, maxAvg) => {
    const durations = []

    for (let i = 0; i < count; i++) {
      const start = performance.now()
      tree.insert(i, `value${i}`)
      durations.push(performance.now() - start)
    }

    const avgDuration = durations.reduce((a, b) => a + b) / durations.length
    expect(avgDuration).toBeLessThan(maxAvg)
  })
})

// Команды для точного тестирования:
// bun test --rerun-each 10 "High Load"  - повторные запуски для точности
// bun test --timeout 60000              - увеличенный таймаут для нагрузочных тестов
```

### 15. **Устойчивая генерация ID**
```typescript
// ❌ НЕПРАВИЛЬНО: ID на основе времени без защиты от коллизий
class BadIdGenerator {
  generateId(): string {
    return Date.now().toString() // Коллизии при высокой нагрузке!
  }
}

// ✅ ПРАВИЛЬНО: Устойчивая к коллизиям генерация ID
class RobustIdGenerator {
  private counter = 0
  private lastTimestamp = 0

  generateId(): string {
    const timestamp = performance.now()

    // Если в той же миллисекунде - увеличиваем счетчик
    if (timestamp === this.lastTimestamp) {
      this.counter++
    } else {
      this.counter = 0
      this.lastTimestamp = timestamp
    }

    // Комбинируем время + счетчик для уникальности
    return `${Math.floor(timestamp)}-${this.counter}`
  }
}

// Альтернативный подход: UUID для полной уникальности
import { v4 as uuidv4 } from 'uuid'

class UUIDGenerator {
  generateId(): string {
    return uuidv4() // Гарантированно уникальный ID
  }
}

// Гибридный подход: время + случайность + счетчик
class HybridIdGenerator {
  private counter = 0

  generateId(): string {
    const timestamp = Math.floor(performance.now())
    const random = Math.floor(Math.random() * 1000)
    const count = this.counter++

    return `${timestamp}-${random}-${count}`
  }
}

// Тестирование генератора ID на коллизии
describe('ID Generator Collision Test', () => {
  it('should generate unique IDs under high load', () => {
    const generator = new RobustIdGenerator()
    const ids = new Set<string>()
    const iterations = 10000

    // Генерируем много ID быстро
    for (let i = 0; i < iterations; i++) {
      const id = generator.generateId()

      // Проверяем уникальность
      expect(ids.has(id)).toBe(false)
      ids.add(id)
    }

    // Все ID должны быть уникальными
    expect(ids.size).toBe(iterations)
  })

  it('should handle concurrent ID generation', async () => {
    const generator = new RobustIdGenerator()
    const ids = new Set<string>()

    // Параллельная генерация ID
    const promises = Array.from({ length: 1000 }, async () => {
      return generator.generateId()
    })

    const results = await Promise.all(promises)

    // Проверяем уникальность всех ID
    results.forEach(id => {
      expect(ids.has(id)).toBe(false)
      ids.add(id)
    })

    expect(ids.size).toBe(1000)
  })
})

// Урок: Простые time-based ID ломаются при высокой нагрузке
```

### 16. **Тестирование временных коллизий**
```typescript
// ✅ ПРАВИЛЬНО: Тестируй операции в одной миллисекунде
describe('Timing Collision Tests', () => {
  it('should handle multiple operations in same millisecond', () => {
    const results = []
    const startTime = performance.now()

    // Выполняем много операций очень быстро
    while (performance.now() - startTime < 1) { // В течение 1мс
      const operationStart = performance.now()
      tree.insert(Math.random(), `value-${Math.random()}`)
      const operationEnd = performance.now()

      results.push({
        start: operationStart,
        end: operationEnd,
        duration: operationEnd - operationStart
      })
    }

    console.log(`Executed ${results.length} operations in ~1ms`)

    // Проверяем что все операции корректно обработаны
    expect(results.length).toBeGreaterThan(0)
    results.forEach(result => {
      expect(result.duration).toBeGreaterThanOrEqual(0)
    })
  })

  it('should maintain data consistency under rapid operations', () => {
    const operations = 1000
    const keys = []

    // Быстрая вставка множества элементов
    for (let i = 0; i < operations; i++) {
      const key = `key-${i}-${performance.now()}`
      tree.insert(key, `value-${i}`)
      keys.push(key)
    }

    // Проверяем что все элементы на месте
    keys.forEach(key => {
      expect(tree.has(key)).toBe(true)
    })

    expect(tree.size).toBe(operations)
  })
})

// Урок: Высокая нагрузка выявляет проблемы с временной точностью
```

---

## 🔗 Правила интеграции

### 17. **Изолированное проектирование фаз**
```markdown
# Правило изолированного проектирования

## ✅ ПРАВИЛЬНО: Проектируй фазы изолированно
### Phase 1: Core Data Structures (изолированно)
- Implement Node class
- Implement basic tree operations
- No dependencies on transactions

### Phase 2: Transaction System (изолированно)
- Implement TransactionContext
- Implement Copy-on-Write logic
- No dependencies on advanced operations

### Phase 3: Advanced Operations (изолированно)
- Implement merge/split operations
- Implement rebalancing
- Uses interfaces from Phase 1 & 2

### Phase 4: Integration (планируется отдельно)
- Integrate transaction system with core operations
- Integrate advanced operations with transactions
- End-to-end testing

## ❌ НЕПРАВИЛЬНО: Смешанная разработка
- Разрабатывать все компоненты одновременно
- Создавать зависимости между фазами во время разработки
- Не планировать интеграционные шаги
```

### 18. **Планирование интеграционных шагов**
```typescript
// ✅ ПРАВИЛЬНО: Явное планирование интеграции
interface IntegrationPlan {
  name: string
  components: string[]
  integrationSteps: IntegrationStep[]
  testStrategy: string
  rollbackPlan: string
}

interface IntegrationStep {
  step: number
  description: string
  dependencies: string[]
  validation: string[]
  estimatedTime: string
}

const transactionIntegrationPlan: IntegrationPlan = {
  name: "Transaction System Integration",
  components: ["Core Tree", "Transaction Context", "CoW Operations"],
  integrationSteps: [
    {
      step: 1,
      description: "Integrate TransactionContext with basic tree operations",
      dependencies: ["Core Tree Phase", "Transaction System Phase"],
      validation: ["Basic insert/remove with transactions", "Context isolation"],
      estimatedTime: "2 days"
    },
    {
      step: 2,
      description: "Integrate CoW with advanced operations",
      dependencies: ["Step 1", "Advanced Operations Phase"],
      validation: ["Merge/split with CoW", "Parent-child consistency"],
      estimatedTime: "3 days"
    },
    {
      step: 3,
      description: "End-to-end transaction scenarios",
      dependencies: ["Step 2"],
      validation: ["2PC protocol", "Isolation guarantees", "Performance tests"],
      estimatedTime: "2 days"
    }
  ],
  testStrategy: "Integration tests separate from unit tests",
  rollbackPlan: "Revert to previous stable interfaces"
}

// Каждый шаг интеграции планируется как отдельная фаза
```

### 19. **Тестирование интеграционных точек**
```typescript
// ✅ ПРАВИЛЬНО: Отдельные тесты для интеграции
describe('Integration Tests', () => {
  describe('Transaction-Tree Integration', () => {
    it('should maintain tree invariants during transactions', () => {
      // Тестируем интеграцию между деревом и транзакциями
      const tree = new BPlusTree<number, number>(3, false)
      const txCtx = new TransactionContext(tree)

      // Выполняем операции через транзакционный интерфейс
      tree.insert_in_transaction(1, 100, txCtx)
      tree.insert_in_transaction(2, 200, txCtx)

      // Проверяем что инварианты дерева сохраняются
      validateTreeInvariants(tree)

      // Проверяем что транзакционный контекст корректен
      validateTransactionState(txCtx)
    })
  })

  describe('CoW-Operations Integration', () => {
    it('should handle CoW during complex operations', () => {
      // Тестируем интеграцию CoW с операциями merge/split
    })
  })
})

// Интеграционные тесты отдельно от unit тестов
```

### 20. **Документирование интеграционных зависимостей**
```markdown
# Правило документирования интеграционных зависимостей

## Integration Dependency Map

### Core Tree → Transaction System
- **Interface:** TreeOperationInterface
- **Dependencies:** Node access, tree traversal
- **Potential Conflicts:** Direct node modification vs CoW
- **Resolution Strategy:** Wrapper pattern with transaction-aware operations

### Transaction System → Advanced Operations
- **Interface:** TransactionAwareOperations
- **Dependencies:** Node copying, state management
- **Potential Conflicts:** Memory management, parent-child updates
- **Resolution Strategy:** Event-driven coordination

### Integration Testing Points
1. **Tree-Transaction boundary:** Verify CoW semantics
2. **Transaction-Operations boundary:** Verify state consistency
3. **End-to-end scenarios:** Verify complete workflows

### Rollback Strategies
- **Phase 1 rollback:** Revert to non-transactional operations
- **Phase 2 rollback:** Disable CoW, use direct modifications
- **Phase 3 rollback:** Fallback to simple transaction model
```

---

## 🐛 Правила отладки

### 21. **Трассировка перед исправлением**
```markdown
# Правило трассировки

Перед отладкой и исправлением сложных тестов:
1. Сначала выполни трассировку вручную с ожидаемыми результатами
2. Помечай шаг на котором возникает ошибка
3. Сохраняй этот лог в отдельный файл markdown
4. Только потом переходи к отладке и исправлению

Пример файлов трассировки из проекта:
- failed.2pc.isolation.md
- failed.duplicate.keys.md
- failed.transaction.abort.md
```

### 21.1. **Анализ больших тестовых наборов по группам**
```bash
# ✅ ПРАВИЛЬНО: Системный подход к анализу больших тестов по группам

# Шаг 1: Захват полного вывода
bun test > test_output.log 2>&1

# Шаг 2: Поиск падающих тестов
grep "(fail)" test_output.log

# Шаг 3: Извлечение уникальных групп тестов
grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq

# Пример вывода групп:
# Replication Network Layer
# Automated Optimization Integration
# Phase 5.3 Day 1
# NetworkDetector with Mocks

# Шаг 4: Запуск тестов по группам (быстрее чем по одному)
bun test -t "Replication Network Layer"
bun test -t "Automated Optimization Integration"
bun test -t "Phase 5.3 Day 1"
bun test -t "NetworkDetector with Mocks"

# Шаг 5: Запуск подгрупп при необходимости
bun test -t "Replication Network Layer > Connection Management"
bun test -t "Automated Optimization Integration > Error Handling"

# Шаг 6: Анализ конкретных ошибок
grep -A 10 -B 5 "(fail)" test_output.log > failing_tests_context.log

# Шаг 7: Поиск паттернов ошибок
grep -i "error\|exception\|timeout\|memory" test_output.log

# Шаг 8: Анализ производительности по группам
grep -E "\([0-9]{3,}ms\)" test_output.log | sort -nr

# Пример эффективного workflow:
# 1. bun test > test_output.log 2>&1
# 2. grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq
# 3. bun test -t "Group Name"  # отладка по группам, не по одному тесту
# 4. bun test -t "Group Name > Subgroup"  # детализация при необходимости
```

### 22. **Детальное логирование с Bun**
```typescript
// ✅ ПРАВИЛЬНО: Подробное логирование для сложных операций с Bun
import { describe, it, expect, spyOn } from 'bun:test'

function remove_in_transaction<T, K extends ValueType>(
  tree: BPlusTree<T, K>,
  key: K,
  txCtx: TransactionContext<T, K>
): boolean {
  console.log(`[REMOVE_TX] Starting removal of key ${key}`)

  const leaf = find_leaf_for_key_in_transaction(tree, key, txCtx)
  console.log(`[REMOVE_TX] Found leaf ${leaf.id} with ${leaf.keys.length} keys`)

  const keyIndex = find_first_key(leaf.keys, key, tree.comparator)
  console.log(`[REMOVE_TX] Key index: ${keyIndex}`)

  if (keyIndex === -1 || tree.comparator(leaf.keys[keyIndex], key) !== 0) {
    console.log(`[REMOVE_TX] Key ${key} not found`)
    return false
  }

  // ... остальная логика с логированием каждого шага
}

// Тестирование логирования с Bun
describe('Logging Tests', () => {
  it('should log transaction steps correctly', () => {
    const consoleSpy = spyOn(console, 'log')

    tree.remove_in_transaction('test-key', txCtx)

    expect(consoleSpy).toHaveBeenCalledWith('[REMOVE_TX] Starting removal of key test-key')
    expect(consoleSpy).toHaveBeenCalledTimes(3) // Проверяем количество логов

    consoleSpy.mockRestore() // Восстанавливаем console.log
  })
})

// Команды для отладки с логами:
// bun test --verbose                     - подробный вывод
// bun test remove_in_transaction > logs.txt 2>&1  - захват логов в файл
// grep "REMOVE_TX" logs.txt              - фильтрация логов
// grep -A 3 -B 1 "error" logs.txt       - контекст вокруг ошибок
```

### 23. **Валидация инвариантов**
```typescript
// ✅ ПРАВИЛЬНО: Проверка инвариантов на каждом шаге
function validateTreeInvariants<T, K extends ValueType>(
  tree: BPlusTree<T, K>,
  operation: string
): void {
  console.log(`[VALIDATION] Checking invariants after ${operation}`)

  // Проверяем структуру дерева
  const structureValid = validateTreeStructure(tree)
  if (!structureValid) {
    throw new Error(`Tree structure invalid after ${operation}`)
  }

  // Проверяем parent-child связи
  const linksValid = validateParentChildLinks(tree)
  if (!linksValid) {
    throw new Error(`Parent-child links invalid after ${operation}`)
  }

  // Проверяем порядок ключей
  const orderValid = validateKeyOrder(tree)
  if (!orderValid) {
    throw new Error(`Key order invalid after ${operation}`)
  }

  console.log(`[VALIDATION] All invariants valid after ${operation}`)
}
```

---

## 📚 Правила документирования

### 24. **Документирование решений**
```markdown
# Правило документирования решений

Для каждой решенной проблемы документируй:

## ✅ ИСПРАВЛЕНИЕ #N: Название проблемы
- **Проблема:** Краткое описание
- **Решение:** Техническое решение
- **Техническое решение:** Код/алгоритм
- **Результат:** Что изменилось
- **Файлы:** Какие файлы затронуты

Пример из проекта:
## ✅ ИСПРАВЛЕНИЕ #1: 2PC Transaction Isolation
- **Проблема:** Нарушение snapshot isolation в prepare фазе
- **Решение:** Реализована система сохранения состояния узлов
- **Техническое решение:**
  ```typescript
  this._snapshotNodeStates = new Map();
  for (const [nodeId, node] of tree.nodes) {
    this._snapshotNodeStates.set(nodeId, { ... });
  }
  ```
- **Результат:** ✅ Тест проходит полностью
- **Файлы:** `src/TransactionContext.ts`, `src/BPlusTree.ts`
```

### 25. **Ведение статистики**
```markdown
# Правило ведения статистики

Отслеживай прогресс количественно:

**ИТОГОВАЯ СТАТИСТИКА УСПЕХА:**
- **✅ ВСЕ 340 ТЕСТОВ ПРОХОДЯТ** (100% success rate)
- **✅ insert_in_transaction:** Полностью реализован
- **✅ remove_in_transaction:** Полностью реализован
- **✅ 2PC API:** Полностью реализован
- **✅ Транзакционная изоляция:** Работает корректно
- **✅ Copy-on-Write:** Полностью функционирует

Это помогает видеть общую картину прогресса.
```

### 26. **Создание примеров использования**
```typescript
// ✅ ПРАВИЛЬНО: Создавай рабочие примеры для каждой функции
// examples/transaction-example.ts
async function transactionExample() {
  const tree = new BPlusTree<User, number>(3, false)
  const txCtx = new TransactionContext(tree)

  // Демонстрируем основные операции
  tree.insert_in_transaction(1, { name: 'Alice' }, txCtx)
  tree.insert_in_transaction(2, { name: 'Bob' }, txCtx)

  // Демонстрируем 2PC
  const canCommit = await txCtx.prepareCommit()
  if (canCommit) {
    await txCtx.finalizeCommit()
  }

  console.log('Transaction completed successfully')
}

// Примеры должны быть исполняемыми и демонстрировать реальные сценарии
```

---

## 🔄 Правила рефакторинга

### 27. **Постепенный рефакторинг**
```typescript
// ✅ ПРАВИЛЬНО: Рефакторинг по одной функции за раз
// Шаг 1: Создаем новую функцию с улучшенной логикой
function merge_with_left_cow_v2<T, K extends ValueType>(/* ... */) {
  // Улучшенная реализация
}

// Шаг 2: Тестируем новую функцию
describe('merge_with_left_cow_v2', () => {
  // Все тесты для новой версии
})

// Шаг 3: Заменяем старую функцию после успешных тестов
// Шаг 4: Удаляем старую функцию

// ❌ НЕПРАВИЛЬНО: Переписываем все сразу
```

### 28. **Сохранение обратной совместимости**
```typescript
// ✅ ПРАВИЛЬНО: Сохраняем старый API при рефакторинге
// Старый API (deprecated)
function insert(key: K, value: T): boolean {
  console.warn('insert() is deprecated, use insert_in_transaction()')
  const txCtx = new TransactionContext(this)
  const result = this.insert_in_transaction(key, value, txCtx)
  txCtx.commit()
  return result
}

// Новый API
function insert_in_transaction(key: K, value: T, txCtx: TransactionContext<T, K>): boolean {
  // Новая реализация
}
```

### 29. **Метрики качества кода**
```typescript
// ✅ ПРАВИЛЬНО: Отслеживай метрики качества
interface CodeQualityMetrics {
  testCoverage: number        // 100% для критических функций
  cyclomaticComplexity: number // < 10 для большинства функций
  linesOfCode: number         // Отслеживай рост
  technicalDebt: number       // Количество TODO/FIXME
  performanceRegression: boolean // Нет регрессий производительности
}

// Пример из проекта:
// Было: 13 провальных тестов, сложность > 15
// Стало: 0 провальных тестов, сложность < 8
```

---

## 📋 Чек-лист для каждого PR с Bun

### Перед коммитом:
- [ ] Все тесты проходят: `bun test`
- [ ] Добавлены тесты для новой функциональности с Bun matchers
- [ ] Обновлена документация
- [ ] Проверена производительность: `bun test --timeout 30000 Performance`
- [ ] Нет memory leaks (используй `test.failing` для известных проблем)
- [ ] Код соответствует стилю проекта
- [ ] Используются lifecycle hooks для очистки тестов
- [ ] Snapshot тесты обновлены: `bun test --update-snapshots`
- [ ] Покрытие кода проверено: `bun test --coverage`

### Перед релизом:
- [ ] Все фазы разработки завершены
- [ ] 100% тестовое покрытие критических функций: `bun test --coverage`
- [ ] Примеры использования работают
- [ ] Документация актуальна
- [ ] Производительность не хуже предыдущей версии: `bun test --rerun-each 5 Performance`
- [ ] Обратная совместимость сохранена
- [ ] CI/CD pipeline проходит с Bun
- [ ] Все `test.failing` тесты либо исправлены, либо задокументированы
- [ ] Module mocks работают корректно
- [ ] Conditional tests (`test.if`, `test.skipIf`) настроены правильно

### Команды для финальной проверки:
```bash
# Полная проверка
bun test --coverage --timeout 60000

# Проверка производительности
bun test --rerun-each 3 Performance

# Проверка на разных платформах
bun test --test-name-pattern "platform"

# Обновление снапшотов
bun test --update-snapshots

# Проверка с bail на первой ошибке
bun test --bail

# Анализ больших тестовых наборов по группам
bun test > test_output.log 2>&1
grep "(fail)" test_output.log | cut -d'>' -f1 | sort | uniq
bun test -t "Group Name"
bun test -t "Group Name > Subgroup"
grep -A 5 -B 5 "(fail)" test_output.log > failing_context.log
```

---

## 🎯 Ключевые уроки из проекта с Bun

### 1. **Сложность растет экспоненциально**
- Простые изменения могут сломать множество тестов
- Всегда проверяй влияние на существующий функционал: `bun test`
- Используй фазовый подход для управления сложностью
- **Bun преимущество:** Быстрое выполнение тестов позволяет чаще проверять изменения

### 2. **Тестирование - это инвестиция**
- Высокогранулированные тесты помогают быстро находить проблемы
- Edge cases часто выявляют фундаментальные ошибки архитектуры
- Тесты производительности предотвращают критические проблемы
- **Bun преимущества:**
  - `test.each` для параметризованного тестирования edge cases
  - `test.failing` для отслеживания известных проблем
  - Встроенная поддержка TypeScript без настройки

### 3. **Документирование экономит время**
- Подробные логи помогают в отладке
- Документирование решений предотвращает повторные ошибки
- Примеры использования выявляют проблемы UX
- **Bun преимущества:**
  - `spyOn(console, 'log')` для тестирования логирования
  - Snapshot тесты для документирования сложных структур данных

### 4. **Координация между системами критична**
- В сложных системах нужны механизмы координации
- Флаги, события, callbacks помогают избежать конфликтов
- Всегда думай о взаимодействии компонентов
- **Bun преимущества:**
  - `mock.module()` для тестирования интеграционных границ
  - Lifecycle hooks для координации setup/cleanup

### 5. **Производительность важна с самого начала**
- Memory leaks могут полностью заблокировать разработку
- Алгоритмическая сложность важнее микрооптимизаций
- Регулярно измеряй производительность
- **Bun преимущества:**
  - Быстрое выполнение тестов для частых проверок производительности
  - `--rerun-each` для стабильных измерений
  - Эффективный runtime для лучшего использования памяти

### 6. **Bun-специфичные уроки**
- **Watch mode** (`--watch`) ускоряет разработку через TDD
- **Module mocking** упрощает тестирование сложных зависимостей
- **Conditional tests** помогают с кроссплатформенной разработкой
- **Snapshot testing** отлично подходит для сложных структур данных
- **Parametrized tests** (`test.each`) сокращают дублирование кода
- **Built-in TypeScript** устраняет проблемы с настройкой
- **File output + grep analysis** критично для больших тестовых наборов:
  - `bun test > output.log 2>&1` для захвата всего вывода
  - `grep "(fail)" output.log | cut -d'>' -f1 | sort | uniq` для извлечения групп тестов
  - `bun test -t "Group Name"` для отладки по группам (эффективнее чем по одному)
  - `bun test -t "Group Name > Subgroup"` для детализации подгрупп
  - `grep -A 5 -B 5 "error"` для получения контекста вокруг ошибок

---

*Правила основаны на реальном опыте разработки B+ Tree с транзакционной поддержкой*
*Проект: 340 тестов, 100% success rate, полная транзакционная поддержка*
*Версия: 1.0 | Дата: Декабрь 2024*