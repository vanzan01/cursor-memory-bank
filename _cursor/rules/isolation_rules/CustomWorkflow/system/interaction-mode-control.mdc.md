---
description: "Interaction mode control system for AUTO/MANUAL behavior switching"
globs: "**/system/**", "**/interaction/**", "**/mode-control/**"
alwaysApply: true
---

# INTERACTION MODE CONTROL SYSTEM

This rule implements AUTO/MANUAL interaction mode switching that controls AI behavior across all Memory Bank modes.

> **TL;DR:** This rule implements AUTO/MANUAL interaction mode switching that controls AI behavior across all Memory Bank modes, enabling autonomous operation or user-guided decision making.

## 🔄 INTERACTION MODE OVERVIEW

The Interaction Mode Control system provides two distinct operational modes that fundamentally change how the AI interacts with users across all Memory Bank phases.

### Mode Definitions

**AUTO Mode**
- AI makes autonomous decisions based on best practices
- Minimal user interaction required
- Fast execution with documented rationale
- Suitable for routine tasks and experienced users

**MANUAL Mode**
- AI presents options and asks for user guidance
- Interactive planning with clarifying questions
- User-controlled creative and architectural decisions
- Suitable for complex tasks and collaborative development

## 🎯 MODE BEHAVIOR MATRIX

| Memory Bank Mode | AUTO Behavior | MANUAL Behavior |
|------------------|---------------|-----------------|
| **VAN** | Auto-detect complexity, proceed with standard workflow | Ask about priorities, confirm approach |
| **PLAN** | Create implementation plan based on requirements | Ask clarifying questions, validate assumptions |
| **CREATIVE** | Make architectural decisions with documented rationale | Present options for user choice |
| **IMPLEMENT** | Execute plan with standard practices | Confirm critical decisions, validate approach |
| **REFLECT** | Auto-generate reflection based on outcomes | Guide user through reflection process |
| **ARCHIVE** | Standard archiving with automated organization | Collaborative knowledge capture |

## 🔧 MODE DETECTION AND SWITCHING

### Current Mode Detection

```bash
# Read current interaction mode
cat memory-bank/system/interaction-mode.txt
```

**Expected Values**:
- `AUTO` - Autonomous operation mode
- `MANUAL` - Interactive operation mode

### Mode Switching Commands

**Switch to AUTO Mode**:
```bash
echo "AUTO" > memory-bank/system/interaction-mode.txt
```

**Switch to MANUAL Mode**:
```bash
echo "MANUAL" > memory-bank/system/interaction-mode.txt
```

### Mode Validation

```bash
# Validate mode file exists and has valid value
if [ -f "memory-bank/system/interaction-mode.txt" ]; then
    MODE=$(cat memory-bank/system/interaction-mode.txt)
    if [ "$MODE" = "AUTO" ] || [ "$MODE" = "MANUAL" ]; then
        echo "Valid mode: $MODE"
    else
        echo "Invalid mode: $MODE, defaulting to MANUAL"
        echo "MANUAL" > memory-bank/system/interaction-mode.txt
    fi
else
    echo "Mode file missing, creating with MANUAL default"
    echo "MANUAL" > memory-bank/system/interaction-mode.txt
fi
```

## 📋 MODE-SPECIFIC BEHAVIORS

### VAN Mode Behaviors

**AUTO Mode**:
- Automatically detect task complexity (Level 1-4)
- Proceed with standard workflow for detected level
- Use default QA checks and validation
- Minimal user confirmation required

**MANUAL Mode**:
- Present complexity analysis for user confirmation
- Ask about specific priorities and constraints
- Confirm workflow approach before proceeding
- Allow user to override complexity assessment

### PLAN Mode Behaviors

**AUTO Mode**:
- Analyze requirements and create implementation plan
- Use standard planning templates and approaches
- Document assumptions and proceed with best practices
- Generate comprehensive plan without user input

**MANUAL Mode**:
- Ask clarifying questions about unclear requirements
- Present planning options for user choice
- Validate assumptions with user before proceeding
- Collaborative plan development with user input

