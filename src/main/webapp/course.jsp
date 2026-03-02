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
    <title>Select Courses</title>
    <link rel="stylesheet" href="style.css">

    <style>
        .page-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .container {
            max-width: 900px;
            width: 100%;
            padding: 60px;
        }

        .title {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .subtitle {
            opacity: 0.7;
            margin-bottom: 35px;
        }

        .course-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .course-card {
            background: rgba(255,255,255,0.06);
            border-radius: 18px;
            padding: 20px;
            cursor: pointer;
            transition: 0.3s ease;
            border: 2px solid transparent;
        }

        .course-card input {
            display: none;
        }

        .course-card:hover {
            transform: translateY(-4px);
        }

        .course-card input:checked + .course-content {
            border: 2px solid #3b82f6;
            border-radius: 12px;
            padding: 15px;
        }

        .course-content h3 {
            font-size: 16px;
            text-align: center;
        }

        .validation-message {
            display: none;
            background: rgba(255, 77, 77, 0.15);
            border: 1px solid rgba(255, 77, 77, 0.4);
            color: #ff6b6b;
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .primary-btn {
            padding: 14px;
            border-radius: 12px;
            border: none;
            background: linear-gradient(90deg, #3b82f6, #2563eb);
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        .secondary-btn {
            text-align: center;
            padding: 14px;
            border-radius: 12px;
            border: 2px solid rgba(255,255,255,0.3);
            background: transparent;
            color: white;
            text-decoration: none;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .course-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<div class="page-wrapper">
<div class="container">

    <h1 class="title">FutureTech Academy</h1>
    <p class="subtitle">Select at least two courses for comparison</p>

    <form action="assessment.jsp" method="post" id="courseForm">

        <input type="hidden" name="domain" value="<%= domainType %>">

        <div class="course-grid">

            <%
                String[] courses = {
                    "Java Full Stack Developer",
                    "MERN Stack Developer",
                    "Software Testing & Automation",
                    "DevOps Engineer",
                    "Data Analyst",
                    "Data Scientist",
                    "Cloud Engineer (AWS/Azure)",
                    "Cybersecurity Analyst",
                    "Business Analyst",
                    "UI/UX Designer",
                    "Android Developer",
                    "Python Full Stack Developer"
                };

                for (String course : courses) {
            %>

            <label class="course-card">
                <input type="checkbox" name="course" value="<%= course %>">
                <div class="course-content">
                    <h3><%= course %></h3>
                </div>
            </label>

            <% } %>

        </div>

        <div id="validationMessage" class="validation-message"></div>

        <div class="button-group">
            <button type="submit" class="primary-btn">Next</button>
            <a href="index.jsp" class="secondary-btn">Back</a>
        </div>

    </form>

</div>
</div>

<script>
document.getElementById("courseForm").addEventListener("submit", function(e) {

    const checked = document.querySelectorAll('input[name="course"]:checked');
    const messageBox = document.getElementById("validationMessage");

    if (checked.length < 2) {
        e.preventDefault();
        messageBox.innerText = "Please select at least two courses for comparison.";
        messageBox.style.display = "block";
    } else {
        messageBox.style.display = "none";
    }
});
</script>

</body>
</html>