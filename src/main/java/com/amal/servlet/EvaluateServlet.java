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

        // Get selected options (course or laptop)
        String[] selected = request.getParameterValues("course");

        List<String> selectedList = new ArrayList<>();

        if (selected != null) {
            selectedList = Arrays.asList(selected);
        }

        DecisionService service = new DecisionService();

        List<Map.Entry<Option, Integer>> ranked =
                service.rankOptions(domain, userInput, selectedList);

        System.out.println("Ranked size: " + ranked.size());

        request.setAttribute("rankedOptions", ranked);
        request.setAttribute("userInput", userInput);
        request.setAttribute("domain", domain);

        request.getRequestDispatcher("result.jsp")
                .forward(request, response);
    }
}
