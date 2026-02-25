package com.amal.model;

import java.util.HashMap;
import java.util.Map;

public class Option {

    private String name;
    private Map<String, Integer> weights;
    private Map<String, Object> metadata;

    // Constructor without metadata (Career)
    public Option(String name, Map<String, Integer> weights) {
        this.name = name;
        this.weights = weights;
        this.metadata = new HashMap<>();
    }

    // Constructor with metadata (Laptop)
    public Option(String name,
                  Map<String, Integer> weights,
                  Map<String, Object> metadata) {
        this.name = name;
        this.weights = weights;
        this.metadata = metadata;
    }

    public String getName() {
        return name;
    }

    public Map<String, Integer> getWeights() {
        return weights;
    }

    public Map<String, Object> getMetadata() {
        return metadata;
    }
}