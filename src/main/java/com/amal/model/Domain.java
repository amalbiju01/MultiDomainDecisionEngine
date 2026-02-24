package com.amal.model;

import java.util.List;

public class Domain {

    private String name;
    private List<String> criteria;
    private List<Option> options;

    public Domain(String name, List<String> criteria, List<Option> options) {
        this.name = name;
        this.criteria = criteria;
        this.options = options;
    }

    public String getName() {
        return name;
    }

    public List<String> getCriteria() {
        return criteria;
    }

    public List<Option> getOptions() {
        return options;
    }
}