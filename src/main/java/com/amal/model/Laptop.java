package com.amal.model;

public class Laptop {

    private String name;
    private double price;
    private double rating;
    private int ram;
    private String tier;
    private String processorBrand;

    public Laptop(String name, double price,
                  double rating, int ram,
                  String tier, String processorBrand) {
        this.name = name;
        this.price = price;
        this.rating = rating;
        this.ram = ram;
        this.tier = tier;
        this.processorBrand = processorBrand;
    }

    public String getName() { return name; }
    public double getPrice() { return price; }
    public double getRating() { return rating; }
    public int getRam() { return ram; }
    public String getTier() { return tier; }
    public String getProcessorBrand() { return processorBrand; }
}