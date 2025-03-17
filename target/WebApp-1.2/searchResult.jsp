<%@ page import="java.util.List" %>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="meta.jsp" />
    <title>Title Search Results</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
    <h2>Title Search Results for: "<%=request.getAttribute("searchTerm")%>"</h2>

    <%
        List<Note> searchResults = (List<Note>) request.getAttribute("searchResults");
        Integer matchCount = (Integer) request.getAttribute("matchCount");
        Boolean foundMatches = (Boolean) request.getAttribute("foundMatches");
        Boolean hasResults = (Boolean) request.getAttribute("hasResults");
        int displayCount = Math.min(3, searchResults != null ? searchResults.size() : 0);
    %>

    <% if (foundMatches) { %>
    <p>Found <%= matchCount %> matching titles:</p>
    <% } else if (hasResults) { %>
    <p>No exact matches found. Showing top <%= displayCount %> results instead:</p>
    <% } else { %>
    <p>No matching notes found.</p>
    <% } %>

    <ul>
        <% if (searchResults != null && !searchResults.isEmpty()) { %>
        <% for (int i = 0; i < displayCount; i++) { %>
        <% Note note = searchResults.get(i); %>
        <li><a href="viewNote.html?id=<%=note.getId()%>"><%=note.getTitle()%></a></li>
        <% } %>
        <% } else { %>
        <li>No results found</li>
        <% } %>
    </ul>

    <% if (searchResults != null && searchResults.size() > 3) { %>
    <p><em>Showing top 3 results. <%= searchResults.size() - 3 %> more results available.</em></p>
    <% } %>
</main>
</body>
</html>