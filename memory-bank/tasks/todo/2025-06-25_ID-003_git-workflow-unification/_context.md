# КОНТЕКСТ: Git Workflow Unification

**Задача**: 2025-06-25_ID-003_git-workflow-unification
**Создано**: 2025-06-25
**Статус**: TODO

## 📊 АНАЛИЗ ТЕКУЩЕГО СОСТОЯНИЯ

### Обнаруженные проблемы

#### 1. Автоматические git операции в backup-system.mdc.md
```bash
# Примеры из _cursor/rules/isolation_rules/CustomWorkflow/workflow/backup-system.mdc.md:
git commit -m "AUTO-BACKUP: Before $(echo $MODE) mode transition - $(date)"
git commit -m "AUTO-BACKUP: Before critical operation - $(date)"
git push origin "backup-$(date +%Y%m%d-%H%M%S)"
```

#### 2. Множественные git операции в git-workflow/
- `commit-strategies.mdc.md` - стратегии коммитов
- `branch-management.mdc.md` - управление ветками с push операциями
- `backup-verification.mdc.md` - автоматические backup с push
- `change-documentation.mdc.md` - документирование изменений

#### 3. Отсутствие интеграции с interaction-mode
Существует файл `_cursor/rules/isolation_rules/CustomWorkflow/system/interaction-mode-control.mdc.md`, но git операции его не используют.

### Текущие настройки interaction-mode

Из анализа `interaction-mode-control.mdc.md`:
- Файл конфигурации: `memory-bank/system/interaction-mode.txt`
- Режимы: AUTO/MANUAL
- По умолчанию: MANUAL
- Проверка в режимах: VAN, PLAN, CREATIVE

## 🔍 ДЕТАЛЬНЫЙ АНАЛИЗ

### Git операции в правилах (_cursor/)

1. **backup-system.mdc.md**:
   - 3 прямых git commit
   - 1 git push
   - Автоматический backup без согласия пользователя

2. **branch-management.mdc.md**:
   - 6 git push операций
   - 2 git push --force-with-lease
   - 1 git revert

3. **backup-verification.mdc.md**:
   - 1 git stash push
   - 3 git push операций
   - git for-each-ref операции

### Git операции в режимах (custom_modes/)

Анализ показал, что режимы НЕ содержат прямых git команд, но:
- Ссылаются на правила, которые содержат git операции
- Используют `fetch_rules()` для загрузки git-workflow правил
- Не проверяют interaction-mode перед git операциями

## 🎯 ПЛАН РЕШЕНИЯ

### Фаза 1: Создание Git Operations Controller
1. Создать `_cursor/rules/isolation_rules/Core/git-workflow-controller.mdc.md`
2. Интегрировать с interaction-mode-control
3. Создать единые функции для git операций

### Фаза 2: Обновление существующих правил
1. Обновить `backup-system.mdc.md`
2. Обновить все файлы в `git-workflow/`
3. Заменить прямые git команды на вызовы контроллера

### Фаза 3: Обновление режимов
1. Добавить загрузку git-workflow-controller во все режимы
2. Обновить документацию режимов
3. Добавить проверки interaction-mode

### Фаза 4: Тестирование и валидация
1. Протестировать в MANUAL режиме
2. Протестировать в AUTO режиме
3. Проверить обратную совместимость

## 📋 ПРИОРИТЕТЫ

### Высокий приоритет
- Остановить автоматические git операции без согласия
- Создать единую точку контроля
- Интегрировать с interaction-mode

### Средний приоритет
- Стандартизировать commit messages
- Улучшить логирование git операций
- Создать документацию

### Низкий приоритет
- Оптимизация производительности
- Расширенные функции git workflow
- Интеграция с CI/CD

## 🚨 РИСКИ И ОГРАНИЧЕНИЯ

### Риски
1. **Нарушение существующих workflow** - существующие скрипты могут сломаться
2. **Производительность** - дополнительные проверки могут замедлить работу
3. **Пользовательский опыт** - частые запросы подтверждения в MANUAL режиме

### Ограничения
1. **Обратная совместимость** - нужно поддерживать старые вызовы
2. **Платформы** - git команды могут отличаться на разных ОС
3. **Отсутствие git** - система должна работать без git

## 📚 СПРАВОЧНАЯ ИНФОРМАЦИЯ

### Ключевые файлы для изучения
- `_cursor/rules/isolation_rules/CustomWorkflow/system/interaction-mode-control.mdc.md`
- `_cursor/rules/isolation_rules/CustomWorkflow/workflow/backup-system.mdc.md`
- `_cursor/rules/isolation_rules/CustomWorkflow/git-workflow/` (все файлы)

### Связанные задачи
- 2025-06-25_ID-002_artifact-paths-unification (завершена)
- Возможные будущие задачи по CI/CD интеграции

---

**Обновлено**: 2025-06-25
**Следующий шаг**: Переход в PLAN режим для детального планирования