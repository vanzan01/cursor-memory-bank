# FOLDER HIERARCHY ARCHITECTURE

**Дата создания**: 2025-06-11
**Статус**: CREATIVE SOLUTION
**Компонент**: Folder Structure & Organization

---

## 🎯 ПРОБЛЕМА

Как спроектировать оптимальную структуру папок для tasks/{todo,in_progress,done} с поддержкой масштабируемости, быстрого поиска и эффективной архивации?

---

## 🧠 CREATIVE ANALYSIS

### Исследование файловых систем:

**Best Practices from Research:**
- **Maximum 3-level depth**: Глубже становится сложно навигировать
- **Feature-based organization**: Лучше чем type-based для проектов
- **Descriptive naming**: Имена должны быть понятными без контекста
- **Scalable structure**: Должна расти без реорганизации

**Task Management Insights:**
- **Status-based folders**: Четкое разделение по статусам выполнения
- **Time-based archiving**: Архивация по временным периодам
- **Project-based grouping**: Группировка связанных задач
- **Priority-based access**: Быстрый доступ к критичным задачам

---

## 🏗️ АРХИТЕКТУРНОЕ РЕШЕНИЕ

### 1. PRIMARY STRUCTURE

```
memory-bank/
├── tasks/
│   ├── todo/
│   │   ├── critical/
│   │   ├── high/
│   │   ├── medium/
│   │   └── low/
│   ├── in_progress/
│   │   ├── active/
│   │   ├── blocked/
│   │   └── review/
│   ├── done/
│   │   ├── 2025/
│   │   │   ├── 01-january/
│   │   │   ├── 02-february/
│   │   │   └── ...
│   │   └── archive/
│   │       ├── 2024/
│   │       └── 2023/
│   └── templates/
│       ├── task-template.md
│       ├── project-template.md
│       └── epic-template.md
├── projects/
│   ├── active/
│   │   ├── YYYY-MM-DD-project-name/
│   │   │   ├── tasks/
│   │   │   ├── docs/
│   │   │   └── resources/
│   │   └── ...
│   ├── completed/
│   │   └── YYYY-MM-DD-project-name/
│   └── on_hold/
└── contexts/
    ├── task-contexts/
    │   ├── YYYY-MM-DD-task-name.context.md
    │   └── ...
    └── project-contexts/
        ├── project-name.context.md
        └── ...
```

### 2. DETAILED FOLDER SPECIFICATIONS

#### A. TODO Structure

**Приоритетная организация для быстрого доступа:**

```
todo/
├── critical/          # Блокирующие задачи, требуют немедленного внимания
├── high/             # Важные задачи с дедлайнами
├── medium/           # Плановые задачи
└── low/              # Задачи "когда будет время"
```

**Naming Pattern:**
- `YYYY-MM-DD-PRIORITY-CATEGORY-task-name.md`
- Автоматическая сортировка по дате создания
- Визуальная группировка по приоритету

#### B. IN_PROGRESS Structure

**Статусная организация для управления workflow:**

```
in_progress/
├── active/           # Активно выполняемые задачи
├── blocked/          # Заблокированные зависимостями
└── review/           # Ожидают проверки/approval
```

**Rules:**
- Максимум 3-5 задач в `active/` одновременно (WIP limit)
- `blocked/` задачи требуют регулярного review
- `review/` автоматически перемещаются в `done/` после approval

#### C. DONE Structure

**Временная архивация с возможностью поиска:**

```
done/
├── 2025/
│   ├── 01-january/
│   │   ├── weeks/
│   │   │   ├── week-01/
│   │   │   ├── week-02/
│   │   │   └── ...
│   │   └── monthly-summary.md
│   ├── 02-february/
│   └── ...
└── archive/
    ├── 2024/
    │   ├── annual-summary.md
    │   └── months/
    └── 2023/
```

**Archive Rules:**
- Задачи старше 1 года автоматически архивируются
- Monthly summaries содержат ссылки на все задачи месяца
- Annual summaries для долгосрочной ретроспективы

### 3. PROJECT-BASED ORGANIZATION

```
projects/
├── active/
│   ├── 2025-06-11-memory-bank-reorganization/
│   │   ├── tasks/
│   │   │   ├── todo/
│   │   │   ├── in_progress/
│   │   │   └── done/
│   │   ├── docs/
│   │   │   ├── requirements.md
│   │   │   ├── architecture.md
│   │   │   └── meeting-notes/
│   │   ├── resources/
│   │   │   ├── research/
│   │   │   └── assets/
│   │   └── project.md (main project file)
│   └── ...
├── completed/
│   └── 2025-05-15-user-authentication/
└── on_hold/
    └── 2025-04-20-mobile-app/
```

### 4. INDEXING SYSTEM

#### A. Master Index Files

