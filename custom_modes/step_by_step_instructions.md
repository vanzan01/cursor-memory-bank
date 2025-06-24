# MEMORY BANK STEP_BY_STEP MODE

> **TL;DR:** Этот режим проведет вас через полный цикл разработки пошагово. После каждой фазы я буду останавливаться и ждать вашей команды `NEXT` для перехода к следующему этапу. Этот режим полностью соблюдает `interaction-mode`.

## 🚶 ПОШАГОВЫЙ ЦИКЛ РАЗРАБОТКИ

```mermaid
graph TD
    Start["▶️ START STEP-BY-STEP"] --> SetDate["1. Установить дату<br>datetime-manager.mdc"]

    SetDate --> VAN["2. VAN Phase"]
    VAN --> Wait1["⏸️ Жду команду 'NEXT'"]

    Wait1 -- "NEXT" --> PLAN["3. PLAN Phase"]
    PLAN --> Wait2["⏸️ Жду команду 'NEXT'"]

    Wait2 -- "NEXT" --> CreativeCheck{"Креативная фаза<br>необходима?"}

    CreativeCheck -- "Да" --> CREATIVE["4. CREATIVE Phase"]
    CreativeCheck -- "Нет" --> IMPLEMENT

    CREATIVE --> Wait3["⏸️ Жду команду 'NEXT'"]
    Wait3 -- "NEXT" --> IMPLEMENT

    IMPLEMENT["5. IMPLEMENT Phase"] --> Wait4["⏸️ Жду команду 'NEXT'"]
    Wait4 -- "NEXT" --> QA["6. QA Phase"]
    QA --> Wait5["⏸️ Жду команду 'NEXT'"]
    Wait5 -- "NEXT" --> REFLECT["7. REFLECT Phase"]
    REFLECT --> Wait6["⏸️ Жду команду 'NEXT'"]
    Wait6 -- "NEXT" --> ARCHIVE["8. ARCHIVE Phase"]
    ARCHIVE --> Done["✅ WORKFLOW COMPLETE"]

    style Wait1 fill:#ffb74d,stroke:#f57c00
    style Wait2 fill:#ffb74d,stroke:#f57c00
    style Wait3 fill:#ffb74d,stroke:#f57c00
    style Wait4 fill:#ffb74d,stroke:#f57c00
    style Wait5 fill:#ffb74d,stroke:#f57c00
    style Wait6 fill:#ffb74d,stroke:#f57c00
```

## 🛠️ ШАГИ ВЫПОЛНЕНИЯ

### 1. Инициализация
- Я начну с вызова `initialize_system_date()` из `Core/datetime-manager.mdc`.
- Затем я выполню **VAN Phase**.

### 2. Ожидание команды
- После завершения каждой фазы я буду предоставлять отчет и останавливаться с сообщением: **"✅ [Имя фазы] Phase Complete. Type `NEXT` to proceed to the [Имя следующей фазы] phase."**

### 3. Соблюдение `interaction-mode`
- **Принципиально важно:** В этом режиме каждая фаза будет выполняться в соответствии с настройкой в `memory-bank/system/interaction-mode.txt`.
- **Если `MANUAL`**: на фазе `PLAN` я буду задавать уточняющие вопросы; на фазе `CREATIVE` я буду предлагать варианты на выбор.
- **Если `AUTO`**: я буду выполнять каждую фазу автономно, предоставляя только итоговый отчет.

### 4. Продвинутые рабочие процессы
- Как и в `UNIVERSAL` режиме, я буду автоматически включать **Integration Workflow**, **Refactoring Workflow** и другие продвинутые процессы для задач уровня L3/L4.