<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assessment</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<%
    String[] courses = request.getParameterValues("course");

    if (courses == null) {
%>
        <div class="container">
            <h2>Please select at least one course.</h2>
            <a href="course.jsp">Go Back</a>
        </div>
<%
        return;
    }
%>

<div class="container">
    <h1>FutureTech Academy</h1>
    <p class="subtitle">Course Recommendation Assessment</p>

    <form action="evaluate" method="post">

        <!-- Hidden course values -->
        <%
            for(String c : courses){
        %>
            <input type="hidden" name="course" value="<%= c %>">
        <%
            }
        %>

        <div class="section">
            <h2>Career Goals</h2>

            <label>Salary Growth</label>
            <input type="range" name="salary" min="1" max="5" value="3">

            <label>Long Term Stability</label>
            <input type="range" name="stability" min="1" max="5" value="3">

            <label>Get Job Quickly</label>
            <input type="range" name="fastJob" min="1" max="5" value="3">
        </div>

        <div class="section">
            <h2>Technical Preference</h2>

            <label>Enjoy Coding</label>
            <input type="range" name="coding" min="1" max="5" value="3">

            <label>Backend Preference</label>
            <input type="range" name="backendPreference" min="1" max="5" value="3">
        </div>

        <div class="section">
            <h2>Learning Style</h2>

            <label>Comfort with Difficulty</label>
            <input type="range" name="difficulty" min="1" max="5" value="3">

            <label>Corporate Preference</label>
            <input type="range" name="corporatePreference" min="1" max="5" value="3">
        </div>

        <button type="submit" class="submit-btn">
            Find My Best Course
        </button>

    </form>
</div>

</body>
</html>
