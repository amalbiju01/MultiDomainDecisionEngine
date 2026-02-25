package com.amal.config;

import com.amal.model.Domain;
import com.amal.model.Option;
import com.amal.model.Laptop;
import com.amal.util.LaptopCSVLoader;

import java.util.*;

public class DomainFactory {

    /* =======================
       CAREER DOMAIN
       ======================= */
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


    /* =======================
       LAPTOP DOMAIN
       ======================= */
    public static Domain buildLaptopDomain() {

        List<String> laptopCriteria = List.of(
                "budget",
                "performance",
                "multitasking",
                "gaming",
                "rating"
        );

        List<Option> laptopOptions = new ArrayList<>();

        List<Laptop> laptops =
                LaptopCSVLoader.loadSampleLaptops(100);
        System.out.println("Loaded laptops: " + laptops.size());

        for (Laptop laptop : laptops) {

            Map<String, Integer> values = new HashMap<>();

            values.put("budget", normalizePrice(laptop.getPrice()));

            values.put("performance",
                    normalizePerformance(laptop.getRam(), laptop.getTier()));

            values.put("multitasking",
                    normalizeMultitasking(laptop.getRam()));

            values.put("gaming",
                    normalizeGaming(laptop.getRam(), laptop.getTier()));

            values.put("rating",
                    normalizeRating(laptop.getRating()));

            Map<String, Object> meta = new HashMap<>();
            meta.put("price", laptop.getPrice());
            meta.put("rating", laptop.getRating());
            meta.put("ram", laptop.getRam());

            laptopOptions.add(new Option(
                    laptop.getName(),
                    values,
                    meta
            ));
        }

        return new Domain("Laptop", laptopCriteria, laptopOptions);
    }


    /* =======================
       NORMALIZATION METHODS
       ======================= */

    private static int normalizePrice(double price) {
        if (price < 40000) return 5;
        if (price < 70000) return 4;
        if (price < 100000) return 3;
        if (price < 150000) return 2;
        return 1;
    }

    private static int normalizePerformance(int ram, String tier) {

        int score = 1;

        if (ram >= 32) score += 2;
        else if (ram >= 16) score += 1;

        String t = tier.toLowerCase();

        if (t.contains("i7") || t.contains("ryzen 7")
                || t.contains("i9") || t.contains("ryzen 9")) {
            score += 2;
        }

        return Math.min(score, 5);
    }

    private static int normalizeRating(double rating) {
        if (rating >= 4.5) return 5;
        if (rating >= 4.2) return 4;
        if (rating >= 4.0) return 3;
        if (rating >= 3.5) return 2;
        return 1;
    }

    private static int normalizeMultitasking(int ram) {
        if (ram >= 32) return 5;
        if (ram >= 16) return 4;
        if (ram >= 8) return 3;
        if (ram >= 4) return 2;
        return 1;
    }

    private static int normalizeGaming(int ram, String tier) {

        int score = 1;

        String t = tier.toLowerCase();

        if (t.contains("i7") || t.contains("i9")
                || t.contains("ryzen 7") || t.contains("ryzen 9")) {
            score += 2;
        }

        if (ram >= 16) score += 2;
        else if (ram >= 8) score += 1;

        return Math.min(score, 5);
    }
}