# 🎯 CREATIVE DECISION REQUIRED

**Problem**: {{problem_description}}
**Session Date**: {{current_date}}
**Complexity Level**: {{complexity_level}}
**Mode**: {{interaction_mode}}

---

## 💡 Available Solutions

### Option A: {{option_a_title}}
**Description**: {{option_a_description}}

**Pros**:
{{#option_a_pros}}
- ✅ {{.}}
{{/option_a_pros}}

**Cons**:
{{#option_a_cons}}
- ❌ {{.}}
{{/option_a_cons}}

### Option B: {{option_b_title}}
**Description**: {{option_b_description}}

**Pros**:
{{#option_b_pros}}
- ✅ {{.}}
{{/option_b_pros}}

**Cons**:
{{#option_b_cons}}
- ❌ {{.}}
{{/option_b_cons}}

### Option C: {{option_c_title}}
**Description**: {{option_c_description}}

**Pros**:
{{#option_c_pros}}
- ✅ {{.}}
{{/option_c_pros}}

**Cons**:
{{#option_c_cons}}
- ❌ {{.}}
{{/option_c_cons}}

---

## 📊 Comparison Matrix

| Критерий | Option A | Option B | Option C |
|----------|----------|----------|----------|
| **Эффективность** | {{score_a_effectiveness}}/10 | {{score_b_effectiveness}}/10 | {{score_c_effectiveness}}/10 |
| **Сложность реализации** | {{score_a_complexity}}/10 | {{score_b_complexity}}/10 | {{score_c_complexity}}/10 |
| **Риск** | {{score_a_risk}}/10 | {{score_b_risk}}/10 | {{score_c_risk}}/10 |
| **Время реализации** | {{score_a_time}}/10 | {{score_b_time}}/10 | {{score_c_time}}/10 |
| **Поддерживаемость** | {{score_a_maintenance}}/10 | {{score_b_maintenance}}/10 | {{score_c_maintenance}}/10 |
| **Стоимость** | {{score_a_cost}}/10 | {{score_b_cost}}/10 | {{score_c_cost}}/10 |
| **ИТОГО** | **{{total_score_a}}/60** | **{{total_score_b}}/60** | **{{total_score_c}}/60** |

---

## 🏆 AI Recommendation

**Recommended Option**: {{recommended_option}} (Score: {{best_score}}/60)

**Reasoning**: {{recommendation_reason}}

**Key Advantages**:
{{#recommendation_advantages}}
- {{.}}
{{/recommendation_advantages}}

**Potential Risks**:
{{#recommendation_risks}}
- {{.}}
{{/recommendation_risks}}

---

## 🤔 Your Decision

{{#if_manual_mode}}
**Please choose your preferred option:**

- **A** - {{option_a_title}}
- **B** - {{option_b_title}}
- **C** - {{option_c_title}}
- **AUTO** - Accept AI recommendation ({{recommended_option}})

**Your choice** (A/B/C/AUTO): ___________

**Additional comments** (optional):
___________________________________________
___________________________________________
{{/if_manual_mode}}

{{#if_auto_mode}}
**AUTO MODE**: Automatically selecting Option {{recommended_option}} based on highest score.
{{/if_auto_mode}}

---

## 📝 Decision Record

**Final Choice**: {{final_choice}}
**Chosen By**: {{chosen_by}}
**Decision Date**: {{decision_date}}
**Implementation Priority**: {{implementation_priority}}

**Next Steps**:
{{#next_steps}}
1. {{.}}
{{/next_steps}}

---

*This decision will be archived in the Creative Archive System for future reference and pattern analysis.*