### CREATIVE Mode Behaviors

**AUTO Mode**:
- Analyze design problem and select best solution
- Document decision rationale and trade-offs
- Proceed with recommended architectural approach
- Create implementation strategy autonomously

**MANUAL Mode**:
- Generate multiple solution options with analysis
- Present options with pros/cons and scoring
- Wait for user choice among presented options
- Document user decision and rationale

### IMPLEMENT Mode Behaviors

**AUTO Mode**:
- Execute implementation plan systematically
- Use standard coding practices and patterns
- Make technical decisions based on best practices
- Proceed with minimal user intervention

**MANUAL Mode**:
- Confirm critical implementation decisions
- Ask for guidance on ambiguous technical choices
- Validate approach before major code changes
- Collaborative implementation with user oversight

### REFLECT Mode Behaviors

**AUTO Mode**:
- Analyze implementation outcomes automatically
- Generate reflection document with standard format
- Document lessons learned and improvements
- Create comprehensive reflection autonomously

**MANUAL Mode**:
- Guide user through reflection process
- Ask specific questions about experience
- Collaborate on lessons learned identification
- Interactive reflection document creation

### ARCHIVE Mode Behaviors

**AUTO Mode**:
- Organize and archive all project artifacts
- Use standard archiving structure and naming
- Generate archive documentation automatically
- Complete archiving with minimal user input

**MANUAL Mode**:
- Collaborate on archive organization
- Ask about knowledge preservation priorities
- Validate archive structure with user
- Interactive knowledge capture and organization

## 🔄 MODE TRANSITION WORKFLOW

```mermaid
graph TD
    Start["🚀 Memory Bank Mode Start"] --> CheckMode["📋 Check Interaction Mode"]
    CheckMode --> ReadFile["📄 Read interaction-mode.txt"]
    ReadFile --> ValidateMode{"✅ Valid Mode?"}

    ValidateMode -->|"Invalid/Missing"| SetDefault["📝 Set MANUAL Default"]
    ValidateMode -->|"Valid"| LoadMode["🔧 Load Mode Configuration"]

    SetDefault --> LoadMode
    LoadMode --> CheckAuto{"🤖 AUTO Mode?"}

    CheckAuto -->|"Yes"| AutoBehavior["🤖 Execute AUTO Behavior"]
    CheckAuto -->|"No"| ManualBehavior["👤 Execute MANUAL Behavior"]

    AutoBehavior --> DocumentDecisions["📚 Document Autonomous Decisions"]
    ManualBehavior --> UserInteraction["💬 Interactive User Engagement"]

    DocumentDecisions --> Complete["✅ Mode Complete"]
    UserInteraction --> Complete

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style CheckMode fill:#d94dbb,stroke:#a3378a,color:white
    style AutoBehavior fill:#4dbb5f,stroke:#36873f,color:white
    style ManualBehavior fill:#ffa64d,stroke:#cc7a30,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

## 📊 MODE CONFIGURATION

### System Configuration File

**Location**: `memory-bank/config/system.yaml`

```yaml
interaction:
  mode: "MANUAL"  # AUTO or MANUAL
  timeout:
    user_response: 900  # 15 minutes
    decision_wait: 300   # 5 minutes
  defaults:
    fallback_mode: "MANUAL"
    auto_switch_threshold: 3  # Switch to AUTO after 3 timeouts

behavior:
  auto_mode:
    documentation_level: "comprehensive"
    decision_rationale: true
    user_notifications: "summary"

  manual_mode:
    question_detail_level: "detailed"
    option_presentation: "comprehensive"
    confirmation_required: true
