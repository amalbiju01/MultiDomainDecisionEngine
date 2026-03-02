package com.amal.engine;

import com.amal.model.Domain;
import com.amal.model.Option;

import java.util.*;

public interface DecisionEngine {

    List<Map.Entry<Option, Integer>> evaluate(
            Domain domain,
            Map<String, Integer> userInput,
            List<String> selectedOptions
    );
}