---
description: Development Rules Integration for Memory Bank 2.0.0
globs: "**/development/**", "**/memory-bank/**"
alwaysApply: false
---
# DEVELOPMENT RULES INTEGRATION

This file integrates comprehensive development rules based on real project experience (B+ Tree project) into the Memory Bank system.

## CORE DEVELOPMENT PRINCIPLES

### Rule #1: Фазовый подход к разработке
**Implementation**: Integrated into PLAN mode and phase-tracking.md
- Each development task must be broken into distinct phases
- Each phase has clear objectives and completion criteria
- No transition to next phase until current phase is complete
- Document all decisions and approaches with ✅/❌ markers

**Memory Bank Integration**:
- VAN mode determines number and type of phases
- PLAN mode details each phase with dependencies
- IMPLEMENT mode executes current phase with progress tracking
- REFLECT mode analyzes phase results and prepares for next phase

### Rule #2: Документирование прогресса с ✅/❌ маркерами
**Implementation**: Integrated into progress.md and all tracking files
- All ideas and approaches must be documented
- Successful ideas marked with ✅ (keep for reference)
- Failed approaches marked with ❌ (never delete - learn from failures)
- Regular progress updates with clear status indicators

**Memory Bank Integration**:
- Extended progress.md with Implementation Ideas Tracking
- All modes update progress with ✅/❌ markers
- Failed approaches preserved for learning and avoiding repetition

### Rule #3: Приоритизация проблем (CRITICAL → HIGH → MEDIUM → LOW)
**Implementation**: Integrated into task prioritization across all modes
- **CRITICAL**: Blocks core functionality, must be fixed immediately
- **HIGH**: Affects performance or user experience significantly
- **MEDIUM**: Improvements that enhance usability
- **LOW**: Nice-to-have features or minor optimizations

**Memory Bank Integration**:
- VAN mode assigns initial priority based on complexity
- PLAN mode refines priorities based on dependencies
- All task tracking uses consistent priority levels

## IMPLEMENTATION & QUALITY RULES

### Rule #4: Проверка зависимостей тестов
**Implementation**: Integrated into IMPLEMENT and QA modes
- Before running tests, verify all dependencies are available
- Check test environment setup and configuration
- Ensure test data and fixtures are properly initialized

### Rule #5: Избегание заглушек в продакшене
**Implementation**: Code review guidelines in IMPLEMENT mode
- No mock objects or stubs in production code
- All external dependencies must have real implementations
- Test doubles only in test environment

### Rule #6: Robust поиск и навигация
**Implementation**: Search and navigation patterns
- Implement comprehensive search functionality
- Provide multiple navigation paths to same content
- Handle edge cases in search queries gracefully

### Rule #7: Координация между системами
**Implementation**: Integration planning in PLAN mode
- Document all system interfaces and dependencies
- Plan integration points and data flow
- Test system boundaries and error handling

## TESTING & VALIDATION RULES (Universal Testing Framework)

> **Note**: This section integrates with the Universal Testing Framework that supports 8 programming languages and 20+ testing frameworks.
>
> **Integration**:
> ```bash
> fetch_rules([
>   "isolation_rules/Testing/universal-testing-controller.mdc",
>   "isolation_rules/Testing/universal-testing-principles.mdc"
> ])
> ```

### Rule #8: Высокогранулированные тесты
**Implementation**: Test structure guidelines
```bash
# Universal test command pattern for Memory Bank
# Framework automatically detected based on project configuration
$(get_test_command_for_project) --reporter=verbose --coverage
```
**Examples by framework**:
- **Bun**: `bun test --reporter=verbose --coverage`
- **Jest**: `npx jest --verbose --coverage`
- **Vitest**: `npx vitest --reporter=verbose --coverage`
- **PyTest**: `pytest -v --cov`
- **JUnit**: `mvn test -Dtest.verbose=true`

- Each function/method should have dedicated tests
- Test individual behaviors, not just happy paths
- Separate tests for different input scenarios

