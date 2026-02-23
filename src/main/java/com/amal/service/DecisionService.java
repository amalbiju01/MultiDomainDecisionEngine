package com.amal.service;

import com.amal.model.Course;

import java.util.*;

public class DecisionService {

    private List<Course> courses = new ArrayList<>();

    public DecisionService() {

        courses.add(new Course("Java Full Stack Developer",
                Map.of("salary", 9, "stability", 9, "fastJob", 5,
                        "coding", 9, "backendPreference", 9,
                        "difficulty", 9, "corporatePreference", 9)));

        courses.add(new Course("MERN Stack Developer",
                Map.of("salary", 8, "stability", 7, "fastJob", 8,
                        "coding", 8, "backendPreference", 5,
                        "difficulty", 7, "corporatePreference", 4)));

        courses.add(new Course("Software Testing & Automation",
                Map.of("salary", 6, "stability", 8, "fastJob", 9,
                        "coding", 5, "backendPreference", 4,
                        "difficulty", 6, "corporatePreference", 8)));
    }

    public List<Map.Entry<String, Integer>> rankCourses(
            Map<String, Integer> userInput,
            List<String> selectedCourses
    ) {

        List<Map.Entry<String, Integer>> ranked = new ArrayList<>();

        for (Course course : courses) {

            if (!selectedCourses.contains(course.getName()))
                continue;

            int score = 0;

            for (String key : userInput.keySet()) {

                int userValue = userInput.get(key);
                int courseValue = course.getWeights().get(key) / 2; // scale 1-9 to 1-5

                score += (5 - Math.abs(userValue - courseValue));
            }


            ranked.add(Map.entry(course.getName(), score));
        }

        ranked.sort((a, b) -> b.getValue() - a.getValue());

        return ranked;
    }
}
