package com.amal.servlet;

import com.amal.config.DomainFactory;
import com.amal.model.Domain;
import com.amal.model.Option;
import com.amal.service.DecisionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/evaluate")
public class EvaluateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Integer> userInput = new HashMap<>();

        // Collect user inputs
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

        // Collect selected courses from previous page
        String[] selected = request.getParameterValues("course");

        List<String> selectedCourses = new ArrayList<>();

        if (selected != null) {
            selectedCourses = Arrays.asList(selected);
        }

        // Build Career Domain
        Domain careerDomain = DomainFactory.buildCareerDomain();

        // Rank using generic engine
        DecisionService service = new DecisionService();

        List<Map.Entry<Option, Integer>> ranked =
                service.rankOptions(careerDomain, userInput, selectedCourses);

        request.setAttribute("rankedOptions", ranked);

        request.getRequestDispatcher("result.jsp")
                .forward(request, response);
    }
}