# MultiDomain Decision Engine – Research Log

## 1. Use of AI

This document outlines how AI tools were used during the development of this project.

AI was used as:

- A conceptual guide
- A debugging assistant
- A structural reviewer
- A design-thinking partner

The goal was not to outsource implementation, but to refine understanding, validate decisions, and improve architectural clarity.

---

## 2. Questions Asked During Development

- What are the different way we can build a career recommendation system?
- Possible work flows
- In what all ways can we implement the backend of it.
- How to structure a Java Servlet-based web application
- What is the proper folder structure for a Maven-based Servlet project?
- The system should not be a static hard coded comparison, By selecting from the multiple options are we violationg this?
- How to setup git in ubuntu.
- Why it is showing no such file in directory.
- How to setup tomcat?
- Proper way to git commit, which all files should exclude.
- What is the correct flow between jsp and servlet.
- How to organize packages like model, service, servlet etc
- Difference between sendredirect and forward
- What happen to request after redirect
- Correct way to pass data from servlet to jsp
- How to save and transfer form input across pages?
- Why is my JSP not receiving attributes from the servlet
- request.getParameter syntax
- NullPointerException while parsing integers
- How to get multiple checkbox values in servlet?
- What is request.getParameterValues()?
- How to validate if at least two checkboxes are selected?
- Write a basic css code for style these pages
- How to rank multiple options based on user input
- How to loop through a list of options and calculate scores?
- How to sort using comparator in Java?
- How to return both option and score together
- Is Map.Entry<Option, Integer> a good structure for ranking
- How to avoid modifying the original domain while filtering
- How to calculate similarity between two numbers
- Simple similarity formula for two numbers in same range?
- Is absolute difference Math.abs correct here
- How to scale similarity to a percentage?
- What am I doing wrong in here?
- Why jakarta is showing errors?
- How to calculate similarity between two numbers
- If option weights are 1–10 and user input is 1–5, how to align them
- What is a safe way to scale down a number range
- Should normalization happen in service or domain factory?
- What is the maximum possible weighted score?
- How to make this system proper multi domain?
- Domains with similar working principle
- How can I implement a laptop recommendation system in this current system?
- My current scoring logic is tightly coupled with career fields. How can I decouple it?
- How to design a system where domain logic and scoring logic are independent?
- Should I create a common abstraction for different recommendation categories?
- How to store dynamic criteria instead of hardcoded fields
- Cleanest way to represent a decision domain in java?
- How to handle numeric attributes like price
- How to normalize price and preference scale
- How to represent performance using RAM
- How to read csv in java
- How to load data from resources
- Why is my CSV file not loading in servlet?
- How to parse values like 16gb into integers?
- Why is this NumberFormatException
- If I add a new domain, should I modify the engine
- What is the maximum score when weighting is applied
- How to calculate percentage correctly when weighted scoring is used
- How to ensure user selects at least two courses?
- Should filtering happen before or inside engine?
- How to prevent ranking of unselected options
- How to derive explanation from weighted matches
- How to determine which criteria influenced ranking the most
- How to compute score gap between first and second
- Style the following pages.

---

## 3. References That Influenced the Approach

### 3.1 Strategy Pattern (Design Pattern)

**Influence:**

- Decoupling evaluation logic from domain logic.
- Introducing a `DecisionEngine` interface.
- Allowing multiple evaluation strategies in future.

**Applied As:**

- `DecisionEngine` interface.
- `SimilarityDecisionEngine` implementation.
- Engine injected inside servlet without hard dependency.

**Reason for Adoption:**

Improves scalability and supports future extensibility without modifying core flow.

---

### 3.2 Multi-Criteria Decision Making (MCDM) Concepts

**Influence:**

- Weighted scoring models.
- Importance-based evaluation.
- Similarity-based ranking instead of absolute scoring.

**Applied As:**

- Weighted similarity formula.
- Criterion-level scoring.
- Percentage normalization.
- Confidence calculation.

**Reason for Adoption:**

Provides deterministic and explainable ranking without introducing black-box behavior.

---

### 3.3 MVC / Layered Web Architecture

**Influence:**

- Separation of presentation, control, and logic layers.
- Avoiding business logic inside JSP.

**Applied As:**

- JSP for view.
- Servlet for orchestration.
- Engine layer for evaluation.
- DomainFactory for configuration.

**Reason for Adoption:**

Improves maintainability and aligns with standard web application structure.

---

### 3.4 Data Normalization Techniques

**Influence:**

- Aligning different scoring scales.
- Preventing mismatch between user input (1–5) and option weights (1–10).

**Applied As:**

- Scale normalization function.
- Consistent maximum score calculation.

**Reason for Adoption:**

Ensures mathematical correctness and fair comparison across domains.

---

## 4. What Was Accepted, Modified, or Rejected from AI Outputs

### 4.1 Accepted

The following suggestions were accepted with minimal modification:

- Use of abstraction (Domain, Option) to generalize decision structure.
- Weighted similarity scoring.
- Strategy pattern for evaluation engine.
- Confidence modeling using score gap.
- CSV-based data loading for extensibility.

These aligned well with project goals.

---

### 4.2 Modified

Several AI suggestions were adapted before implementation:

- Overly complex architectural patterns → Simplified to maintain clarity and scope relevance.
- Deep abstraction layers → Reduced to avoid unnecessary complexity.
- Mathematical scoring suggestions → Replaced with simpler deterministic formula.
- UI-heavy enhancements → Reduced to keep focus on system design.
- Data handling approaches → Adjusted to match Maven + Servlet environment.

**Reason for modification:**

To maintain balance between sophistication and clarity.

---

### 4.3 Rejected

The following ideas were intentionally not implemented:

- Machine Learning or probabilistic ranking models.
- Neural network or AI-based scoring.
- Fully dynamic plugin architecture.
- Database-heavy configuration layer.
- Excessive use of design patterns beyond scope.

**Reason for rejection:**

The assignment emphasized reasoning depth and explainability rather than algorithmic complexity.

The system was intentionally kept:

- Deterministic
- Transparent
- Traceable
- Architecturally clean