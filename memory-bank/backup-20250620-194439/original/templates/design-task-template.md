# DESIGN TASK TEMPLATE

## Структура DESIGN задачи в tasks.md

```markdown
#### [STATUS] DESIGN: [TASK_NAME]
**Дата создания**: [CURRENT_DATE]
**Сложность**: Level [1-4] ([COMPLEXITY_NAME])
**Приоритет**: [HIGH|MEDIUM|LOW]
**Статус**: [PLANNING|CREATIVE|FINALIZATION|COMPLETE]
**Режим**: DESIGN

**Описание**:
[Детальное описание задачи]

**Цель**: [Основная цель задачи]

**DESIGN Phase Tracking**:
- 📋 **Planning Phase**: [COMPLETE ✅|IN_PROGRESS 🔄|NOT_STARTED ⏳]
  - [x] Определение уровня сложности
  - [x] Анализ требований
  - [x] Идентификация компонентов
  - [x] Создание базового плана
  - [x] Флагирование компонентов для creative работы

- 🎨 **Creative Phase**: [COMPLETE ✅|IN_PROGRESS 🔄|NOT_REQUIRED ❌|NOT_STARTED ⏳]
  - [ ] Определение типа creative работы
  - [ ] Генерация опций для каждого компонента
  - [ ] Анализ pros/cons
  - [ ] Выбор рекомендуемого подхода
  - [ ] Создание implementation guidelines

- 📝 **Finalization Phase**: [COMPLETE ✅|IN_PROGRESS 🔄|NOT_STARTED ⏳]
  - [ ] Интеграция creative результатов в план
  - [ ] Обновление Memory Bank
  - [ ] Финализация implementation плана
  - [ ] Подготовка к IMPLEMENT режиму

**Creative Components Identified**:
- [COMPONENT_1]: [Architecture|Algorithm|UI-UX] - [STATUS]
- [COMPONENT_2]: [Architecture|Algorithm|UI-UX] - [STATUS]
- [COMPONENT_3]: [Architecture|Algorithm|UI-UX] - [STATUS]

**Implementation Plan**: [LINK_TO_PLAN]
**Creative Decisions**: [LINK_TO_CREATIVE_DOCS]

**Файлы в работе**:
- memory-bank/system/current-context.md
- implementation-plan.md
- memory-bank/creative/design-mode-decisions/[TASK-ID]/
- [other-project-files]

**Следующие шаги**:
1. [NEXT_STEP_1]
2. [NEXT_STEP_2]
3. [NEXT_STEP_3]

**Критерии завершения**:
- [ ] Все фазы DESIGN режима завершены
- [ ] Implementation план готов
- [ ] Creative decisions документированы
- [ ] Готовность к IMPLEMENT режиму
```

## Поддерживаемые статусы

### Основные статусы:
- **PLANNING**: Выполняется Planning Phase
- **CREATIVE**: Выполняется Creative Phase
- **FINALIZATION**: Выполняется Finalization Phase
- **COMPLETE**: Все фазы завершены, готов к IMPLEMENT

### Детальные статусы фаз:
- **COMPLETE ✅**: Фаза полностью завершена
- **IN_PROGRESS 🔄**: Фаза в процессе выполнения
- **NOT_STARTED ⏳**: Фаза еще не начата
- **NOT_REQUIRED ❌**: Фаза не требуется для данной задачи

## Creative Components Tracking

### Типы creative работы:
- **Architecture**: Архитектурные решения, системный дизайн
- **Algorithm**: Алгоритмические решения, структуры данных
- **UI-UX**: Пользовательские интерфейсы, взаимодействие

### Статусы компонентов:
- **IDENTIFIED**: Компонент идентифицирован для creative работы
- **IN_PROGRESS**: Creative работа в процессе
- **COMPLETE**: Creative решение принято
- **INTEGRATED**: Решение интегрировано в план

## Integration Points

### С существующими задачами:
- DESIGN задачи совместимы с существующей структурой
- Можно конвертировать PLAN задачи в DESIGN
- Можно конвертировать CREATIVE задачи в DESIGN

### С Memory Bank системой:
- Автоматическое создание creative documentation
- Интеграция с implementation-plan.md
- Tracking в progress.md
- Context preservation в current-context.md

## Примеры использования

### Level 2 DESIGN задача (без creative фазы):
```markdown
#### [COMPLETE] DESIGN: Простое улучшение UI
**Режим**: DESIGN
**Creative Phase**: NOT_REQUIRED ❌
**Planning Phase**: COMPLETE ✅
**Finalization Phase**: COMPLETE ✅
```

### Level 3 DESIGN задача (с creative фазой):
```markdown
#### [CREATIVE] DESIGN: Новая архитектура системы
**Режим**: DESIGN
**Creative Phase**: IN_PROGRESS 🔄
**Planning Phase**: COMPLETE ✅
**Creative Components Identified**:
- Database Layer: Architecture - IN_PROGRESS
- API Design: Architecture - COMPLETE
- Frontend Integration: UI-UX - IDENTIFIED
```

### Level 4 DESIGN задача (комплексная):
```markdown
#### [FINALIZATION] DESIGN: Полная реструктуризация
**Режим**: DESIGN
**Planning Phase**: COMPLETE ✅
**Creative Phase**: COMPLETE ✅
**Finalization Phase**: IN_PROGRESS 🔄
**Creative Components**:
- System Architecture: Architecture - INTEGRATED
- Performance Algorithms: Algorithm - INTEGRATED
- User Experience: UI-UX - INTEGRATED
```