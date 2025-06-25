# TASK: Проверка и исправление вызовов fetch_rules

**Дата создания**: 2025-06-21
**ID**: ID-001
**Статус**: COMPLETED ✅✅ (QA PASSED)
**Приоритет**: HIGH

## 📋 Описание задачи

Проверить все файлы в директориях `_cursor` и `custom_modes` на предмет корректного использования функции `fetch_rules` для загрузки правил вместо прямых вызовов `read_file` и прямых ссылок на файлы `.mdc`.

## 🎯 Цели

- [x] Проанализировать все файлы в `_cursor/**/*.mdc.md`
- [x] Проанализировать все файлы в `custom_modes/**/*.md`
- [x] Найти все места, где используются прямые вызовы `read_file` для загрузки правил
- [x] Заменить их на корректные вызовы `fetch_rules`
- [x] Убедиться, что globs остаются с расширением `.mdc` (как указано пользователем)
- [x] **QA: Найти прямые ссылки на файлы `.mdc` в диаграммах**
- [x] **QA: Заменить прямые ссылки на инструкции `fetch_rules`**

## 📊 Текущий прогресс

### Анализ
- [x] Создана задача
- [x] Проведен поиск всех вызовов `read_file` в `_cursor`
- [x] Проведен поиск всех вызовов `read_file` в `custom_modes`
- [x] Проведен поиск всех вызовов `fetch_rules`
- [x] Составлен список файлов для исправления
- [x] **QA: Поиск прямых ссылок на `.mdc` файлы**

### Исправления
- [x] Исправлены файлы в `custom_modes` (read_file → fetch_rules)
- [x] **QA: Исправлены прямые ссылки на `.mdc` в диаграммах**
- [x] Проведена финальная проверка

## 🔍 QA: Исправленные прямые ссылки на файлы .mdc

### ✅ Исправлены прямые ссылки в диаграммах Mermaid:

#### 1. **creative_instructions.md** - исправлено 5 прямых ссылок:
- ✅ Line 6: `.cursor/rules/.../main-optimized.mdc` → `fetch_rules([main-optimized.mdc])`
- ✅ Line 9: `.cursor/rules/.../creative-mode-map.mdc` → `fetch_rules([creative-mode-map.mdc])`
- ✅ Line 14: Architecture → `fetch_rules([creative-mode-map.mdc])`
- ✅ Line 15: Algorithm → `fetch_rules([creative-mode-map.mdc])`
- ✅ Line 16: UI/UX → `fetch_rules([creative-mode-map.mdc])`

#### 2. **plan_instructions.md** - исправлено 4 прямых ссылки:
- ✅ Line 6: `main-optimized.mdc` → `fetch_rules([main-optimized.mdc])`
- ✅ Line 12-14: `plan-mode-map.mdc` (3x) → `fetch_rules([plan-mode-map.mdc])`

#### 3. **implement_instructions.md** - исправлено 5 прямых ссылок:
- ✅ Line 6: `command-execution.mdc` → `fetch_rules([command-execution.mdc])`
- ✅ Line 14,22,30: `implement-mode-map.mdc` (3x) → `fetch_rules([implement-mode-map.mdc])`
- ✅ Line 46: `command-execution.mdc` → `fetch_rules([command-execution.mdc])`

#### 4. **qa_instructions.md** - исправлено 2 прямых ссылки:
- ✅ Line 6: `web-search-integration.mdc` → `fetch_rules([web-search-integration.mdc])`
- ✅ Line 8: `qa-mode-map.mdc` → `fetch_rules([qa-mode-map.mdc])`

#### 5. **reflect_archive_instructions.md** - исправлено 3 прямых ссылки:
- ✅ Line 143: `main-optimized.mdc` → `fetch_rules([main-optimized.mdc])`
- ✅ Line 148: `reflect-mode-map.mdc` → `fetch_rules([reflect-mode-map.mdc])`
- ✅ Line 166: `archive-mode-map.mdc` → `fetch_rules([archive-mode-map.mdc])`

#### 6. **design_instructions.md** - исправлено 6 прямых ссылок:
- ✅ Line 6: `main-optimized.mdc` → `fetch_rules([main-optimized.mdc])`
- ✅ Line 12-14: `plan-mode-map.mdc` (3x) → `fetch_rules([plan-mode-map.mdc])`
- ✅ Line 52-54: `creative-mode-map.mdc` (3x) → `fetch_rules([creative-mode-map.mdc])`

#### 7. **universal_instructions.md** - исправлено 2 прямых ссылки:
- ✅ Line 102: `universal-mode-integration.mdc` → `fetch_rules([universal-mode-integration.mdc])`
- ✅ Line 103: `web-search-integration.mdc` → `fetch_rules([web-search-integration.mdc])`

### 📊 Полная статистика исправлений:

#### Этап 1 (read_file → fetch_rules):
- **Файлов исправлено**: 6
- **Вызовов read_file заменено**: 28
- **Вызовов fetch_rules создано**: 15

#### Этап 2 (прямые ссылки → fetch_rules):
- **Файлов исправлено**: 7
- **Прямых ссылок заменено**: 27
- **Инструкций fetch_rules создано**: 27

#### Общий итог:
- **Всего файлов обработано**: 13 (уникальных)
- **Всего исправлений**: 55
- **Финальная проверка**: ✅ PASSED - нет прямых ссылок на .mdc

## ✅ Критерии готовности

- [x] Все вызовы правил используют `fetch_rules`
- [x] Globs в правилах остаются с расширением `.mdc`
- [x] Нет прямых вызовов `read_file` для загрузки правил
- [x] **Нет прямых ссылок на файлы `.mdc` в диаграммах**
- [x] Все файлы проверены и исправлены

## 🎉 ЗАДАЧА ПОЛНОСТЬЮ ЗАВЕРШЕНА!

**✅ УСПЕШНО ВЫПОЛНЕНО:**

1. **Этап 1**: Все прямые вызовы `read_file` для загрузки правил заменены на `fetch_rules`
2. **Этап 2 (QA)**: Все прямые ссылки на файлы `.mdc` в диаграммах Mermaid заменены на инструкции `fetch_rules`
3. **Качество**: Globs сохраняют расширение `.mdc` как требовалось
4. **Проверка**: Финальная проверка подтвердила отсутствие прямых ссылок

**🚀 СИСТЕМА ГОТОВА:**
Теперь можете безопасно переименовать файлы `_cursor/**/*.mdc.md` обратно в `.cursor/**/*.mdc` - все ссылки и вызовы будут работать корректно!