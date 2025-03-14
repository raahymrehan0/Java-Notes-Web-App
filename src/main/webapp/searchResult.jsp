<%@ page import="java.util.List" %>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="meta.jsp" />
    <title>Search Results</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
    <h2>Search Results for: "<%=request.getAttribute("searchTerm")%>"</h2>

    <%
        List<Note> searchResults = (List<Note>) request.getAttribute("searchResults");
        if (searchResults != null && !searchResults.isEmpty()) {
    %>
    <p>Showing top <%= Math.min(3, searchResults.size()) %> results:</p>
    <table>
        <thead>
        <tr>
            <th>Title</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Display only top 3 results
            int count = 0;
            for (Note note : searchResults) {
                if (count >= 3) break;
        %>
        <tr>
            <td><a href="viewNote.html?id=<%=note.getId()%>"><%=note.getTitle()%></a></td>
            <td>
                <a href="editNote.jsp?id=<%=note.getId()%>">Edit</a> |
                <a href="deleteNote.html?id=<%=note.getId()%>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <%
                count++;
            }
        %>
        </tbody>
    </table>

    <p><a href="search.jsp">New Search</a> | <a href="allNotes.html">View All Notes</a></p>
    <% } else { %>
    <p>No matching notes found.</p>
    <p><a href="search.jsp">Try another search</a> | <a href="allNotes.html">View All Notes</a></p>
    <% } %>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>