package com.amal.config;

import com.amal.model.Domain;
import com.amal.model.Option;

import java.util.*;

public class DomainFactory {

    public static Domain buildCareerDomain() {

        List<String> careerCriteria = List.of(
                "salary",
                "stability",
                "fastJob",
                "coding",
                "backendPreference",
                "difficulty",
                "corporatePreference"
        );

        List<Option> careerOptions = new ArrayList<>();

        careerOptions.add(new Option("Java Full Stack Developer",
                Map.of("salary", 9, "stability", 9, "fastJob", 5,
                        "coding", 9, "backendPreference", 9,
                        "difficulty", 9, "corporatePreference", 9)));

        careerOptions.add(new Option("MERN Stack Developer",
                Map.of("salary", 8, "stability", 7, "fastJob", 8,
                        "coding", 8, "backendPreference", 5,
                        "difficulty", 7, "corporatePreference", 4)));

        careerOptions.add(new Option("Software Testing & Automation",
                Map.of("salary", 6, "stability", 8, "fastJob", 9,
                        "coding", 5, "backendPreference", 4,
                        "difficulty", 6, "corporatePreference", 8)));

        return new Domain("Career", careerCriteria, careerOptions);
    }
}