# DESIGN MODE MIGRATION TEMPLATE

**Дата создания**: 2025-06-20
**Назначение**: Migration template для DESIGN режима с task continuity поддержкой

## 🎯 DESIGN MODE MIGRATION STRUCTURE

### Migration.md для DESIGN задач:

```markdown
# DESIGN MODE TASK MIGRATION

**Дата миграции**: [CURRENT_DATE]
**Исходный режим**: [PLAN|CREATIVE|DESIGN|OTHER]
**Целевой режим**: DESIGN
**Задача**: [TASK_ID]

## 📋 MIGRATION CONTEXT

### Исходное состояние:
**Режим**: [SOURCE_MODE]
**Статус**: [SOURCE_STATUS]
**Прогресс**: [SOURCE_PROGRESS]%
**Фаза**: [SOURCE_PHASE]

### Целевое состояние:
**Режим**: DESIGN
**Статус**: [TARGET_STATUS]
**Фаза**: [Planning Phase|Creative Phase|Finalization Phase]

## 🔄 PHASE MAPPING

### Из PLAN режима:
- **PLAN Status** → **DESIGN Planning Phase**
- Сохранить: Planning results, complexity analysis, requirements
- Добавить: Creative component identification, phase tracking

### Из CREATIVE режима:
- **CREATIVE Status** → **DESIGN Creative Phase**
- Сохранить: Creative decisions, options analysis, guidelines
- Добавить: Planning context, implementation integration

### Из других режимов:
- **Status** → **DESIGN Planning Phase** (start from beginning)
- Анализировать: Existing work, requirements, context
- Создать: New DESIGN workflow from existing materials

## 📊 PRESERVED CONTEXT

### Planning Context (если доступен):
```yaml
planning:
  complexity_level: [LEVEL]
  requirements: [REQUIREMENTS_LIST]
  components: [COMPONENTS_LIST]
  challenges: [CHALLENGES_LIST]
  dependencies: [DEPENDENCIES_LIST]
```

### Creative Context (если доступен):
```yaml
creative:
  components_flagged: [CREATIVE_COMPONENTS]
  decisions_made: [DECISIONS_LIST]
  options_analyzed: [OPTIONS_COUNT]
  guidelines_created: [GUIDELINES_LIST]
  type_distribution:
    architecture: [COUNT]
    algorithm: [COUNT]
    ui_ux: [COUNT]
```

### Implementation Context (если доступен):
```yaml
implementation:
  plan_status: [STATUS]
  files_modified: [FILES_LIST]
  progress: [PERCENTAGE]
  blockers: [BLOCKERS_LIST]
