<%@ page import="java.util.*" %>
<%@ page import="com.amal.model.Option" %>

<html>
<head>
    <title>Results</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h2>Ranking Results</h2>

<%
List<Map.Entry<Option, Integer>> ranked =
        (List<Map.Entry<Option, Integer>>) request.getAttribute("rankedOptions");

int rank = 1;

for (Map.Entry<Option, Integer> entry : ranked) {
%>

    <p>
        <strong><%= rank %>. <%= entry.getKey().getName() %></strong>
        - Score: <%= entry.getValue() %>
    </p>

<%
    rank++;
}
%>
<br><br>

<a href="index.jsp">
    <button>Back to Home</button>
</a>

</body>
</html>