package com.amal.service;

import com.amal.model.Domain;
import com.amal.model.Option;

import java.util.*;

public class DecisionService {

    public List<Map.Entry<Option, Integer>> rankOptions(
            Domain domain,
            Map<String, Integer> userInput,
            List<String> selectedOptions) {

        List<Map.Entry<Option, Integer>> ranked = new ArrayList<>();

        for (Option option : domain.getOptions()) {

            // If selectedOptions is provided, filter
            if (selectedOptions != null && !selectedOptions.isEmpty()) {
                if (!selectedOptions.contains(option.getName())) {
                    continue;
                }
            }

            int score = 0;

            for (String key : userInput.keySet()) {

                int userValue = userInput.get(key);
                int optionValue =
                        option.getWeights().getOrDefault(key, 0);

                score += (5 - Math.abs(userValue - optionValue));
            }

            ranked.add(Map.entry(option, score));
        }

        ranked.sort((a, b) -> b.getValue() - a.getValue());

        return ranked;
    }

    // Overloaded method (no filtering)
    public List<Map.Entry<Option, Integer>> rankOptions(
            Domain domain,
            Map<String, Integer> userInput) {

        return rankOptions(domain, userInput, null);
    }
}