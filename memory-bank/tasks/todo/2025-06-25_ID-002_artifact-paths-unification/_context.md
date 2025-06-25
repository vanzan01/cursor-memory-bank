# КОНТЕКСТ ЗАДАЧИ: УНИФИКАЦИЯ ПУТЕЙ АРТЕФАКТОВ

**Задача:** 2025-06-25_ID-002_artifact-paths-unification
**Дата создания:** 2025-06-25
**Последнее обновление:** 2025-06-25

## 🎯 ТЕКУЩЕЕ СОСТОЯНИЕ

**Статус:** TODO → READY FOR PLANNING
**Приоритет:** HIGH
**Сложность:** Level 3

## 📋 КОНТЕКСТ ПРОБЛЕМЫ

### Обнаруженная проблема:
В ходе QA проверки предыдущей задачи (fetch-rules-validation) было обнаружено, что все обновленные инструкции режимов создают артефакты в неправильных местах, что нарушает целостность Memory Bank 2.0.0 системы.

### Критические несоответствия:

1. **CREATIVE MODE** создает артефакты в:
   - ❌ `memory-bank/creative/[component-name].md`
   - ❌ `memory-bank/style-guide.md`
   - ✅ Должно: `$active_task_path/creative/[component-name].md`

2. **PLAN MODE** создает артефакты в:
   - ❌ `memory-bank/planning/[task-name]-requirements.md`
   - ❌ `memory-bank/planning/[task-name]-architecture.md`
   - ✅ Должно: `$active_task_path/planning/requirements.md`

3. **IMPLEMENT MODE** создает артефакты в:
   - ❌ `memory-bank/implementation/[task-name]-build-log.md`
   - ❌ `memory-bank/implementation/[task-name]-test-results.md`
   - ✅ Должно: `$active_task_path/implementation/build-log.md`

4. **QA MODE** создает артефакты в:
   - ❌ `memory-bank/qa/[task-name]-qa-report.md`
   - ❌ `memory-bank/qa/[task-name]-test-log.md`
   - ✅ Должно: `$active_task_path/qa/qa-report.md`

5. **REFLECT & ARCHIVE MODE** создает артефакты в:
   - ❌ `memory-bank/archive/[task-name]/`
   - ✅ Должно: `$active_task_path/reflection/` и `$active_task_path/release/`

## 🔧 ТЕХНИЧЕСКАЯ ИНФОРМАЦИЯ

### Связанные правила:
- `isolation_rules/Core/active-task-manager.mdc` - управление активными задачами
- `isolation_rules/Core/task-management-2-0.mdc` - Memory Bank 2.0.0 структура

### Функции для использования:
- `get_active_task_path()` - получение пути активной задачи
- `set_active_task(path)` - установка активной задачи

### Целевая структура:
```
memory-bank/tasks/[status]/[task-directory]/
├── _task.md                    # основная информация
├── _context.md                 # контекст и состояние
├── planning/                   # PLAN MODE артефакты
│   ├── requirements.md
│   ├── architecture.md
│   └── implementation-plan.md
├── creative/                   # CREATIVE MODE артефакты
│   ├── [component-name].md
│   └── style-guide.md
├── implementation/             # IMPLEMENT MODE артефакты
│   ├── build-log.md
│   └── test-results.md
├── qa/                        # QA MODE артефакты
│   ├── qa-report.md
│   ├── test-log.md
│   └── issues.md
├── reflection/                # REFLECT MODE артефакты
│   └── reflection.md
└── release/                   # ARCHIVE MODE артефакты
    ├── commit-message.txt
    ├── release-notes.md
    └── changelog.md
```

## 📊 ПРОГРЕСС

### Phase 1: Анализ ✅
- [x] Проблема идентифицирована
- [x] Задача создана
- [x] Контекст документирован

### Phase 2: Планирование 🔄
- [ ] Детальный анализ всех путей
- [ ] Создание mapping таблицы
- [ ] План обновления инструкций

### Phase 3: Реализация ⏳
- [ ] Обновление всех 6 режимов
- [ ] Тестирование изменений

### Phase 4: Верификация ⏳
- [ ] QA проверка
- [ ] Документация

## 🎯 СЛЕДУЮЩИЕ ШАГИ

1. **Рекомендуется режим:** PLAN
2. **Действие:** Создать детальный план обновления путей
3. **Приоритет:** Высокий (критическая проблема системы)

## 🔗 СВЯЗИ

- **Предшествующая задача:** 2025-06-21_ID-001_fetch-rules-validation
- **Обнаружено в:** QA фазе предыдущей задачи
- **Влияет на:** Все режимы Memory Bank системы

---

**Создано:** 2025-06-25 в UNIVERSAL режиме
**Готово для:** PLAN режима