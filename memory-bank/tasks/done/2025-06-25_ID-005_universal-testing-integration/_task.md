# TASK: Universal Testing Framework Integration into Memory Bank Rules

**ID:** 2025-06-25_ID-005_universal-testing-integration
**Created:** 2025-06-25
**Status:** IN_PROGRESS
**Priority:** HIGH (системная интеграция)
**Complexity:** Level 3 (Intermediate Feature)

## 📋 TASK OVERVIEW

Интеграция универсальной системы тестирования из завершенной задачи ID-004 в основную систему правил Memory Bank. Замена устаревших language-specific правил тестирования на новую universal систему с поддержкой 8 языков программирования.

## 🎯 OBJECTIVES

### ✅ Phase 1: Integration Planning - COMPLETED
1. **Анализ текущих правил тестирования** ✅
   - Инвентаризация всех существующих testing правил в `_cursor/rules/`
   - Анализ зависимостей в `custom_modes/`
   - Определение migration strategy

2. **Планирование архитектуры интеграции** ✅
   - Определение новой структуры правил тестирования
   - Планирование backward compatibility
   - Создание migration roadmap

**📋 PLAN РЕЗУЛЬТАТЫ:**
- ✅ Создан детальный план интеграции (planning/integration-plan.md)
- ✅ Определена структура миграции (10 source files → target structure)
- ✅ Идентифицированы 11 legacy файлов для удаления
- ✅ Найдена 1 зависимость в custom_modes для обновления
- ✅ Подтверждено: Creative фазы НЕ требуются
- ✅ Оценка времени: 4.5 часа
- ✅ Риски идентифицированы и стратегии митigation созданы

### 🔄 Phase 2: Rules Migration - READY FOR IMPLEMENT
1. **Интеграция language adapters**
   - Перенос файлов из `memory-bank/tasks/done/2025-06-25_ID-004_universal-testing-framework/implementation/language-adapters/` в `_cursor/rules/isolation_rules/Testing/language-adapters/`
   - Адаптация для системы правил Memory Bank
   - Обновление globs и metadata

2. **Интеграция Universal Testing Controller**
   - Перенос `universal-testing-controller.mdc.md` в систему правил
   - Интеграция с existing workflow systems
   - Обеспечение совместимости с режимами Memory Bank

3. **Интеграция Universal Testing Principles**
   - Перенос `universal-testing-principles.mdc.md`
   - Интеграция с core rules system
   - Обновление documentation

### ⏳ Phase 3: Legacy Rules Cleanup - PENDING
1. **Удаление устаревших testing правил**
   - Удаление `_cursor/rules/isolation_rules/Testing/bun-testing-framework.mdc.md`
   - Удаление `_cursor/rules/isolation_rules/CustomWorkflow/testing/` (все файлы)
   - Удаление `_cursor/rules/isolation_rules/CustomWorkflow/debugging/` (все файлы)

2. **Обновление custom_modes**
   - Удаление references на старые testing правила
   - Обновление всех mode instructions для использования universal testing
   - Обновление workflow integration

### ⏳ Phase 4: System Integration - PENDING
1. **Workflow Integration**
   - Интеграция с VAN, PLAN, CREATIVE, IMPLEMENT, QA режимами
   - Обновление visual maps для использования universal testing
   - Тестирование integration points

2. **Documentation Update**
   - Обновление всей документации для отражения universal testing system
   - Создание migration guides
   - Обновление user guides

## 📁 SOURCE ARTIFACTS (от ID-004)

### Language Adapters (8 файлов)
- `javascript-adapter.mdc.md` - 456 строк
- `typescript-adapter.mdc.md` - 871 строк
- `python-adapter.mdc.md` - 714 строк
- `java-adapter.mdc.md` - 145 строк
- `csharp-adapter.mdc.md` - 242 строк
- `go-adapter.mdc.md` - 231 строк
- `rust-adapter.mdc.md` - 299 строк
- `zig-adapter.mdc.md` - 526 строк