```

## 🎯 DESIGN PHASE INITIALIZATION

### Planning Phase Setup:
- [ ] Load preserved planning context
- [ ] Analyze task complexity
- [ ] Identify missing requirements
- [ ] Flag components for creative work
- [ ] Create/update implementation plan

### Creative Phase Setup (если требуется):
- [ ] Load preserved creative decisions
- [ ] Identify pending creative work
- [ ] Analyze existing options
- [ ] Complete missing creative decisions
- [ ] Update implementation guidelines

### Finalization Phase Setup:
- [ ] Integrate all preserved context
- [ ] Validate completeness
- [ ] Update Memory Bank
- [ ] Prepare for implementation

## 📝 MIGRATION STEPS

### Step 1: Context Preservation
1. **Save current state**:
   ```
   edit_file({
     target_file: "memory-bank/migration.md",
     instructions: "Preserving current task state before DESIGN migration",
     code_edit: [CURRENT_STATE_BACKUP]
   })
   ```

2. **Analyze existing work**:
   - Review completed planning
   - Analyze creative decisions
   - Assess implementation progress
   - Identify continuation points

### Step 2: DESIGN Mode Initialization
1. **Update current-context.md**:
   ```
   edit_file({
     target_file: "memory-bank/system/current-context.md",
     instructions: "Migrating to DESIGN mode with preserved context",
     code_edit: [DESIGN_CONTEXT_WITH_MIGRATION]
   })
   ```

2. **Update tasks.md**:
   ```
   edit_file({
     target_file: "memory-bank/tasks.md",
     instructions: "Converting task to DESIGN format with migration context",
     code_edit: [DESIGN_TASK_FORMAT]
   })
   ```

### Step 3: Phase Continuation
1. **Determine starting phase**:
   - If planning incomplete → Start with Planning Phase
   - If planning complete, creative needed → Start with Creative Phase
   - If both complete → Start with Finalization Phase

2. **Load appropriate rules**:
   ```
   fetch_rules([
     "isolation_rules/main",
     "isolation_rules/Core/command-execution",
     "isolation_rules/visual-maps/design-mode-map",
     [PHASE_SPECIFIC_RULES]
   ])
   ```

3. **Continue workflow**:
   - Resume from appropriate phase
   - Integrate preserved context
   - Complete missing work
   - Update documentation

## 🔧 MIGRATION SCENARIOS

### Scenario 1: PLAN → DESIGN
**Trigger**: User wants creative capabilities added to planning task
**Process**:
1. Preserve planning results
2. Initialize DESIGN mode
3. Continue with Creative Phase if needed
4. Otherwise proceed to Finalization

### Scenario 2: CREATIVE → DESIGN
**Trigger**: User wants integrated planning + creative workflow
**Process**:
1. Preserve creative decisions
2. Initialize DESIGN mode
3. Add planning context
4. Continue with Finalization

### Scenario 3: Incomplete Task → DESIGN
**Trigger**: User wants to restart/continue with DESIGN approach
**Process**:
1. Analyze existing work
2. Preserve useful context
3. Initialize DESIGN mode
4. Start from appropriate phase

### Scenario 4: IMPLEMENT → DESIGN
**Trigger**: Implementation blocked, need design revision
**Process**:
1. Preserve implementation progress
2. Identify design issues
3. Initialize DESIGN mode
4. Focus on Creative Phase for problem resolution

## 📊 QUALITY ASSURANCE

### Migration Validation:
- [ ] All previous work preserved
- [ ] Context properly mapped
- [ ] Phase correctly determined
- [ ] Rules properly loaded
- [ ] Workflow can continue

### Continuity Checks:
- [ ] No work lost during migration
- [ ] Context makes sense in DESIGN mode
- [ ] Phase transitions work correctly
- [ ] Documentation updated properly
- [ ] Memory Bank consistency maintained

## 🚨 ERROR HANDLING

### Migration Failures:
```markdown
## MIGRATION ERROR RECOVERY

**Error Type**: [ERROR_DESCRIPTION]
**Recovery Action**: [RECOVERY_STEPS]
**Fallback**: [FALLBACK_PLAN]

### Common Issues:
1. **Context Loss**: Restore from backup
2. **Phase Confusion**: Reset to Planning Phase
3. **Rule Loading Failure**: Use basic rules
4. **Documentation Inconsistency**: Manual cleanup
```

### Rollback Procedure:
```markdown
## ROLLBACK TO PREVIOUS MODE

If migration fails:
1. Restore previous context from backup
2. Reset tasks.md to previous format
3. Load original mode rules
4. Continue with original workflow
5. Document migration failure for analysis
```

## 📈 MIGRATION METRICS

### Success Indicators:
- **Context Preservation**: 100%
- **Work Continuity**: No interruption
- **Phase Accuracy**: Correct starting phase
- **Documentation Consistency**: All files updated
- **User Satisfaction**: Smooth transition

### Performance Targets:
- **Migration Time**: < 2 minutes
- **Context Loading**: < 30 seconds
- **Rule Loading**: < 30 seconds
- **Documentation Update**: < 1 minute
- **Workflow Resumption**: Immediate

## 🔄 INTEGRATION POINTS

### With Memory Bank System:
- Automatic migration detection
- Context preservation mechanisms
- Task format conversion
- Progress tracking updates

### With Rules System:
- Dynamic rule loading based on migration context
- Phase-appropriate rule selection
- Error handling for missing rules
- Performance optimization

### With Progress Tracking:
- Migration event logging
- Continuity metrics
- Success rate tracking
- Performance monitoring
```