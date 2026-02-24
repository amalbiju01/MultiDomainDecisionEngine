# MultiDomain Decision Engine

## 1. Problem Understanding

The goal of this assignment was not just to build a recommendation system, but to design a structured decision-making framework that:

- Accepts user preferences
- Evaluates multiple competing options
- Produces a ranked result
- Remains explainable and deterministic

Rather than building a hardcoded single-use solution, the system was designed as a reusable decision engine capable of supporting multiple domains (Career, Laptop, etc.).
### 1.1 Evolution of the Solution

The project initially began as a single-domain Career Decision System.

In its first version:
- Courses were hardcoded inside the service layer.
- The scoring logic directly depended on the Career domain.
- The architecture was functional but tightly coupled.

During development, it became clear that this structure would not scale to additional decision categories such as Laptop Recommendation.

To address this, the architecture was refactored to:

- Introduce a `Domain` abstraction.
- Replace `Course` with a generic `Option` model.
- Extract configuration into `DomainFactory`.
- Make `DecisionService` completely domain-independent.

This transformation shifted the system from:
> A working recommendation feature

to:
> A reusable, scalable decision engine.

This refactoring was incremental and done without breaking existing functionality.

---

## 2. Assumptions Made

- User preference inputs are provided on a scale of 1–5.
- Option weights are normalized to match the same scale.
- Only selected options should be ranked.
- All decision criteria are independent and contribute equally.
- The system prioritizes transparency over black-box AI scoring.

---

## 3. Why This Structure Was Chosen

The solution was structured into three logical layers:

### Model Layer
- `Domain` represents a decision category.
- `Option` represents a choice within that domain.
- `DomainFactory` builds domain-specific configurations.

This ensures domain logic is separated from the scoring engine.

### Service Layer
- `DecisionService` contains a generic ranking algorithm.
- It does not depend on Career or Laptop specifically.
- It operates only on Domain and Option abstractions.

This makes the scoring engine reusable and framework-independent.

### Web Layer
- JSP handles presentation.
- Servlet handles orchestration.
- Business logic remains isolated.

This separation improves maintainability and scalability.

---

## 4. Core Scoring Logic

For each selected option:

This approach was chosen because:

- It rewards similarity rather than absolute dominance.
- It keeps scoring deterministic and explainable.
- It avoids arbitrary multipliers.

Options are then sorted in descending order.

---

## 5. Design Decisions and Trade-offs

### Decision: Build a Domain-Agnostic Engine
The system was intentionally refactored from a single-domain Career solution into a generic Domain–Option architecture.

Instead of embedding domain logic inside the service layer, a `Domain` abstraction was introduced, and configuration was moved to `DomainFactory`.

Trade-off:
- Increased architectural complexity early on
- Greater scalability and extensibility for new domains (e.g., Laptop recommendation)

---

### Decision: Use Deterministic Similarity Scoring
A transparent similarity-based scoring formula was used:

This ensures predictable and explainable ranking.

Trade-off:
- Less adaptive than AI/ML-based models
- Fully interpretable and easier to debug

---

### Decision: Keep Data Configuration In-Memory
Domains are currently constructed programmatically rather than loaded from a database or JSON.

Trade-off:
- Faster development and easier reasoning
- Not ideal for large-scale or production systems

---

### Decision: Incremental Refactoring Instead of Rewriting
Rather than rebuilding from scratch, the system was refactored step-by-step:

- First stabilized the single-domain version.
- Then introduced abstractions.
- Preserved filtering logic.
- Updated the web layer accordingly.

Trade-off:
- Temporary duplication during transition
- Reduced risk of breaking existing functionality

## 6. Edge Cases Considered

- No courses selected → returns empty ranking.
- Missing parameters → form validation prevents submission.
- Unmatched criteria keys → safely ignored.
- Browser caching of welcome page → resolved via proper web.xml configuration.
- Filtering ensures only selected options are ranked.

---

