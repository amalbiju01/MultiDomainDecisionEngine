<%@ page import="java.util.*" %>
<%@ page import="com.amal.model.Option" %>
<%@ page import="com.amal.model.Domain" %>

<%
    List<Map.Entry<Option, Integer>> ranked =
            (List<Map.Entry<Option, Integer>>) request.getAttribute("rankedOptions");

    Domain domain = (Domain) request.getAttribute("domain");
    Map<String, Integer> userInput =
            (Map<String, Integer>) request.getAttribute("userInput");

    List<String> criteria = domain.getCriteria();
    int maxScore = criteria.size() * 5;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Results</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>Top Recommendations</h1>
    <p class="subtitle">Detailed Match Breakdown</p>

    <br>

<%
    if (ranked != null && !ranked.isEmpty()) {

        int rank = 1;

        for (Map.Entry<Option, Integer> entry : ranked) {

            if (rank > 5) break;

            Option option = entry.getKey();
            int totalScore = entry.getValue();
            int percentage = (totalScore * 100) / maxScore;
%>

    <div class="result-card">
        <h3><%= rank %>. <%= option.getName() %></h3>

        <%
            if (option.getMetadata() != null &&
                option.getMetadata().get("price") != null) {
                double price =
                    (Double) option.getMetadata().get("price");
        %>

            <p><strong>Price:</strong> ₹ <%= String.format("%,.0f", price) %></p>

        <%
            }
        %>
        <p><strong>Overall Match: <%= percentage %>%</strong></p>

        <hr>

<%
        for (String key : criteria) {

            int userVal = userInput.getOrDefault(key, 0);
            int optionVal = option.getWeights().getOrDefault(key, 0);
            int criterionScore = 5 - Math.abs(userVal - optionVal);
            int criterionPercent = (criterionScore * 100) / 5;
%>

        <div class="criterion-row">
            <strong><%= key %></strong><br>
            You: <%= userVal %> | Option: <%= optionVal %><br>
            Match: <%= criterionPercent %>%
            <div class="progress-bar">
                <div class="progress-fill"
                     style="width:<%= criterionPercent %>%"></div>
            </div>
            <br>
        </div>

<%
        }
%>

    </div>

    <br><br>

<%
            rank++;
        }
    } else {
%>

    <p>No results found.</p>

<%
    }
%>

    <div class="info-box">
        This system uses similarity scoring (1–5 scale).
        Each criterion contributes equally.
        The closer the option matches your input,
        the higher the score.
    </div>

    <br>

    <a href="index.jsp">
        <button class="submit-btn">Back to Home</button>
    </a>

</div>

</body>
</html>