```

### Mode-Specific Settings

**AUTO Mode Settings**:
- `documentation_level`: How detailed autonomous decision documentation should be
- `decision_rationale`: Whether to document why decisions were made
- `user_notifications`: Level of user notification (none/summary/detailed)

**MANUAL Mode Settings**:
- `question_detail_level`: How detailed clarifying questions should be
- `option_presentation`: How comprehensive option analysis should be
- `confirmation_required`: Whether user confirmation is required for major decisions

## 🚨 ERROR HANDLING AND FALLBACKS

### Mode File Issues

**Missing File**:
- Create `memory-bank/system/interaction-mode.txt` with "MANUAL" default
- Log warning about missing configuration
- Proceed with MANUAL mode behavior

**Invalid Mode Value**:
- Log error about invalid mode
- Reset to "MANUAL" default
- Notify user of mode reset

**File Permission Issues**:
- Log error about file access
- Use in-memory mode for current session
- Attempt to fix permissions

### User Response Timeouts

**MANUAL Mode Timeouts**:
- Wait for configured timeout period (default: 15 minutes)
- Send reminder notification after 10 minutes
- After timeout, document assumption and proceed
- Optionally switch to AUTO mode after repeated timeouts

**Decision Point Timeouts**:
- For critical decisions, block and wait indefinitely
- For non-critical decisions, use best practice default
- Document all timeout-based decisions
- Notify user of timeout-based choices

## 📈 MODE USAGE ANALYTICS

### Usage Tracking

**Mode Usage Statistics**:
- Track time spent in each mode
- Count mode switches per session
- Monitor user response times in MANUAL mode
- Track decision quality outcomes

**Performance Metrics**:
- Task completion time by mode
- User satisfaction scores
- Decision quality assessments
- Error rates by mode

### Optimization Recommendations

**AUTO Mode Optimization**:
- Improve decision documentation quality
- Enhance autonomous decision accuracy
- Reduce need for user intervention
- Optimize execution speed

**MANUAL Mode Optimization**:
- Improve question quality and relevance
- Enhance option presentation clarity
- Reduce user cognitive load
- Streamline decision processes

## 🔧 INTEGRATION POINTS

### File System Integration

**Mode State**: `memory-bank/system/interaction-mode.txt`
- Current interaction mode (AUTO/MANUAL)
- Simple text file for easy reading/writing
- Version controlled for history tracking

**Configuration**: `memory-bank/config/system.yaml`
- Detailed mode configuration settings
- Timeout and behavior parameters
- User preferences and overrides

**Session State**: `memory-bank/system/session-state.json`
- Current session interaction history
- Mode switch history and reasons
- User response patterns and preferences

### Memory Bank Mode Integration

**Mode Initialization**:
- Every Memory Bank mode checks interaction mode on startup
- Load appropriate behavior configuration
- Initialize user interaction systems if MANUAL mode

**Decision Points**:
- All major decision points check interaction mode
- Route to appropriate decision-making process
- Document decisions and rationale regardless of mode

**Transition Handling**:
- Mode transitions preserve interaction mode settings
- User can change interaction mode between Memory Bank modes
- Mode changes are logged and tracked

This interaction mode control system provides flexible operation modes that adapt to user preferences and task requirements while maintaining consistent behavior across all Memory Bank phases.

## ⚙️ ИНТЕГРАЦИЯ И ПРОВЕРКА РЕЖИМА

Все режимы работы (`VAN`, `PLAN`, `STEP_BY_STEP` и т.д.) **ДОЛЖНЫ** проверять текущий режим взаимодействия перед выполнением ключевых операций.

### Функция для получения текущего режима

```bash
function get_interaction_mode() {
  local mode_file="memory-bank/system/interaction-mode.txt"
  if [ -f "$mode_file" ]; then
    cat "$mode_file"
  else
    # По умолчанию используется MANUAL для безопасности
    echo "MANUAL"
  fi
}
```

### Пример использования в другом правиле

```bash
# Псевдокод для ИИ-ассистента в режиме PLAN

# ... начало логики планирования ...

local interaction_mode=$(get_interaction_mode)

if [ "$interaction_mode" = "MANUAL" ]; then
  # Задаем уточняющие вопросы пользователю
  echo "У меня есть несколько вариантов реализации. Какой предпочитаете?"
  # ... логика для интерактивного планирования ...
else # AUTO
  # Принимаем решение автономно
  echo "Выбран оптимальный вариант реализации на основе лучших практик."
  # ... логика для автоматического планирования ...
fi
```