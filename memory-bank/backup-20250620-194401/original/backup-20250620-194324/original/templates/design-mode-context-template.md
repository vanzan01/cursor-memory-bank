# DESIGN MODE CONTEXT TEMPLATE

**Последнее обновление**: [CURRENT_DATE]
**Статус**: ACTIVE

## 🎯 ТЕКУЩИЙ ЗАПРОС ПОЛЬЗОВАТЕЛЯ
```
[CURRENT_USER_REQUEST_OR_CONTINUE_FROM_VAN]
```

## 🔧 ТЕКУЩИЙ РЕЖИМ РАБОТЫ
**Активный режим**: DESIGN
**Фаза**: [Planning Phase | Creative Phase | Finalization Phase]
**Уровень сложности**: [FROM_VAN_ANALYSIS]

## 📋 КОНТЕКСТ ЗАДАЧИ
**Задача**: [TASK_FROM_VAN_OR_NEW]
**Приоритет**: [HIGH|MEDIUM|LOW]
**Статус**: IN_PROGRESS

### Описание:
[DETAILED_DESIGN_CONTEXT]

### Текущий прогресс:
- [x] Переход в DESIGN режим
- [ ] 📋 Planning Phase: Анализ требований и создание плана
  - [ ] Определение уровня сложности
  - [ ] Анализ требований
  - [ ] Идентификация компонентов
  - [ ] Создание базового плана
  - [ ] Флагирование компонентов для creative работы
- [ ] 🎨 Creative Phase: Проработка дизайнерских решений (если требуется)
  - [ ] Определение типа creative работы
  - [ ] Генерация опций
  - [ ] Анализ pros/cons
  - [ ] Выбор рекомендуемого подхода
  - [ ] Создание implementation guidelines
- [ ] 📝 Finalization: Интеграция результатов и подготовка к реализации
  - [ ] Интеграция creative результатов в план
  - [ ] Обновление Memory Bank
  - [ ] Финализация плана
  - [ ] Переход к IMPLEMENT

## 🗂️ ФАЙЛЫ В РАБОТЕ
- memory-bank/system/current-context.md
- memory-bank/tasks.md
- implementation-plan.md
- memory-bank/creative/[project-specific-files]

## 📊 МЕТРИКИ СЕССИИ
**Время начала**: [CURRENT_DATE]
**Команды выполнено**: [INCREMENTED]
**Файлов изменено**: [INCREMENTED]
**Статус сессии**: ACTIVE - DESIGN MODE

## 🎨 CREATIVE PHASE TRACKING (если активна)
**Текущий компонент**: [COMPONENT_NAME]
**Тип creative работы**: [Architecture|Algorithm|UI-UX]
**Сгенерированные опции**: [OPTION_COUNT]
**Выбранный подход**: [SELECTED_APPROACH]

## 📋 PLANNING PHASE TRACKING
**Анализированные компоненты**: [COMPONENT_LIST]
**Компоненты для creative работы**: [CREATIVE_COMPONENTS]
**Базовый план**: [PLAN_STATUS]
**Готовность к creative фазе**: [READY|NOT_READY]

## 🔄 PHASE TRANSITIONS
**Последний переход**: [PREVIOUS_PHASE] → [CURRENT_PHASE]
**Причина перехода**: [TRANSITION_REASON]
**Следующий планируемый переход**: [NEXT_PHASE]

## 🚨 WARNINGS & ALERTS
- [WARNING_MESSAGE_IF_ANY]

## 📝 NOTES
[ADDITIONAL_CONTEXT_NOTES]