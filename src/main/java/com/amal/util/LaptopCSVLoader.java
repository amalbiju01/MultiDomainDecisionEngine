package com.amal.util;

import com.amal.model.Laptop;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.*;

public class LaptopCSVLoader {

    public static List<Laptop> loadSampleLaptops(int limit) {

        List<Laptop> laptops = new ArrayList<>();

        try {
            InputStream is = LaptopCSVLoader.class
                    .getClassLoader()
                    .getResourceAsStream("laptops_cleaned_v1.csv");

            if (is == null) {
                System.out.println("CSV file not found in resources.");
                return laptops;
            }

            BufferedReader br = new BufferedReader(new InputStreamReader(is));

            String line;
            br.readLine(); // Skip header

            while ((line = br.readLine()) != null) {

                // Simple CSV split (works if your file has no quoted commas)
                String[] parts = line.split(",", -1);

                if (parts.length < 9) continue;

                String model = parts[2].trim();

                // --- PRICE CLEANING ---
                String priceRaw = parts[3].trim();
                String priceClean = priceRaw.replaceAll("[^0-9.]", "");
                double price = priceClean.isEmpty() ? 0 :
                        Double.parseDouble(priceClean);

                // --- RATING CLEANING ---
                String ratingRaw = parts[4].trim();
                String ratingClean = ratingRaw.replaceAll("[^0-9.]", "");
                double rating = ratingClean.isEmpty() ? 0 :
                        Double.parseDouble(ratingClean);

                String processorBrand = parts[6].trim();
                String tier = parts[7].trim();

                // --- RAM CLEANING ---
                String ramRaw = parts[8].trim();
                String ramClean = ramRaw.replaceAll("[^0-9]", "");
                int ram = ramClean.isEmpty() ? 0 :
                        Integer.parseInt(ramClean);

                laptops.add(new Laptop(
                        model,
                        price,
                        rating,
                        ram,
                        tier,
                        processorBrand
                ));
            }

            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        Collections.shuffle(laptops);

        return laptops.stream()
                .limit(limit)
                .toList();
    }
}