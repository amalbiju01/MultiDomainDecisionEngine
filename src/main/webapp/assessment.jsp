<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String domain = request.getParameter("domain");
    if (domain == null) {
        domain = "career";
    }

    String[] selectedCourses = request.getParameterValues("course");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Assessment</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>Decision Companion System</h1>
    <p class="subtitle">Rate Your Preferences (1 = Low, 5 = High)</p>

    <form action="evaluate" method="post">

        <input type="hidden" name="domain" value="<%= domain %>">

        <% if ("career".equalsIgnoreCase(domain) && selectedCourses != null) {
            for (String c : selectedCourses) { %>
                <input type="hidden" name="course" value="<%= c %>">
        <%  }
           }
        %>

        <div class="section">

        <% if ("career".equalsIgnoreCase(domain)) { %>

            Salary Importance:
            <input type="range" name="salary" min="1" max="5" required><br><br>

            Stability:
            <input type="range" name="stability" min="1" max="5" required><br><br>

            Fast Job Opportunity:
            <input type="range" name="fastJob" min="1" max="5" required><br><br>

            Coding Interest:
            <input type="range" name="coding" min="1" max="5" required><br><br>

            Backend Preference:
            <input type="range" name="backendPreference" min="1" max="5" required><br><br>

            Difficulty Tolerance:
            <input type="range" name="difficulty" min="1" max="5" required><br><br>

            Corporate Environment Preference:
            <input type="range" name="corporatePreference" min="1" max="5" required>

        <% } else if ("laptop".equalsIgnoreCase(domain)) { %>

            Budget Importance:
            <input type="range" name="budget" min="1" max="5" required><br><br>

            Performance Need:
            <input type="range" name="performance" min="1" max="5" required><br><br>

            Multitasking Need:
            <input type="range" name="multitasking" min="1" max="5" required><br><br>

            Gaming / Heavy Usage Need:
            <input type="range" name="gaming" min="1" max="5" required><br><br>

            Rating Importance:
            <input type="range" name="rating" min="1" max="5" required>

        <% } %>

        </div>

        <br>
        <button type="submit" class="submit-btn">Evaluate</button>

    </form>

    <br>

    <% if ("career".equalsIgnoreCase(domain)) { %>
        <a href="course.jsp?domain=career">
            <button>Back to Course Selection</button>
        </a>
    <% } else { %>
        <a href="index.jsp">
            <button>Back to Home</button>
        </a>
    <% } %>

</div>

</body>
</html>