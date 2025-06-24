---
description: "Централизованно управляет путями к артефактам внутри директории активной задачи."
globs: "**/**"
alwaysApply: true
---

# TASK ARTIFACT MANAGER

> **TL;DR:** Этот модуль является единым источником правды для всех путей *внутри* директории активной задачи. Вместо того чтобы конструировать пути вручную, другие правила должны вызывать функции этого менеджера для получения канонических путей.

## 🗺️ Каноническая структура директории задачи

```mermaid
graph TD
    TaskDir["<b>Активная задача</b><br>(.../ID-001_task/)"] --> TaskFile["_task.md"]
    TaskDir --> ContextFile["_context.md"]
    TaskDir --> ReflectionFile["_reflection.md"]
    TaskDir --> ArchiveFile["_archive.md"]
    TaskDir --> CreativeDir["creative/"]
    TaskDir --> ReportsDir["reports/"]
    TaskDir --> ReleaseDir["release/"]

    ReleaseDir --> CommitMsg["_commit_message.txt"]
    ReleaseDir --> ReleaseNotes["_release_notes.md"]

    style TaskDir fill:#ffad42,stroke:#f57c00
```

## ⚙️ Функции-хелперы для получения путей

**ВАЖНО:** Эти функции предполагают, что правило `Core/active-task-manager.mdc` уже загружено и функция `get_active_task_path()` доступна.

```bash
# Эта функция из active-task-manager.mdc, от которой мы зависим
function get_active_task_path() { ... }

# ===== НОВЫЕ ФУНКЦИИ-ХЕЛПЕРЫ =====

# Получить путь к основному файлу задачи (_task.md)
function get_task_file_path() {
  local active_path
  active_path=$(get_active_task_path)
  if [ -n "$active_path" ]; then
    echo "$active_path/_task.md"
  fi
}

# Получить путь к файлу контекста задачи (_context.md)
function get_context_file_path() {
  local active_path
  active_path=$(get_active_task_path)
  if [ -n "$active_path" ]; then
    echo "$active_path/_context.md"
  fi
}

# Получить путь к файлу рефлексии задачи (_reflection.md)
function get_reflection_file_path() {
  local active_path
  active_path=$(get_active_task_path)
  if [ -n "$active_path" ]; then
    echo "$active_path/_reflection.md"
  fi
}

# Получить путь к директории с артефактами релиза (release/)
function get_release_path() {
  local active_path
  active_path=$(get_active_task_path)
  if [ -n "$active_path" ]; then
    echo "$active_path/release"
  fi
}

# Получить путь к файлу с сообщением для коммита
function get_commit_message_file_path() {
  local release_path
  release_path=$(get_release_path)
  if [ -n "$release_path" ]; then
    echo "$release_path/_commit_message.txt"
  fi
}

# Получить путь к файлу с заметками для релиза
function get_release_notes_file_path() {
  local release_path
  release_path=$(get_release_path)
  if [ -n "$release_path" ]; then
    echo "$release_path/_release_notes.md"
  fi
}