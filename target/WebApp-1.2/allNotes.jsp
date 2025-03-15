<%@ page import="java.util.List" %>
<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="meta.jsp" />
  <title>All Notes</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <table>
    <thead>
    <tr>
      <th>Title</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Note> notes = (List<Note>) request.getAttribute("notes");
      if (notes != null && !notes.isEmpty())
      {
        for (Note note : notes)
        {
    %>
    <tr>
      <td><a href="viewNote.html?id=<%=note.getId()%>"><%=note.getTitle()%></a></td>
      <td>
        <a href="editNote.jsp?id=<%=note.getId()%>">Edit</a> |
        <a href="deleteNote.html?id=<%=note.getId()%>" onclick="return confirm('Are you sure?')">Delete</a>
      </td>
    </tr>
    <%
      }
    } else
    {
    %>
    <tr><td colspan="2">No Notes found</td></tr>
    <% } %>
    </tbody>
  </table>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>