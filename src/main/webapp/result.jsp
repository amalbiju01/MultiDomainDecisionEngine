<%@ page import="java.util.*" %>
<%@ page import="com.amal.model.Option" %>
<%@ page import="com.amal.model.Domain" %>


<%
    List<Map.Entry<Option, Integer>> ranked =
            (List<Map.Entry<Option, Integer>>) request.getAttribute("rankedOptions");

    Domain domain = (Domain) request.getAttribute("domain");
    Map<String, Integer> userInput =
            (Map<String, Integer>) request.getAttribute("userInput");

    String explanation =
            (String) request.getAttribute("explanation");

    String confidenceLevel =
            (String) request.getAttribute("confidenceLevel");

    String confidenceMessage =
            (String) request.getAttribute("confidenceMessage");

    List<String> criteria = domain.getCriteria();
int maxScore = (Integer) request.getAttribute("maxScore");%>

<!DOCTYPE html>
<html>
<head>
    <title>Results</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

<h1>Top Recommendations</h1>

<% if (explanation != null && !explanation.isEmpty()) { %>
<div class="info-box">
<strong>Why #1?</strong><br>
<%= explanation %>
</div>
<br>
<% } %>

<% if (confidenceLevel != null && !confidenceLevel.isEmpty()) { %>
<div class="confidence-box">
<strong>Confidence Level: <%= confidenceLevel %></strong><br>
<%= confidenceMessage %>
</div>
<br>
<% } %>

<%
if (ranked != null && !ranked.isEmpty()) {

    int rank = 1;

    for (Map.Entry<Option, Integer> entry : ranked) {

        if (rank > 5) break;

        Option option = entry.getKey();
        int totalScore = entry.getValue();
        int percentage = (maxScore == 0)
                ? 0
                : (totalScore * 100) / maxScore;
%>

<div class="result-card">
<h3><%= rank %>. <%= option.getName() %>
<% if (rank == 1) { %>
<span class="badge">Best Match</span>
<% } %>
</h3>

<%
if (option.getMetadata() != null &&
    option.getMetadata().get("price") != null) {
    double price =
        (Double) option.getMetadata().get("price");
%>
<p><strong>Price:</strong> ₹ <%= String.format("%,.0f", price) %></p>
<% } %>

<p><strong>Overall Match: <%= percentage %>%</strong></p>

<hr>

<%
for (String key : criteria) {

    int userVal = userInput.getOrDefault(key, 0);
    int optionVal = option.getWeights().getOrDefault(key, 0);

    // Normalize 1–10 → 1–5
    int normalizedOptionVal = (optionVal + 1) / 2;
int similarity = 5 - Math.abs(userVal - normalizedOptionVal);
similarity = Math.max(similarity, 0);

int weightedScore = similarity * userVal;

// 25 = 5 (max similarity) × 5 (max importance)
int percent = (weightedScore * 100) / 25;
%>

<strong><%= key.substring(0,1).toUpperCase()+key.substring(1) %></strong><br>
Match: <%= percent %>%
<div class="progress-bar">
<div class="progress-fill"
style="width:<%= percent %>%"></div>
</div>
<br>

<% } %>

</div>
<br><br>

<%
rank++;
}
}
%>

<a href="home.jsp">
<button class="submit-btn">Back to Home</button>
</a>

</div>
</body>
</html>