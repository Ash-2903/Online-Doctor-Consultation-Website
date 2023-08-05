package com.rating;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

public class ItemBasedCollaborativeFiltering {

    // Data structure to store item ratings
    private Map<String, Map<String, Double>> itemRatings;

    public ItemBasedCollaborativeFiltering() {
        this.itemRatings = new HashMap<>();
    }

    // Method to add a rating for an item
    
    @SuppressWarnings("unchecked")
	public void addRating(String item, String user, double rating) {
		/*
		 * itemRatings.computeIfAbsent(item, (Function<? super String, ? extends
		 * Map<String, Double>>) new HashMap<>());
		 */
        itemRatings.computeIfAbsent(item, key -> new HashMap<>());
        itemRatings.get(item).put(user, rating);
    }

    // Method to predict the rating for a given item based on other items' ratings
    public double predictRating(String item) {
        double totalRating = 0.0;
        int totalRaters = 0;

        if (itemRatings.containsKey(item)) {
            Map<String, Double> ratingsForItem = itemRatings.get(item);

            for (String user : ratingsForItem.keySet()) {
                double userRating = ratingsForItem.get(user);

                for (String otherItem : itemRatings.keySet()) {
                    if (!otherItem.equals(item)) {
                        Map<String, Double> ratingsForOtherItem = itemRatings.get(otherItem);
                        if (ratingsForOtherItem.containsKey(user)) {
                            double otherItemRating = ratingsForOtherItem.get(user);
                            totalRating += (otherItemRating * userRating);
                            totalRaters++;
                        }
                    }
                }
            }
        }

        if (totalRaters > 0) {
            // Calculate the predicted rating as the average of weighted ratings
            return totalRating / totalRaters;
        } else {
            // Return a default rating if there are no similar items rated by the same users
            return 0.0;
        }
    }

    // Method to calculate and return the best item based on average rating
    public String getBestItem() {
        String bestItem = null;
        double maxAverageRating = Double.MIN_VALUE;

        for (String item : itemRatings.keySet()) {
            Map<String, Double> ratingsForItem = itemRatings.get(item);
            double totalRating = 0.0;
            int numRatings = ratingsForItem.size();

            if (numRatings > 0) {
                for (double rating : ratingsForItem.values()) {
                    totalRating += rating;
                }

                double averageRating = totalRating / numRatings;

                if (averageRating > maxAverageRating) {
                    maxAverageRating = averageRating;
                    bestItem = item;
                }
            }
        }

        return bestItem;
    }
    
    public String getNthBestItem(int n) {
        List<Map.Entry<String, Double>> itemsByAverageRating = new ArrayList<>(itemRatings.size());

        for (Map.Entry<String, Map<String, Double>> entry : itemRatings.entrySet()) {
            String item = entry.getKey();
            Map<String, Double> ratingsForItem = entry.getValue();
            double totalRating = 0.0;
            int numRatings = ratingsForItem.size();

            if (numRatings > 0) {
                for (double rating : ratingsForItem.values()) {
                    totalRating += rating;
                }

                double averageRating = totalRating / numRatings;

                itemsByAverageRating.add(new AbstractMap.SimpleEntry<>(item, averageRating));
            }
        }

        // Sort items by average rating in descending order
        itemsByAverageRating.sort(Map.Entry.<String, Double>comparingByValue().reversed());

        if (n > 0 && n <= itemsByAverageRating.size()) {
            return itemsByAverageRating.get(n - 1).getKey();
        } else {
            return null; // If n is invalid (out of range), return null
        }
    }
}