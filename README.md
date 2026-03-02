# MultiDomain Decision Engine

A structured, explainable multi-criteria decision-making system built using Java Servlets and JSP.

This project implements a reusable evaluation engine capable of ranking multiple options across different domains such as Career Recommendation and Laptop Recommendation.

##Demo video
https://drive.google.com/file/d/18GmhsC-hA3uqq-TSI0MQsWv6Iq3jBHfz/view?usp=sharing

---

## 1. Problem Understanding

The objective of this project was not merely to build a recommendation system, but to design a structured and deterministic decision-making framework that:

- Accepts user-defined preferences and importance weights
- Evaluates multiple competing options
- Produces a ranked result
- Remains transparent and explainable

Instead of implementing a hardcoded, single-use solution, the system was designed as a reusable decision engine capable of supporting multiple decision domains (Career, Laptop, etc.) without modifying the core scoring logic.

---

## 2. Evolution of the Solution

The project began as a **single-domain Career Decision System**.

### Initial Version Characteristics

- Courses were hardcoded in the service layer
- Scoring logic was tightly coupled with Career-specific attributes
- Architecture worked but lacked scalability

As development progressed, it became clear that this approach would not support additional domains such as Laptop Recommendation.

### Refactoring Strategy

The architecture was incrementally refactored to:

- Introduce a `Domain` abstraction
- Replace `Course` with a generic `Option` model
- Extract domain configuration into `DomainFactory`
- Make the scoring engine fully domain-independent

This transformation shifted the system from:

> A working recommendation feature

to:

> A reusable, scalable decision engine.

The refactoring was performed incrementally without breaking existing functionality.

---

## 3. Assumptions Made

- User preference inputs are provided on a scale of 1–5
- Option weights are aligned to the same scale
- Only user-selected options are ranked
- All decision criteria contribute independently
- Transparency is prioritized over black-box AI scoring

---

## 4. Architecture Overview

The solution follows a layered architecture:

### Model Layer
- `Domain` → Represents a decision category
- `Option` → Represents a selectable choice
- `DomainFactory` → Builds domain-specific configurations

### Engine / Service Layer
- Domain-agnostic scoring engine
- Handles similarity calculation, weighting, ranking, and confidence modeling
- Does not depend on Career or Laptop logic

### Web Layer
- JSP handles presentation
- Servlet handles orchestration and request processing
- Business logic remains isolated from UI

This separation improves maintainability, scalability, and testability.

---

## 5. Core Scoring Logic

For each selected option:

1. Iterate through each criterion
2. Retrieve:
   - `userValue`
   - `optionValue`
3. Normalize option value (if required)
4. Compute similarity:

   similarity = 5 - abs(userValue - optionValue)

5. Clamp similarity to minimum 0
6. Compute weighted score:

   weightedScore = similarity × userImportance

7. Accumulate total score
8. Repeat for all criteria
9. Sort options in descending order of totalScore
10. Compute confidence using score gap between top two options
11. Generate explanation based on highest weighted criteria

### Properties of the Algorithm

- Deterministic output
- Fully explainable
- Transparent scoring
- No probabilistic behavior

---

## 6. Design Decisions and Trade-offs

### Domain-Agnostic Architecture

**Pros**
- Scalable
- Reusable
- Extendable

**Cons**
- Slightly higher structural complexity

---

### Deterministic Similarity Scoring

**Pros**
- Fully explainable
- Easy to debug
- Predictable behavior

**Cons**
- Not adaptive like machine learning models

---

### In-Memory Domain Configuration

**Pros**
- Faster development
- Simpler reasoning

**Cons**
- Not ideal for very large datasets

---

### Incremental Refactoring

Instead of rewriting from scratch, abstractions were introduced gradually.

**Pros**
- Reduced risk
- Maintained working system

**Cons**
- Temporary duplication during transition

---

## 7. Edge Cases Considered

- No options selected → Validation prevents submission
- Less than two options selected → Redirected to selection page
- Missing parameters → Required field enforcement
- Unmatched criteria → Safely ignored
- Negative similarity values → Clamped to zero
- Score ties → Deterministic sorting

---

## 8. Technology Stack

- Java (Servlet API)
- JSP
- Maven
- Apache Tomcat
- HTML / CSS
- Git

---

## 9. How to Run the Project

### Requirements

- Java 8 or above
- Maven
- Apache Tomcat

### Steps

1. Clone the repository:

   git clone <repository-url>
   cd MultiDomainDecisionEngine

2. Build the project:

   mvn clean package

3. Deploy the generated WAR file:

   target/career-decision-system.war

4. Place it inside Tomcat `webapps/` directory.

5. Start Tomcat.

6. Access the application:

   http://localhost:8080/career-decision-system/

---

## 10. Design Diagrams

The following diagrams are included in the `/docs` directory:

- System Architecture Diagram
- DFD Level 0
- DFD Level 1
- Decision Logic Flowchart

---

## 11. Future Improvements

With more time, the following enhancements could be added:

- Dynamic domain loading via JSON or database
- Persistent storage of user evaluations
- Advanced normalization strategies
- REST API version of decision engine
- Frontend modernization using a JavaScript framework
- Unit testing for scoring logic
- Performance optimization for large option sets

---

## 12. Conclusion

This project evolved from a simple domain-specific recommendation tool into a structured, reusable decision engine.

The focus was placed on:

- Architectural clarity
- Algorithm transparency
- Extensibility
- Deterministic reasoning

The final result is a modular evaluation framework capable of supporting multiple decision domains without modifying the scoring engine itself.
