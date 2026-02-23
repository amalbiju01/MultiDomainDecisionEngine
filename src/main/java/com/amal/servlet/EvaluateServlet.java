package com.amal.servlet;

import com.amal.service.DecisionService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;


@WebServlet("/evaluate")
public class EvaluateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {



        String[] selected = request.getParameterValues("course");


        if (selected == null) {
            response.getWriter().println("Please select at least one course.");
            return;
        }

        Map<String, Integer> userInput = new HashMap<>();

        userInput.put("salary", Integer.parseInt(request.getParameter("salary")));
        userInput.put("stability", Integer.parseInt(request.getParameter("stability")));
        userInput.put("fastJob", Integer.parseInt(request.getParameter("fastJob")));
        userInput.put("coding", Integer.parseInt(request.getParameter("coding")));
        userInput.put("backendPreference", Integer.parseInt(request.getParameter("backendPreference")));
        userInput.put("difficulty", Integer.parseInt(request.getParameter("difficulty")));
        userInput.put("corporatePreference", Integer.parseInt(request.getParameter("corporatePreference")));

        DecisionService service = new DecisionService();

        List<Map.Entry<String, Integer>> ranked =
                service.rankCourses(userInput, Arrays.asList(selected));

        request.setAttribute("ranking", ranked);

        request.getRequestDispatcher("result.jsp")
                .forward(request, response);
    }
}
