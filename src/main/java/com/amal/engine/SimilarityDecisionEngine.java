package com.amal.engine;

import com.amal.model.Domain;
import com.amal.model.Option;

import java.util.*;

public class SimilarityDecisionEngine implements DecisionEngine {

    private static final int MAX_SCALE = 5;

    @Override
    public List<Map.Entry<Option, Integer>> evaluate(
            Domain domain,
            Map<String, Integer> userInput,
            List<String> selectedOptions) {

        List<Map.Entry<Option, Integer>> ranked = new ArrayList<>();

        for (Option option : domain.getOptions()) {

            if (selectedOptions != null && !selectedOptions.isEmpty()) {
                if (!selectedOptions.contains(option.getName())) {
                    continue;
                }
            }

            int totalScore = 0;

            for (String key : userInput.keySet()) {

                int userValue = userInput.getOrDefault(key, 0);
                int rawOptionValue =
                        option.getWeights().getOrDefault(key, 0);

                int normalizedOptionValue =
                        normalizeToFiveScale(rawOptionValue);

                int similarity =
                        MAX_SCALE - Math.abs(userValue - normalizedOptionValue);

                similarity = Math.max(similarity, 0);


                int weightedScore = similarity * userValue;

                totalScore += weightedScore;
            }

            ranked.add(Map.entry(option, totalScore));
        }

        ranked.sort((a, b) -> b.getValue() - a.getValue());

        return ranked;
    }

    private int normalizeToFiveScale(int value) {
        // Convert 1–10 scale to 1–5 safely
        return (value + 1) / 2;
    }
}