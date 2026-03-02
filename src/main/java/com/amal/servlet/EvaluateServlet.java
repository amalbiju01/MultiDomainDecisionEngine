package com.amal.servlet;

import com.amal.config.DomainFactory;
import com.amal.model.Domain;
import com.amal.model.Option;
import com.amal.engine.DecisionEngine;
import com.amal.engine.SimilarityDecisionEngine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/evaluate")
public class EvaluateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String domainType = request.getParameter("domain");

        if (domainType == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        Map<String, Integer> userInput = new HashMap<>();
        Domain domain;

        // ========================
        // BUILD DOMAIN + USER INPUT
        // ========================

        if ("career".equalsIgnoreCase(domainType)) {

            userInput.put("salary",
                    Integer.parseInt(request.getParameter("salary")));
            userInput.put("stability",
                    Integer.parseInt(request.getParameter("stability")));
            userInput.put("fastJob",
                    Integer.parseInt(request.getParameter("fastJob")));
            userInput.put("coding",
                    Integer.parseInt(request.getParameter("coding")));
            userInput.put("backendPreference",
                    Integer.parseInt(request.getParameter("backendPreference")));
            userInput.put("difficulty",
                    Integer.parseInt(request.getParameter("difficulty")));
            userInput.put("corporatePreference",
                    Integer.parseInt(request.getParameter("corporatePreference")));

            domain = DomainFactory.buildCareerDomain();

        } else if ("laptop".equalsIgnoreCase(domainType)) {

            userInput.put("budget",
                    Integer.parseInt(request.getParameter("budget")));
            userInput.put("performance",
                    Integer.parseInt(request.getParameter("performance")));
            userInput.put("multitasking",
                    Integer.parseInt(request.getParameter("multitasking")));
            userInput.put("gaming",
                    Integer.parseInt(request.getParameter("gaming")));
            userInput.put("rating",
                    Integer.parseInt(request.getParameter("rating")));

            domain = DomainFactory.buildLaptopDomain();

        } else {
            response.sendRedirect("index.jsp");
            return;
        }

        // ========================
        // HANDLE SELECTED OPTIONS
        // ========================

        String[] selected = request.getParameterValues("course");

        List<String> selectedList = new ArrayList<>();

        if ("career".equalsIgnoreCase(domainType)) {

            if (selected == null || selected.length < 2) {
                response.sendRedirect("course.jsp?domain=career");
                return;
            }

            selectedList = Arrays.asList(selected);
        }

        // ========================
        // RANKING USING ENGINE
        // ========================

        DecisionEngine engine = new SimilarityDecisionEngine();

        List<Map.Entry<Option, Integer>> ranked =
                engine.evaluate(domain, userInput, selectedList);

        // ========================
        // EXPLANATION + CONFIDENCE
        // ========================

        String explanation = "";
        String confidenceLevel = "";
        String confidenceMessage = "";

        if (!ranked.isEmpty()) {

            Option top = ranked.get(0).getKey();

            int maxScore = domain.getCriteria().size() * 25;
            request.setAttribute("maxScore", maxScore);
            // 5 similarity * 5 importance = 25 max per criterion

            Map<String, Integer> weightedMatches = new HashMap<>();

            for (String key : domain.getCriteria()) {

                int userVal = userInput.getOrDefault(key, 0);
                int rawOptionVal =
                        top.getWeights().getOrDefault(key, 0);

                int normalizedOptionVal = (rawOptionVal + 1) / 2;

                int similarity =
                        5 - Math.abs(userVal - normalizedOptionVal);

                similarity = Math.max(similarity, 0);

                int weighted = similarity * userVal;

                weightedMatches.put(key, weighted);
            }

            List<Map.Entry<String, Integer>> sorted =
                    new ArrayList<>(weightedMatches.entrySet());

            sorted.sort((a, b) -> b.getValue() - a.getValue());

            String first = format(sorted.get(0).getKey());
            String second = sorted.size() > 1
                    ? format(sorted.get(1).getKey())
                    : "";

            explanation = "This option ranks highest because it strongly aligns with your "
                    + first
                    + (second.isEmpty()
                    ? " preference."
                    : " and " + second + " preference.");

            if (ranked.size() > 1) {

                int score1 = ranked.get(0).getValue();
                int score2 = ranked.get(1).getValue();

                int percent1 = (score1 * 100) / maxScore;
                int percent2 = (score2 * 100) / maxScore;

                int gap = percent1 - percent2;

                if (gap >= 15) {
                    confidenceLevel = "High";
                    confidenceMessage =
                            "The top recommendation clearly stands out from other options.";
                } else if (gap >= 7) {
                    confidenceLevel = "Moderate";
                    confidenceMessage =
                            "The top recommendation performs better, but alternatives are competitive.";
                } else {
                    confidenceLevel = "Low";
                    confidenceMessage =
                            "Multiple options are closely matched to your preferences.";
                }
            }
        }

        request.setAttribute("rankedOptions", ranked);
        request.setAttribute("domain", domain);
        request.setAttribute("userInput", userInput);
        request.setAttribute("explanation", explanation);
        request.setAttribute("confidenceLevel", confidenceLevel);
        request.setAttribute("confidenceMessage", confidenceMessage);

        request.getRequestDispatcher("result.jsp")
                .forward(request, response);
    }

    private String format(String key) {
        return key.substring(0, 1).toUpperCase() + key.substring(1);
    }
}