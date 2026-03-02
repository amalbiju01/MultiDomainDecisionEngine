package com.amal.util;

import com.amal.model.Domain;
import com.amal.model.Option;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.InputStream;
import java.util.*;

public class CareerJSONLoader {

    public static Domain loadCareerDomain() {

        try {

            ObjectMapper mapper = new ObjectMapper();

            InputStream is =
                    CareerJSONLoader.class.getClassLoader()
                            .getResourceAsStream("career_domain.json");

            JsonNode root = mapper.readTree(is);

            String name = root.get("name").asText();

            // Load criteria
            List<String> criteria = new ArrayList<>();
            for (JsonNode c : root.get("criteria")) {
                criteria.add(c.asText());
            }

            // Load options
            List<Option> options = new ArrayList<>();

            for (JsonNode opt : root.get("options")) {

                String optionName = opt.get("name").asText();

                Map<String, Integer> weights = new HashMap<>();

                JsonNode weightNode = opt.get("weights");

                Iterator<String> fields = weightNode.fieldNames();

                while (fields.hasNext()) {
                    String key = fields.next();
                    weights.put(key, weightNode.get(key).asInt());
                }

                options.add(new Option(optionName, weights));
            }

            return new Domain(name, criteria, options);

        } catch (Exception e) {
            throw new RuntimeException("Failed to load Career JSON", e);
        }
    }
}