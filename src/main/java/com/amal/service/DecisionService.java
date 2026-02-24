package com.amal.service;

import com.amal.model.Domain;
import com.amal.model.Option;

import java.util.*;

public class DecisionService {

    public List<Map.Entry<Option, Integer>> rankOptions(
            Domain domain,
            Map<String, Integer> userInput,
            List<String> selectedOptions
    ) {

        List<Map.Entry<Option, Integer>> ranked = new ArrayList<>();

        for (Option option : domain.getOptions()) {

            if (!selectedOptions.contains(option.getName()))
                continue;

            int score = 0;

            for (String key : userInput.keySet()) {

                int userValue = userInput.get(key);
                Integer optionValue = option.getCriteriaValues().get(key);

                if (optionValue == null) continue;

                int scaledValue = optionValue / 2;

                score += (5 - Math.abs(userValue - scaledValue));
            }

            ranked.add(Map.entry(option, score));
        }

        ranked.sort((a, b) -> b.getValue() - a.getValue());

        return ranked;
    }
}