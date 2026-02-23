package com.amal.model;

import java.util.Map;

public class Course {

    private String name;
    private Map<String, Integer> weights;

    public Course(String name, Map<String, Integer> weights) {
        this.name = name;
        this.weights = weights;
    }

    public String getName() {
        return name;
    }

    public Map<String, Integer> getWeights() {
        return weights;
    }
}