### Rule #9: Изоляция контекста между тестами
**Implementation**: Test isolation patterns
```bash
# Universal clean test environment pattern
$(get_test_clean_command_for_project)
```
**Examples by framework**:
- **Bun**: `bun test --clean-cache`
- **Jest**: `npx jest --clearCache`
- **Vitest**: `npx vitest --run --reporter=verbose`
- **PyTest**: `pytest --cache-clear`
- **Go**: `go clean -testcache`

- Each test must be independent and isolated
- No shared state between test cases
- Clean setup and teardown for each test

### Rule #10: Обязательное тестирование каждой фичи
**Implementation**: Feature testing requirements
- Every new feature must have corresponding tests
- Tests written before or during implementation
- No feature considered complete without tests

### Rule #11: Проверка покрытия функционала на каждом этапе
**Implementation**: Coverage tracking
```bash
# Universal coverage reporting pattern
$(get_coverage_command_for_project)
```
**Examples by framework**:
- **Bun**: `bun test --coverage --coverage-reporter=text-summary`
- **Jest**: `npx jest --coverage --coverageReporters=text-summary`
- **Vitest**: `npx vitest --coverage --reporter=text-summary`
- **PyTest**: `pytest --cov --cov-report=term-missing`
- **Go**: `go test -cover ./...`

- Monitor test coverage throughout development
- Aim for high coverage of critical paths
- Document coverage gaps and plans to address them

### Rule #12: Тестирование edge cases
**Implementation**: Edge case identification
- Identify boundary conditions and edge cases
- Test error conditions and failure scenarios
- Validate input validation and error handling

### Rule #13: Тестирование производительности
**Implementation**: Performance testing integration
```bash
# Universal performance testing pattern
$(get_performance_test_command_for_project)
```
**Examples by framework**:
- **Bun**: `bun test --timeout=30000 performance/*.test.ts`
- **Jest**: `npx jest --testTimeout=30000 performance/`
- **Vitest**: `npx vitest --testTimeout=30000 performance/`
- **PyTest**: `pytest --timeout=30 performance/`
- **Go**: `go test -timeout=30s -bench=. ./performance/`

- Include performance tests for critical operations
- Set performance benchmarks and monitor regression
- Test with realistic data volumes

### Rule #14: Высокоточное измерение времени
**Implementation**: Timing measurement patterns
```typescript
// High-precision timing for performance tests
const start = performance.now();
// ... operation to measure
const duration = performance.now() - start;
```

### Rule #15: Устойчивая генерация ID
**Implementation**: ID generation patterns
- Use cryptographically secure random ID generation
- Ensure ID uniqueness across system boundaries
- Test ID collision scenarios

### Rule #16: Тестирование временных коллизий
**Implementation**: Concurrency testing
- Test concurrent operations and race conditions
- Validate thread safety and atomic operations
- Test timeout and retry mechanisms

## INTEGRATION & ARCHITECTURE RULES

### Rule #17: Изолированное проектирование фаз
**Implementation**: CREATIVE mode integration
- Design each phase independently before integration
- Define clear interfaces between phases
- Minimize coupling between phase implementations

### Rule #18: Планирование интеграционных шагов
**Implementation**: Integration planning in PLAN mode
- Document integration sequence and dependencies
- Plan rollback strategies for failed integrations
- Define integration testing approach

### Rule #19: Тестирование интеграционных точек
**Implementation**: Integration testing requirements
- Test all system boundaries and interfaces
- Validate data transformation and mapping
- Test error propagation across system boundaries

### Rule #20: Документирование интеграционных зависимостей
**Implementation**: Integration documentation
- Document all external dependencies and versions
- Maintain integration maps and data flow diagrams
- Track integration points and their requirements

## DEBUGGING & ANALYSIS RULES

### Rule #21: Трассировка перед исправлением
**Implementation**: Debug workflow in IMPLEMENT mode
- Always trace the issue before attempting fixes
- Document the trace path and findings
- Understand root cause before implementing solution

