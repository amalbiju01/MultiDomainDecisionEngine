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

    <style>
        .page-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .container {
            max-width: 800px;
            width: 100%;
            padding: 60px;
        }

        .section-title {
            margin: 30px 0 15px 0;
            font-size: 18px;
            opacity: 0.8;
        }

        .slider-group {
            margin-bottom: 28px;
        }

        .slider-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .slider-label {
            font-weight: 600;
        }

        .slider-value {
            font-weight: 600;
            color: #3b82f6;
        }

        .full-slider {
            width: 100%;
            height: 6px;
            border-radius: 6px;
            background: rgba(255,255,255,0.2);
            outline: none;
            accent-color: #3b82f6;
        }

        .button-group {
            margin-top: 30px;
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
    </style>
</head>

<body>

<div class="page-wrapper">
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

        <% if ("career".equalsIgnoreCase(domain)) { %>

            <h3 class="section-title">Career Outcomes</h3>

            <div class="slider-group">
                <div class="slider-header">
                    <span class="slider-label">Salary Importance</span>
                    <span class="slider-value" id="salaryVal">3</span>
                </div>
                <input type="range" name="salary" min="1" max="5" value="3"
                       class="full-slider"
                       oninput="updateValue('salaryVal', this.value)">
            </div>

            <div class="slider-group">
                <div class="slider-header">
                    <span class="slider-label">Stability</span>
                    <span class="slider-value" id="stabilityVal">3</span>
                </div>
                <input type="range" name="stability" min="1" max="5" value="3"
                       class="full-slider"
                       oninput="updateValue('stabilityVal', this.value)">
            </div>

            <div class="slider-group">
                <div class="slider-header">
                    <span class="slider-label">Fast Job Opportunity</span>
                    <span class="slider-value" id="fastJobVal">3</span>
                </div>
                <input type="range" name="fastJob" min="1" max="5" value="3"
                       class="full-slider"
                       oninput="updateValue('fastJobVal', this.value)">
            </div>

            <h3 class="section-title">Personal Preference</h3>

            <div class="slider-group">
                <div class="slider-header">
                    <span class="slider-label">Coding Interest</span>
                    <span class="slider-value" id="codingVal">3</span>
                </div>
                <input type="range" name="coding" min="1" max="5" value="3"
                       class="full-slider"
                       oninput="updateValue('codingVal', this.value)">
            </div>

            <div class="slider-group">
                <div class="slider-header">
                    <span class="slider-label">Backend Preference</span>
                    <span class="slider-value" id="backendVal">3</span>
                </div>
                <input type="range" name="backendPreference" min="1" max="5" value="3"
                       class="full-slider"
                       oninput="updateValue('backendVal', this.value)">
            </div>

            <div class="slider-group">
                <div class="slider-header">
                    <span class="slider-label">Difficulty Tolerance</span>
                    <span class="slider-value" id="difficultyVal">3</span>
                </div>
                <input type="range" name="difficulty" min="1" max="5" value="3"
                       class="full-slider"
                       oninput="updateValue('difficultyVal', this.value)">
            </div>

            <h3 class="section-title">Work Environment</h3>

            <div class="slider-group">
                <div class="slider-header">
                    <span class="slider-label">Corporate Environment Preference</span>
                    <span class="slider-value" id="corporateVal">3</span>
                </div>
                <input type="range" name="corporatePreference" min="1" max="5" value="3"
                       class="full-slider"
                       oninput="updateValue('corporateVal', this.value)">
            </div>

        <% } else if ("laptop".equalsIgnoreCase(domain)) { %>

            <h3 class="section-title">Usage Requirements</h3>

            <%
                String[][] laptopCriteria = {
                    {"budget", "How Important Is Staying Within Budget?"},
                    {"performance", "Performance Need"},
                    {"multitasking", "Multitasking Need"},
                    {"gaming", "Gaming / Heavy Usage Need"},
                    {"rating", "Rating Importance"}
                };

                for (String[] c : laptopCriteria) {
            %>

            <div class="slider-group">
                <div class="slider-header">
                    <span class="slider-label"><%= c[1] %></span>
                    <span class="slider-value" id="<%= c[0] %>Val">3</span>
                </div>
                <input type="range" name="<%= c[0] %>" min="1" max="5" value="3"
                       class="full-slider"
                       oninput="updateValue('<%= c[0] %>Val', this.value)">
            </div>

            <% } %>

        <% } %>

        <div class="button-group">
            <button type="submit" class="primary-btn">Evaluate</button>

            <% if ("career".equalsIgnoreCase(domain)) { %>
                <a href="course.jsp?domain=career" class="secondary-btn">
                    Back to Course Selection
                </a>
            <% } else { %>
                <a href="index.jsp" class="secondary-btn">
                    Back to Home
                </a>
            <% } %>
        </div>

    </form>

</div>
</div>

<script>
function updateValue(id, value) {
    document.getElementById(id).innerText = value;
}
</script>

</body>
</html>