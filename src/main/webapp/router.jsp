<%
    String domain = request.getParameter("domain");

    if ("career".equalsIgnoreCase(domain)) {
        response.sendRedirect("course.jsp?domain=career");
    } else if ("laptop".equalsIgnoreCase(domain)) {
        response.sendRedirect("assessment.jsp?domain=laptop");
    } else {
        response.sendRedirect("index.jsp");
    }
%>