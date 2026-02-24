package com.amal.model;

import java.util.Map;

public class Option {

    private String name;
    private Map<String, Integer> criteriaValues;

    public Option(String name, Map<String, Integer> criteriaValues) {
        this.name = name;
        this.criteriaValues = criteriaValues;
    }

    public String getName() {
        return name;
    }

    public Map<String, Integer> getCriteriaValues() {
        return criteriaValues;
    }
}