# Build Process

## 1. Initial Approach

The project initially began as a simple Career Decision System.

In the first version:

- Courses were hardcoded directly inside the service layer.
- The scoring logic was tightly coupled with career-specific criteria.
- The system worked, but the architecture was domain-dependent.
- The servlet handled both orchestration and partial decision logic.

At this stage, the focus was functionality — ensuring that user inputs produced ranked outputs.

However, the structure was not scalable.

---

## 2. Realization & Architectural Shift

While implementing additional features, it became clear that:

- The logic was tightly bound to one domain.
- Adding a second decision category (like Laptop Recommendation) would require duplicating or modifying existing service logic.
- The system would become harder to maintain as domains increased.

This led to a design reconsideration.

Instead of building multiple domain-specific recommenders, the goal shifted to building:

**A reusable multi-domain decision engine.**

---

## 3. Refactoring to Domain Abstraction

To achieve scalability, the following abstractions were introduced:

- `Domain` model → Represents a decision category.
- `Option` model → Represents a selectable item within a domain.
- `DomainFactory` → Responsible for building domain configurations.
- `DecisionEngine` interface → Abstract evaluation strategy.
- `SimilarityDecisionEngine` → Concrete implementation.

This separation ensured:

- Domain data is independent of scoring logic.
- The engine does not know whether it is evaluating careers or laptops.
- New domains can be added without modifying the engine.

This was the most important architectural transformation of the project.

---

## 4. Evolution of Scoring Logic

### Phase 1 – Basic Similarity

Initial scoring used:

```java
score += (5 - Math.abs(userValue - optionValue));
```

This worked but treated all criteria equally.

### Phase 2 – Weighted Similarity

The system was improved to incorporate importance weighting:

```java
weightedScore = similarity * userImportance;
```

This allowed:

- High-priority criteria to influence ranking more.
- Low-priority criteria to contribute minimally.
- A more realistic decision model.

Normalization was introduced to convert option weights (1–10 scale) into a 1–5 evaluation scale.

This ensured scale consistency across domains.

---

## 5. Confidence Modeling

After ranking was implemented, an additional insight emerged:

Users should understand how strong the top recommendation is.

A confidence system was introduced to:

- Calculate percentage match.
- Compare top two ranked options.
- Determine gap strength.

Confidence levels were categorized as:

- High
- Moderate
- Low

This improved interpretability and user trust.

---

## 6. Explanation Generation

To avoid mechanical output, the system was enhanced to generate dynamic explanations.

The engine:

- Identifies the top two most influential criteria (based on weighted contribution).
- Generates contextual reasoning for why the option ranked first.

This adds reasoning transparency without introducing AI/ML complexity.

---

## 7. Multi-Domain Expansion

After stabilizing the career system, a laptop recommendation domain was added.

Key differences:

- Career domain → JSON-configured static options.
- Laptop domain → CSV-driven dataset (dynamic loading).
- Laptop options include metadata (e.g., price).

This validated that the engine truly supports domain independence.

---

## 8. Alternative Approaches Considered

Several alternative designs were evaluated.

### 8.1 Hardcoded Domain-Specific Services

Rejected because:

- Low scalability
- Tight coupling
- Poor extensibility

### 8.2 AI/ML-Based Recommendation

Rejected because:

- Black-box behavior
- Reduced explainability
- Not aligned with requirement focus on reasoning clarity

### 8.3 Database-Driven Dynamic System

Postponed due to:

- Increased setup complexity
- Not necessary for prototype-level evaluation

The final design prioritizes clarity, scalability, and deterministic behavior.

---

## 9. Mistakes & Corrections

During development:

- Initially forgot to normalize 1–10 option scales → caused inaccurate scoring.
- Breakdown UI used unweighted similarity while ranking used weighted logic → fixed for consistency.
- Career selection initially allowed evaluation without minimum comparison → validation added.
- Confidence percentage was incorrectly calculated using unweighted max score → corrected to 25 per criterion.

Each correction improved internal consistency.

---

## 10. What Changed During Development

The project evolved from:

> A simple career ranking feature

To:

> A structured, reusable multi-criteria decision engine with abstraction, weighted similarity modeling, confidence evaluation, and domain independence.

The biggest change was architectural thinking — moving from feature implementation to system design.

---

## 11. What I Would Improve With More Time

- Add constraint filtering (e.g., strict budget range).
- Move scoring configuration to external JSON for all domains.
- Introduce a persistence layer (database).
- Add a visualization dashboard for comparison.
- Improve UI consistency across all pages.
- Implement automated unit tests for the scoring engine.

---

## Final Reflection

The most important shift during development was recognizing that the core value was not the feature itself, but the abstraction behind it.

The system is intentionally designed to prioritize:

- Scalability
- Transparency
- Deterministic scoring
- Separation of concerns

This project reflects not just implementation ability, but architectural reasoning.