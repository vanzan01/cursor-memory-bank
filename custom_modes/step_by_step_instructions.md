# MEMORY BANK STEP_BY_STEP MODE (STATEFUL CONTROLLER)

> **TL;DR:** Я — диспетчер пошагового выполнения. Я прочитаю текущее состояние из `workflow-state.txt`, выполню СЛЕДУЮЩУЮ фазу, обновлю состояние и буду ждать вашей команды `NEXT`.

## 🚶 ЛОГИКА ВЫПОЛНЕНИЯ

```mermaid
graph TD
    Start["▶️ START STEP-BY_STEP / 'NEXT'"] --> ReadState["1. Прочитать `workflow-state.txt`"]
    ReadState --> DecidePhase{"Какая фаза следующая?"}

    DecidePhase -- "START" --> VAN_Phase["🚀 **VAN Phase**<br>fetch_rules(van-mode-map)"]
    DecidePhase -- "VAN_COMPLETE" --> PLAN_Phase["📋 **PLAN Phase**<br>fetch_rules(plan-mode-map)"]
    DecidePhase -- "PLAN_COMPLETE" --> CREATIVE_Phase["🎨 **CREATIVE Phase**<br>fetch_rules(creative-mode-map)"]
    DecidePhase -- "CREATIVE_COMPLETE" --> IMPLEMENT_Phase["⚙️ **IMPLEMENT Phase**<br>fetch_rules(implement-mode-map)"]
    DecidePhase -- "IMPLEMENT_COMPLETE" --> QA_Phase["🧪 **QA Phase**<br>fetch_rules(qa-mode-map)"]
    DecidePhase -- "QA_COMPLETE" --> REFLECT_Phase["🤔 **REFLECT Phase**<br>fetch_rules(reflect-mode-map)"]
    DecidePhase -- "REFLECT_COMPLETE" --> ARCHIVE_Phase["📦 **ARCHIVE Phase**<br>fetch_rules(archive-mode-map)"]
    DecidePhase -- "ARCHIVE_COMPLETE" --> Finish["🎉 Цикл завершен!"]

    VAN_Phase --> WriteState_VAN["2. Записать 'VAN_COMPLETE'<br>в `workflow-state.txt`"]
    PLAN_Phase --> WriteState_PLAN["2. Записать 'PLAN_COMPLETE'"]
    CREATIVE_Phase --> WriteState_CREATIVE["2. Записать 'CREATIVE_COMPLETE'"]
    IMPLEMENT_Phase --> WriteState_IMPLEMENT["2. Записать 'IMPLEMENT_COMPLETE'"]
    QA_Phase --> WriteState_QA["2. Записать 'QA_COMPLETE'"]
    REFLECT_Phase --> WriteState_REFLECT["2. Записать 'REFLECT_COMPLETE'"]
    ARCHIVE_Phase --> WriteState_ARCHIVE["2. Записать 'ARCHIVE_COMPLETE'"]

    WriteState_VAN & WriteState_PLAN & WriteState_CREATIVE & WriteState_IMPLEMENT & WriteState_QA & WriteState_REFLECT & WriteState_ARCHIVE --> Pause["3. ⏸️ Сообщить о результате и ждать 'NEXT'"]

    style Pause fill:#ffb74d,stroke:#f57c00
```

## 🛠️ ШАГИ ВЫПОЛНЕНИЯ (ИСПОЛНЯЕМЫЙ ПСЕВДОКОД)

Я буду выполнять следующий алгоритм при каждом вызове `STEP_BY_STEP` или команды `NEXT`.

```bash
# 0. Инициализация даты
initialize_system_date() # Вызов функции из Core/datetime-manager.mdc

# 1. Определить текущее состояние
local state_file="memory-bank/system/workflow-state.txt"
local current_state=$(cat "$state_file" 2>/dev/null || echo "START")
echo "ℹ️ Текущее состояние: $current_state"

# 2. Выполнить следующую фазу
case "$current_state" in
    "START" | "ARCHIVE_COMPLETE")
        echo "--- 🚀 Запуск VAN Phase ---"
        fetch_rules(["isolation_rules/visual-maps/van_mode_split/van-mode-map.mdc"])
        # ... (Здесь ИИ выполнит логику из карты VAN) ...
        echo "VAN_COMPLETE" > "$state_file"
        echo "✅ VAN Phase Complete. Type `NEXT` to proceed to the PLAN phase."
        ;;
    "VAN_COMPLETE")
        echo "--- 📋 Запуск PLAN Phase ---"
        fetch_rules(["isolation_rules/visual-maps/plan-mode-map.mdc"])
        # ... (Здесь ИИ выполнит логику из карты PLAN) ...
        echo "PLAN_COMPLETE" > "$state_file"
        echo "✅ PLAN Phase Complete. Type `NEXT` to proceed to the CREATIVE phase."
        ;;
    "PLAN_COMPLETE")
        echo "--- 🎨 Запуск CREATIVE Phase ---"
        fetch_rules(["isolation_rules/visual-maps/creative-mode-map.mdc"])
        # ... (Здесь ИИ выполнит логику из карты CREATIVE) ...
        echo "CREATIVE_COMPLETE" > "$state_file"
        echo "✅ CREATIVE Phase Complete. Type `NEXT` to proceed to the IMPLEMENT phase."
        ;;
    "CREATIVE_COMPLETE")
        echo "--- ⚙️ Запуск IMPLEMENT Phase ---"
        fetch_rules(["isolation_rules/visual-maps/implement-mode-map.mdc"])
        # ... (Здесь ИИ выполнит логику из карты IMPLEMENT) ...
        echo "IMPLEMENT_COMPLETE" > "$state_file"
        echo "✅ IMPLEMENT Phase Complete. Type `NEXT` to proceed to the QA phase."
        ;;
    "IMPLEMENT_COMPLETE")
        echo "--- 🧪 Запуск QA Phase ---"
        fetch_rules(["isolation_rules/visual-maps/qa-mode-map.mdc"])
        # ... (Здесь ИИ выполнит логику из карты QA) ...
        echo "QA_COMPLETE" > "$state_file"
        echo "✅ QA Phase Complete. Type `NEXT` to proceed to the REFLECT phase."
        ;;
    "QA_COMPLETE")
        echo "--- 🤔 Запуск REFLECT Phase ---"
        fetch_rules(["isolation_rules/visual-maps/reflect-mode-map.mdc"])
        # ... (Здесь ИИ выполнит логику из карты REFLECT) ...
        echo "REFLECT_COMPLETE" > "$state_file"
        echo "✅ REFLECT Phase Complete. Type `NEXT` to proceed to the ARCHIVE phase."
        ;;
    "REFLECT_COMPLETE")
        echo "--- 📦 Запуск ARCHIVE Phase ---"
        fetch_rules(["isolation_rules/visual-maps/archive-mode-map.mdc"])
        # ... (Здесь ИИ выполнит логику из карты ARCHIVE) ...
        echo "ARCHIVE_COMPLETE" > "$state_file"
        echo "🎉 Полный цикл разработки завершен! Можно начинать новый проект, запустив STEP_BY_STEP еще раз."
        ;;
    *)
        echo "⚠️ Неизвестное состояние '$current_state'. Сбрасываю на START."
        echo "START" > "$state_file"
        # Рекурсивный вызов или повторный запуск для выполнения VAN
        ;;
esac
```

Я БУДУ строго следовать этой логике, загружая и **ВЫПОЛНЯЯ** правила для каждой фазы, а не просто сообщая о них.