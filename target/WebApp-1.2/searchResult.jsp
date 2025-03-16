<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="meta.jsp" />
    <title>Category Search Results</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
    <h2>Category Search Results for: "<%=request.getAttribute("searchTerm")%>"</h2>

    <%
        List<String> searchResults = (List<String>) request.getAttribute("searchResults");
        Integer totalResults = (Integer) request.getAttribute("totalResults");
        Boolean foundMatches = (Boolean) request.getAttribute("foundMatches");
    %>

    <% if (foundMatches) { %>
    <p>Found <%= totalResults %> matching categories:</p>
    <% } else { %>
    <p>No matching categories found. Showing top categories instead:</p>
    <% } %>

    <ul>
        <% for (String category : searchResults) { %>
        <li><a href="notes.html?category=<%=category%>"><%=category%></a></li>
        <% } %>
    </ul>

    <% if (foundMatches && totalResults > 3) { %>
    <p><em>Showing top 3 results. <%= totalResults - 3 %> more results available.</em></p>
    <p><a href="allCategories.html">View all categories</a></p>
    <% } else { %>
    <p><a href="allCategories.html">View all categories</a></p>
    <% } %>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>