# DESIGN MODE RULES MAPPING

**Дата создания**: 2025-06-20
**Назначение**: Mapping правил для DESIGN режима с fetch_rules интеграцией

## 🎯 OVERVIEW

DESIGN режим объединяет правила из PLAN и CREATIVE режимов, автоматически загружая необходимые правила в зависимости от текущей фазы и уровня сложности задачи.

## 📋 FETCH_RULES INTEGRATION

### Базовые правила (всегда загружаются):
```javascript
fetch_rules([
  "isolation_rules/main",
  "isolation_rules/Core/command-execution",
  "isolation_rules/Core/web-search-integration",
  "isolation_rules/visual-maps/design-mode-map"
])
```

### Planning Phase Rules:
```javascript
fetch_rules([
  "isolation_rules/visual-maps/plan-mode-map",
  "isolation_rules/Core/interactive-planning",
  "isolation_rules/Core/problem-prioritization",
  "isolation_rules/Core/complexity-determination"
])
```

### Creative Phase Rules (условная загрузка):
```javascript
// Базовые creative правила
fetch_rules([
  "isolation_rules/visual-maps/creative-mode-map",
  "isolation_rules/Core/creative-phase-enforcement",
  "isolation_rules/Core/creative-phase-metrics",
  "isolation_rules/Core/creative-decision-control"
])

// Architecture-specific rules
if (creative_type === "Architecture") {
  fetch_rules([
    "isolation_rules/Phases/CreativePhase/creative-phase-architecture"
  ])
}

// Algorithm-specific rules
if (creative_type === "Algorithm") {
  fetch_rules([
    "isolation_rules/Phases/CreativePhase/creative-phase-algorithm"
  ])
}

// UI-UX-specific rules
if (creative_type === "UI-UX") {
  fetch_rules([
    "isolation_rules/Phases/CreativePhase/creative-phase-ui-ux"
  ])
}
```

### Level-specific Rules:
```javascript
// Level 2 rules
if (complexity_level === 2) {
  fetch_rules([
    "isolation_rules/Level2/workflow-level2",
    "isolation_rules/Level2/simple-enhancement-patterns"
  ])
}

// Level 3 rules
if (complexity_level === 3) {
  fetch_rules([
    "isolation_rules/Level3/workflow-level3",
    "isolation_rules/Level3/feature-development-patterns"
  ])
}

// Level 4 rules
if (complexity_level === 4) {
  fetch_rules([
    "isolation_rules/Level4/workflow-level4",
    "isolation_rules/Level4/system-development-patterns"
  ])
}
```

## 🔄 DYNAMIC RULE LOADING

### Phase-Based Loading:
1. **Initialization**: Загрузка базовых и planning правил
2. **Creative Phase Trigger**: Загрузка creative правил при необходимости
3. **Finalization**: Загрузка implementation preparation правил

### Context-Aware Loading:
- **Task Complexity**: Автоматическая загрузка level-specific правил
- **Creative Type**: Динамическая загрузка type-specific правил
- **Error Handling**: Fallback rules при ошибках загрузки

## 📊 RULES HIERARCHY

```
DESIGN Mode Rules Hierarchy:
├── Core Rules (always loaded)
│   ├── main.mdc
│   ├── command-execution.mdc
│   ├── web-search-integration.mdc
│   └── design-mode-map.mdc
├── Planning Phase Rules
│   ├── plan-mode-map.mdc
│   ├── interactive-planning.mdc
│   ├── problem-prioritization.mdc
│   └── complexity-determination.mdc
├── Creative Phase Rules (conditional)
│   ├── creative-mode-map.mdc
│   ├── creative-phase-enforcement.mdc
│   ├── creative-phase-metrics.mdc
│   ├── creative-decision-control.mdc
│   └── Type-Specific Rules
│       ├── creative-phase-architecture.mdc
│       ├── creative-phase-algorithm.mdc
│       └── creative-phase-ui-ux.mdc
└── Level-Specific Rules (conditional)
    ├── Level2/workflow-level2.mdc
    ├── Level3/workflow-level3.mdc
    └── Level4/workflow-level4.mdc
```

## 🚨 ERROR HANDLING

### Rule Loading Failures:
```javascript
try {
  fetch_rules(["isolation_rules/visual-maps/design-mode-map"])
} catch (error) {
  // Fallback to basic rules
  fetch_rules(["isolation_rules/main"])
  console.warn("Design mode map not available, using basic rules")
}
```

### Missing Creative Rules:
```javascript
// Graceful degradation if creative rules unavailable
if (!creative_rules_loaded) {
  // Continue with planning-only approach
  skip_creative_phase = true
  log_warning("Creative phase rules unavailable, skipping creative work")
}
```

## 📈 OPTIMIZATION

### Rule Caching:
- Cache frequently used rules in memory
- Avoid re-loading same rules within session
- Preload common rule combinations

### Lazy Loading:
- Load creative rules only when creative phase triggered
- Load level-specific rules based on task complexity
- Load type-specific rules based on component types

### Performance Targets:
- **Initial rule loading**: < 5 seconds
- **Phase transition rule loading**: < 2 seconds
- **Total rules loaded per session**: < 50 files

## 🔧 IMPLEMENTATION GUIDELINES

### In design_instructions.md:
1. Add fetch_rules calls at appropriate workflow points
2. Implement conditional loading based on phase/complexity
3. Add error handling for missing rules
4. Include performance monitoring

### Integration Points:
- **Workflow Start**: Load core + planning rules
- **Creative Phase Entry**: Load creative rules
- **Level Detection**: Load level-specific rules
- **Type Detection**: Load type-specific rules
- **Error Recovery**: Load fallback rules

### Best Practices:
- Always load core rules first
- Use try-catch for all rule loading
- Log rule loading status for debugging
- Provide graceful degradation paths
- Monitor rule loading performance

## 📝 TEMPLATE INTEGRATION

### Context Template Updates:
```markdown
## 🔧 LOADED RULES
**Core Rules**: [LOADED_CORE_RULES]
**Phase Rules**: [LOADED_PHASE_RULES]
**Level Rules**: [LOADED_LEVEL_RULES]
**Creative Rules**: [LOADED_CREATIVE_RULES]

## 🚨 RULE LOADING STATUS
- [x] Core rules loaded successfully
- [x] Planning phase rules loaded
- [ ] Creative phase rules (not yet needed)
- [x] Level [X] rules loaded
```

### Progress Template Updates:
```markdown
## 📊 RULES PERFORMANCE
**Rule loading time**: [TIME] seconds
**Rules loaded this session**: [COUNT]
**Failed rule loads**: [COUNT]
**Fallback activations**: [COUNT]
```

## 🔄 MIGRATION STRATEGY

### From PLAN Mode:
- Keep existing planning rule loading
- Add creative rule loading capability
- Maintain backward compatibility

### From CREATIVE Mode:
- Keep existing creative rule loading
- Add planning rule loading capability
- Maintain creative phase functionality

### Integration Testing:
- Test all rule combinations
- Verify performance targets
- Test error handling scenarios
- Validate fallback mechanisms