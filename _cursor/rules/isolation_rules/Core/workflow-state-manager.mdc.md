---
description: "Управляет состоянием пошагового рабочего процесса (STEP_BY_STEP)."
globs: "**/step_by_step_instructions.md"
alwaysApply: true
---

# WORKFLOW STATE MANAGER

> **TL;DR:** Этот модуль определяет механизм отслеживания состояния для режима `STEP_BY_STEP` с помощью файла `memory-bank/system/workflow-state.txt`.

## ⚙️ Файл состояния

-   **Путь:** `memory-bank/system/workflow-state.txt`
-   **Назначение:** Хранит идентификатор последней успешно завершенной фазы.

## 🚦 Возможные состояния

-   `START`: Начальное состояние перед запуском `VAN`.
-   `VAN_COMPLETE`: Фаза `VAN` завершена.
-   `PLAN_COMPLETE`: Фаза `PLAN` завершена.
-   `CREATIVE_COMPLETE`: Фаза `CREATIVE` завершена.
-   `IMPLEMENT_COMPLETE`: Фаза `IMPLEMENT` завершена.
-   `QA_COMPLETE`: Фаза `QA` завершена.
-   `REFLECT_COMPLETE`: Фаза `REFLECT` завершена.
-   `ARCHIVE_COMPLETE`: Полный цикл завершен, готов к новому запуску.

Режим `STEP_BY_STEP` должен читать этот файл, чтобы определить, какую фазу выполнять следующей, и обновлять его после успешного завершения.