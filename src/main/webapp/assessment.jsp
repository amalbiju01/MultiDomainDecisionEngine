<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String domainType = request.getParameter("domain");
    String[] selectedCourses = request.getParameterValues("course");

    if (domainType == null) {
        domainType = "career";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Career Assessment</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>FutureTech Academy</h1>
    <p class="subtitle">Rate Your Preferences (1 = Low, 5 = High)</p>

    <form action="evaluate" method="post">

        <!-- Preserve Domain -->
        <input type="hidden" name="domain" value="<%= domainType %>">

        <!-- Preserve Selected Courses -->
        <%
            if (selectedCourses != null) {
                for (String c : selectedCourses) {
        %>
                    <input type="hidden" name="course" value="<%= c %>">
        <%
                }
            }
        %>

        <div class="section">

            Salary Importance:
            <input type="range" name="salary" min="1" max="5" required>
            <br><br>

            Stability:
            <input type="range" name="stability" min="1" max="5" required>
            <br><br>

            Fast Job Opportunity:
            <input type="range" name="fastJob" min="1" max="5" required>
            <br><br>

            Coding Interest:
            <input type="range" name="coding" min="1" max="5" required>
            <br><br>

            Backend Preference:
            <input type="range" name="backendPreference" min="1" max="5" required>
            <br><br>

            Difficulty Tolerance:
            <input type="range" name="difficulty" min="1" max="5" required>
            <br><br>

            Corporate Environment Preference:
            <input type="range" name="corporatePreference" min="1" max="5" required>

        </div>

        <br>

        <button type="submit" class="submit-btn">
            Evaluate
        </button>

    </form>

    <br>

    <a href="course.jsp?domain=<%= domainType %>">
        <button>Back to Course Selection</button>
    </a>

</div>

</body>
</html>