**tasks/index.md**
```markdown
# TASK INDEX

## Quick Access
- [[critical-tasks.md]] - Критические задачи
- [[weekly-plan.md]] - План на неделю
- [[monthly-goals.md]] - Цели месяца

## By Status
- [[todo-index.md]] - Все запланированные задачи
- [[in-progress-index.md]] - Активные задачи
- [[done-index.md]] - Завершенные задачи

## By Category
- [[system-tasks.md]] - Системные задачи
- [[feature-tasks.md]] - Новые функции
- [[bug-tasks.md]] - Исправления ошибок
```

#### B. Auto-Generated Indexes

**Automated daily updates:**
- `critical-tasks.md` - автоматически обновляется из todo/critical/
- `weekly-plan.md` - задачи на текущую неделю
- `overdue-tasks.md` - просроченные задачи

### 5. SEARCH AND NAVIGATION

#### A. Tag-Based Organization

```markdown
# Tags Structure
#priority:critical #priority:high #priority:medium #priority:low
#category:system #category:feature #category:bug #category:docs
#status:todo #status:progress #status:blocked #status:review #status:done
#project:memory-bank #project:auth #project:mobile
#time:quick #time:medium #time:long
```

#### B. Quick Navigation Files

**navigation.md**
```markdown
# QUICK NAVIGATION

## Today's Focus
- [[today-tasks.md]] - Задачи на сегодня
- [[urgent-items.md]] - Срочные элементы

## This Week
- [[week-plan.md]] - План недели
- [[week-review.md]] - Обзор недели

## Projects
- [[active-projects.md]] - Активные проекты
- [[project-status.md]] - Статус проектов
```

### 6. AUTOMATION RULES

#### A. File Movement Rules

```bash
# Pseudo-automation rules
IF task.status == "DONE" THEN
  MOVE task FROM in_progress/ TO done/YYYY/MM-month/
  UPDATE monthly-summary.md
  ADD to weekly-summary.md

IF task.priority == "CRITICAL" AND task.status == "TODO" THEN
  MOVE task TO todo/critical/
  NOTIFY user
  ADD to urgent-items.md

IF task.created_date < (today - 365 days) AND task.status == "DONE" THEN
  MOVE task TO archive/YYYY/
  UPDATE annual-summary.md
```

#### B. Index Updates

```bash
# Auto-update indexes
DAILY:
  UPDATE critical-tasks.md
  UPDATE today-tasks.md
  UPDATE overdue-tasks.md

WEEKLY:
  UPDATE week-plan.md
  CREATE week-review.md
  UPDATE project-status.md

MONTHLY:
  CREATE monthly-summary.md
  UPDATE monthly-goals.md
  ARCHIVE old tasks
```

---

## 🔧 IMPLEMENTATION STRATEGY

### Phase 1: Core Structure Creation
```bash
mkdir -p memory-bank/tasks/{todo/{critical,high,medium,low},in_progress/{active,blocked,review},done/2025,templates}
mkdir -p memory-bank/projects/{active,completed,on_hold}
mkdir -p memory-bank/contexts/{task-contexts,project-contexts}
```

### Phase 2: Template Files
- Create task-template.md
- Create project-template.md
- Create index templates

### Phase 3: Migration Scripts
- Analyze existing tasks.md
- Sort tasks by priority and status
- Move to appropriate folders
- Create initial indexes

### Phase 4: Automation Setup
- Daily index updates
- Weekly summaries
- Monthly archiving

---

## 🎯 ПРЕИМУЩЕСТВА АРХИТЕКТУРЫ

1. **Быстрый доступ**: Приоритетная структура в todo/
2. **Ясный workflow**: Статусы в in_progress/
3. **Эффективная архивация**: Временная структура в done/
4. **Масштабируемость**: Проектная организация
5. **Поиск**: Мощная система индексов
6. **Автоматизация**: Правила перемещения файлов
7. **Навигация**: Быстрые ссылки и индексы
8. **Контекст**: Отдельное хранение контекстов

---

## 📊 МЕТРИКИ ЭФФЕКТИВНОСТИ

### Performance Targets:
- **File Access Time**: < 2 секунд до любой задачи
- **Search Time**: < 5 секунд поиск по всем задачам
- **Navigation Depth**: Максимум 3 клика до любой задачи
- **Archive Efficiency**: 95% задач находятся за < 10 секунд

### Scalability Metrics:
- **Task Capacity**: 10,000+ задач без деградации
- **Project Capacity**: 100+ проектов одновременно
- **Archive Capacity**: 5+ лет истории
- **Index Update Time**: < 30 секунд для полного обновления

---

**CREATIVE SOLUTION STATUS**: ✅ **COMPLETE**
**Ready for Implementation**: YES
**Estimated Implementation Time**: 3-4 hours