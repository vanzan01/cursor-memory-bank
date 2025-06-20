# ПЛАН УДАЛЕНИЯ ФУНКЦИЙ РАБОТЫ С ПРАВИЛАМИ ИЗ VAN РЕЖИМА

**Дата создания**: 2025-06-20
**Сложность**: Level 2 (Simple Enhancement)
**Статус**: PLANNING

## 🎯 ЦЕЛЬ

Удалить все функции работы с правилами (VAN.RULES субрежим) из VAN режима, так как пользователь их не использует. Упростить VAN режим, сохранив только основной функционал.

## 📊 АНАЛИЗ ТЕКУЩЕГО СОСТОЯНИЯ

### Функции VAN.RULES для удаления:

**Команды VAN.RULES субрежима**:
- `VAN.RULES` - Активация rules management субрежима
- `VAN.RULES.INTEGRATE` - Интеграция .cursor правил с Memory Bank
- `VAN.RULES.MODIFY` - Модификация существующих правил через Cursor workaround
- `VAN.RULES.CREATE` - Создание новых пользовательских правил
- `VAN.RULES.VALIDATE` - Валидация всех правил на корректность
- `VAN.RULES.STATUS` - Проверка текущего статуса интеграции правил

**Файлы содержащие VAN.RULES функционал**:
1. `custom_modes/van_instructions.md` - основной файл VAN режима (содержит ссылки и команды)
2. `custom_modes/van_rules_submode.md` - полный файл VAN.RULES субрежима
3. `custom_modes/van_core_workflow.md` - может содержать ссылки на rules

**Функции для сохранения**:
- ✅ Стандартный VAN режим с task continuity
- ✅ Анализ сложности и определение complexity level
- ✅ Migration processing и integration unfinished tasks
- ✅ Context management и CONTINUE функциональность
- ✅ Web search integration
- ✅ VAN.SYSTEM субрежим (если используется)

## 📋 ДЕТАЛЬНЫЙ ПЛАН РЕАЛИЗАЦИИ

### Фаза 1: Анализ и инвентаризация

#### 1.1 Анализ van_instructions.md
- [ ] **Найти все упоминания VAN.RULES**:
  - Команды в разделе "UNIFIED VAN MODE COMMANDS"
  - Ссылки в навигации
  - Примеры использования
  - Rules loading секции

#### 1.2 Анализ van_rules_submode.md
- [ ] **Определить объем файла** для понимания масштаба удаления
- [ ] **Проверить зависимости** от других частей системы

#### 1.3 Анализ van_core_workflow.md
- [ ] **Найти упоминания rules management** в workflow диаграммах
- [ ] **Определить необходимость обновления** диаграмм

#### 1.4 Проверка .cursor правил
- [ ] **Проверить van-mode-map.mdc** на упоминания VAN.RULES
- [ ] **Определить необходимость обновления** правил в .cursor/

### Фаза 2: Планирование изменений

#### 2.1 Создание списка изменений для van_instructions.md
- [ ] **Удалить VAN.RULES команды** из раздела "UNIFIED VAN MODE COMMANDS"
- [ ] **Удалить navigation ссылку** на van_rules_submode.md
- [ ] **Удалить VAN.RULES Rules Loading** секцию
- [ ] **Удалить примеры использования** VAN.RULES
- [ ] **Обновить command routing** убрав VAN.RULES.*

#### 2.2 Решение по van_rules_submode.md
- [ ] **Решить**: удалить полностью или переместить в архив
- [ ] **Рекомендация**: переместить в `memory-bank/archive/` для истории

#### 2.3 Обновление документации
- [ ] **Обновить README.md** если есть упоминания VAN.RULES
- [ ] **Проверить другие документы** на ссылки на rules management

### Фаза 3: Реализация изменений

#### 3.1 Изменения в van_instructions.md
**Секции для удаления/изменения**:

1. **Navigation секция**:
```markdown
# УДАЛИТЬ ЭТУ СТРОКУ:
- 📋 **[Rules Submode](van_rules_submode.md)** - VAN.RULES management functionality
```

2. **VAN.RULES Submode Commands секция**:
```markdown
# УДАЛИТЬ ВЕСЬ БЛОК:
### VAN.RULES Submode Commands
- **`VAN.RULES`** - Activate rules management submode
- **`VAN.RULES.INTEGRATE`** - Integrate .cursor rules with Memory Bank
- **`VAN.RULES.MODIFY`** - Modify existing rules using Cursor workaround
- **`VAN.RULES.CREATE`** - Create new custom rules
- **`VAN.RULES.VALIDATE`** - Validate all rules for correctness
- **`VAN.RULES.STATUS`** - Check current rules integration status
```

