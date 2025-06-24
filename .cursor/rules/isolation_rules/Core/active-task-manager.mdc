---
description: "Управляет активной задачей, читая и записывая путь в current-task.txt."
globs: "**/**"
alwaysApply: true
---

# ACTIVE TASK MANAGER

> **TL;DR:** Этот модуль определяет текущую активную задачу, читая путь из `memory-bank/system/current-task.txt`. Все операции (чтение/запись контекста, задач и т.д.) должны использовать этот путь для определения рабочей директории.

## ⚙️ Основные функции

### 1. Получение пути к активной задаче

```bash
# Эта функция должна использоваться всеми правилами для доступа к файлам задачи
function get_active_task_path() {
  local state_file="memory-bank/system/current-task.txt"
  if [ -f "$state_file" ]; then
    cat "$state_file"
  else
    echo "" # Нет активной задачи
  fi
}
```

### 2. Установка новой активной задачи

```bash
# Эта функция вызывается при создании новой задачи или переключении на существующую
function set_active_task() {
  local task_path="$1" # e.g., memory-bank/tasks/in_progress/2025-06-25_ID-001...
  local state_file="memory-bank/system/current-task.txt"
  echo "$task_path" > "$state_file"
  echo "✅ Active task set to: $task_path"
}
```