### Core System Files
- `universal-testing-controller.mdc.md` - 461 строк
- `universal-testing-principles.mdc.md` - 327 строк

## 🗑️ TARGET CLEANUP (Legacy Rules)

### Files to Remove
```
_cursor/rules/isolation_rules/Testing/
├── bun-testing-framework.mdc.md ❌ DELETE

_cursor/rules/isolation_rules/CustomWorkflow/testing/
├── bun-core-rules.mdc.md ❌ DELETE
├── bun-features.mdc.md ❌ DELETE
├── edge-cases.mdc.md ❌ DELETE
├── large-test-analysis.mdc.md ❌ DELETE
├── performance-testing.mdc.md ❌ DELETE
├── test-failure-patterns.mdc.md ❌ DELETE
└── test-organization.mdc.md ❌ DELETE

_cursor/rules/isolation_rules/CustomWorkflow/debugging/
├── detailed-logging.mdc.md ❌ DELETE
├── invariant-validation.mdc.md ❌ DELETE
└── systematic-debugging.mdc.md ❌ DELETE
```

### Custom Modes Updates
- Обновить файл `custom_modes/qa_instructions.md` (Line 181)
  - FROM: `"isolation_rules/Testing/bun-testing-framework.mdc"`
  - TO: `"isolation_rules/Testing/universal-testing-controller.mdc"`

## 📊 SUCCESS METRICS

- **Integration Completeness**: 100% (все 10 файлов интегрированы)
- **Legacy Cleanup**: 100% (все устаревшие правила удалены)
- **Mode Compatibility**: 100% (все режимы работают с universal testing)
- **Backward Compatibility**: Сохранена для существующих workflows
- **Documentation Quality**: Comprehensive updates для всех affected files

## 🚀 EXPECTED OUTCOMES

1. **Unified Testing System**: Единая система тестирования для всех языков
2. **Simplified Maintenance**: Уменьшение количества testing правил с десятков до единиц
3. **Enhanced Capabilities**: Поддержка 8 языков вместо focus только на Bun/JavaScript
4. **Improved Workflow**: Seamless integration с всеми Memory Bank режимами
5. **Future Extensibility**: Easy addition новых языков через adapter pattern

## 🔗 DEPENDENCIES

- **Prerequisite**: Task ID-004 (Universal Testing Framework) ✅ COMPLETED
- **Blocks**: Future testing-related tasks
- **Integrates with**: All Memory Bank workflow modes

## ⚠️ RISKS & MITIGATION

1. **Breaking Changes Risk**
   - **Mitigation**: Comprehensive backup всех правил перед deployment
   - **Fallback**: Maintain backup старых правил до complete validation

2. **Mode Integration Complexity**
   - **Mitigation**: Incremental integration с testing на каждом этапе
   - **Validation**: Test каждый mode после integration

3. **Documentation Drift**
   - **Mitigation**: Update всей documentation в рамках задачи
   - **Quality**: Review всех changes before completion

## 📈 TIMELINE & ESTIMATION

- **Total Time**: 4.5 hours (from PLAN phase analysis)
- **Phase 1**: ✅ COMPLETED (Planning)
- **Phase 2**: 2.5 hours (Implementation)
- **Phase 3**: 45 minutes (Cleanup)
- **Phase 4**: 1.25 hours (Testing & Documentation)

---

## 🎯 IMMEDIATE NEXT STEPS

1. **Start IMPLEMENT Mode**: Begin Phase 2 Rules Migration
2. **Create Backup**: Backup existing testing rules
3. **Begin Integration**: Start with core files integration
4. **Validate Each Step**: Test rule loading after each migration

---

*Task updated: 2025-06-25 (PLAN Phase Complete)*
*Priority: HIGH - System Integration*
*Next Mode: IMPLEMENT (No Creative phases required)*