3. **Command Processing Flow**:
```markdown
# ИЗМЕНИТЬ:
3. **Command Routing**: Route to appropriate processing flow:
   - `VAN` → Standard VAN with task continuity
   - `VAN.RULES.*` → Rules management flow  # УДАЛИТЬ ЭТУ СТРОКУ
   - `VAN.SYSTEM.*` → System administration flow
```

4. **VAN.RULES Mode Rules Loading**:
```markdown
# УДАЛИТЬ ВЕСЬ БЛОК:
### VAN.RULES Mode Rules Loading
```
fetch_rules([
  "isolation_rules/CustomWorkflow/git-workflow/branch-management",
  "isolation_rules/CustomWorkflow/implementation/dependency-checking",
  "isolation_rules/Core/hierarchical-rule-loading"
])
```
```

5. **Rules Integration секция**:
```markdown
# ИЗМЕНИТЬ ИЛИ УДАЛИТЬ УПОМИНАНИЯ RULES INTEGRATION
### Rules Integration
- `.cursor/rules/` - Original Cursor rules (via fetch_rules)
- `memory-bank/rules/` - Integrated Memory Bank rules  # ВОЗМОЖНО УДАЛИТЬ
- `rules/changing_the_rules.md` - Rules modification guide  # ВОЗМОЖНО УДАЛИТЬ
```

6. **Usage Examples**:
```markdown
# УДАЛИТЬ БЛОК:
### Rules Integration
```
User: VAN.RULES.INTEGRATE
Assistant: OK VAN.RULES
...
```
```

#### 3.2 Архивирование van_rules_submode.md
- [ ] **Переместить файл** в `memory-bank/archive/van_rules_submode_archived_2025-06-20.md`
- [ ] **Добавить заголовок архива** с датой и причиной архивирования

#### 3.3 Обновление van_core_workflow.md (если необходимо)
- [ ] **Проверить содержимое** на упоминания rules management
- [ ] **Обновить диаграммы** если есть VAN.RULES references

### Фаза 4: Тестирование и верификация

#### 4.1 Функциональное тестирование
- [ ] **Проверить команду VAN** - должна работать как обычно
- [ ] **Проверить task continuity** - migration processing должен работать
- [ ] **Проверить context management** - CONTINUE должен работать
- [ ] **Проверить VAN.SYSTEM** - если используется, должен работать

#### 4.2 Проверка документации
- [ ] **Проверить отсутствие битых ссылок** в van_instructions.md
- [ ] **Проверить навигацию** между файлами
- [ ] **Убедиться в отсутствии** упоминаний VAN.RULES

#### 4.3 Проверка целостности системы
- [ ] **Убедиться что основной VAN функционал** не нарушен
- [ ] **Проверить что все остальные режимы** работают корректно
- [ ] **Убедиться что Memory Bank система** функционирует нормально

## 🎯 ОЖИДАЕМЫЕ РЕЗУЛЬТАТЫ

### ✅ После реализации:

1. **VAN режим упрощен**:
   - Удалены все VAN.RULES команды и функции
   - Сохранен основной функционал VAN
   - Улучшена читаемость и простота использования

2. **Сохранен важный функционал**:
   - ✅ Standard VAN с task continuity
   - ✅ Migration processing
   - ✅ Context management (CONTINUE)
   - ✅ Web search integration
   - ✅ VAN.SYSTEM (если используется)

3. **Документация обновлена**:
   - ✅ Удалены ссылки на VAN.RULES
   - ✅ Обновлена навигация
   - ✅ Нет битых ссылок

4. **Система остается стабильной**:
   - ✅ Все остальные режимы работают
   - ✅ Memory Bank функционирует нормально
   - ✅ Целостность системы сохранена

## 📝 ПРИМЕЧАНИЯ

### Что НЕ удаляем:
- ❌ Основной VAN функционал (complexity analysis, task continuity)
- ❌ VAN.SYSTEM субрежим (может быть полезен)
- ❌ Context management функции
- ❌ Web search integration
- ❌ Migration processing

### Что удаляем:
- ✅ Все VAN.RULES команды
- ✅ van_rules_submode.md файл (архивируем)
- ✅ Rules management функционал
- ✅ Примеры использования VAN.RULES
- ✅ Navigation ссылки на rules submode

## 🔄 СЛЕДУЮЩИЕ ШАГИ

После завершения планирования:
1. **Переход в IMPLEMENT режим** для выполнения изменений
2. **Следование процедуре** из changing_the_rules.md если нужно изменить .cursor правила
3. **Тестирование изменений** на работоспособность
4. **Обновление документации** при необходимости

---

**План готов к реализации. Переход в IMPLEMENT режим для выполнения изменений.**