### Rule #22: Детальное логирование
**Implementation**: Logging standards
- Implement comprehensive logging at appropriate levels
- Include context and correlation IDs in logs
- Structure logs for easy parsing and analysis

### Rule #23: Валидация инвариантов
**Implementation**: Invariant checking
- Define and document system invariants
- Implement runtime invariant checking where appropriate
- Test invariant violations and recovery

## DOCUMENTATION & KNOWLEDGE RULES

### Rule #24: Документирование решений
**Implementation**: Decision documentation in REFLECT mode
- Document architectural and design decisions
- Include rationale and alternatives considered
- Maintain decision log for future reference

### Rule #25: Ведение статистики
**Implementation**: Statistics tracking in progress.md
- Track development metrics and performance indicators
- Monitor progress against estimates and goals
- Analyze patterns and trends for improvement

### Rule #26: Создание примеров использования
**Implementation**: Example creation requirements
- Create practical examples for all major features
- Include both simple and complex usage scenarios
- Maintain examples as living documentation

## REFACTORING & MAINTENANCE RULES

### Rule #27: Постепенный рефакторинг
**Implementation**: Refactoring approach in IMPLEMENT mode
- Refactor incrementally, not in large batches
- Maintain functionality while improving structure
- Test after each refactoring step

### Rule #28: Сохранение обратной совместимости
**Implementation**: Compatibility guidelines
- Maintain backward compatibility when possible
- Document breaking changes and migration paths
- Provide deprecation warnings before removal

### Rule #29: Метрики качества кода
**Implementation**: Quality metrics tracking
- Monitor code complexity and maintainability metrics
- Track technical debt and improvement opportunities
- Regular code quality reviews and improvements

## MEMORY BANK MODE INTEGRATION

### VAN Mode Enhancements
- Platform detection and environment setup
- Development rules compliance checking
- Initial priority and complexity assessment

### PLAN Mode Enhancements
- Phase-based planning with Rule #1 integration
- Integration point identification (Rules #17-20)
- Priority-based task organization (Rule #3)

### CREATIVE Mode Enhancements
- Isolated design approach (Rule #17)
- Architecture decision documentation (Rule #24)
- Design alternative evaluation

### IMPLEMENT Mode Enhancements
- Test-driven development workflow (Rules #8-16)
- Progress tracking with ✅/❌ markers (Rule #2)
- Debug-first approach (Rules #21-23)
- Incremental refactoring (Rule #27)

### QA Mode Enhancements
- Comprehensive testing framework (Rules #8-16)
- Performance validation (Rule #13)
- Integration testing (Rule #19)
- Quality metrics tracking (Rule #29)

### REFLECT Mode Enhancements
- Decision documentation (Rule #24)
- Statistics and metrics analysis (Rule #25)
- Lessons learned capture
- Phase completion validation

### ARCHIVE Mode Enhancements
- Example creation and maintenance (Rule #26)
- Statistics preservation (Rule #25)
- Decision history archival (Rule #24)
- Knowledge base building

## USAGE PATTERNS

### For Level 1 Tasks (Quick Bug Fix)
1. VAN: Quick complexity assessment + priority assignment
2. IMPLEMENT: Direct implementation with integrated testing
3. QA: Minimal validation focused on regression prevention

### For Level 2-4 Tasks (Complex Development)
1. VAN: Comprehensive analysis + phase planning
2. PLAN: Detailed phase breakdown + integration planning
3. CREATIVE: Isolated design for complex components
4. IMPLEMENT: Phase-by-phase execution with full testing
5. QA: Comprehensive validation + performance testing
6. REFLECT: Thorough analysis + decision documentation
7. ARCHIVE: Complete knowledge preservation

## INTEGRATION STATUS
- [x] Core principles integrated into Memory Bank structure
- [x] Testing rules adapted for Universal Testing Framework (8 languages, 20+ frameworks)
- [x] Progress tracking enhanced with rule compliance
- [x] Phase tracking system created
- [x] .cursor/rules files updated with specific rule implementations
- [x] Mode-specific rule integration completed
- [x] Testing framework integration completed
- [ ] Documentation templates created
