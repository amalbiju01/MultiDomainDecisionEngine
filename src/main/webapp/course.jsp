<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String domainType = request.getParameter("domain");
    if (domainType == null) {
        domainType = "career";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Select Course</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>FutureTech Academy</h1>
    <p class="subtitle">Select Courses You Are Interested In</p>

    <!-- POST to assessment.jsp -->
    <form action="assessment.jsp" method="post">

        <!-- Preserve Domain -->
        <input type="hidden" name="domain" value="<%= domainType %>">

        <div class="section">

            <label>
                <input type="checkbox" name="course"
                       value="Java Full Stack Developer">
                Java Full Stack Developer
            </label>
            <br><br>

            <label>
                <input type="checkbox" name="course"
                       value="MERN Stack Developer">
                MERN Stack Developer
            </label>
            <br><br>

            <label>
                <input type="checkbox" name="course"
                       value="Software Testing & Automation">
                Software Testing & Automation
            </label>

        </div>

        <br>

        <button type="submit" class="submit-btn">
            Next
        </button>

    </form>

    <br>

    <!-- Back Button -->
    <a href="index.jsp">
        <button>Back to Home</button>
    </a>

</div>

</body>
</html>