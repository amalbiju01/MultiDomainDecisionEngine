<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Course Ranking Result</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>Course Ranking Result</h1>

    <%
        List<Map.Entry<String, Integer>> ranking =
            (List<Map.Entry<String, Integer>>) request.getAttribute("ranking");

        if (ranking != null && !ranking.isEmpty()) {

            int rank = 1;

            for (Map.Entry<String, Integer> entry : ranking) {
    %>

                <p>
                    <strong><%= rank %>. <%= entry.getKey() %></strong>
                    — Score: <%= entry.getValue() %>
                </p>

    <%
                rank++;
            }

        } else {
    %>

            <p>No ranking results found.</p>

    <%
        }
    %>

    <br><br>

    <a href="index.html">
        <button class="submit-btn">Back</button>
    </a>

</div>

</body>
</html>
