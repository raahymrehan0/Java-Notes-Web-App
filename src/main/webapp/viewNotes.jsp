<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="meta.jsp" />
  <title>Notes</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <%
    List<Note> notes = (List<Note>) request.getAttribute("notes");
    if (notes != null && !notes.isEmpty()) {
  %>
  <h1>Notes</h1>
  <div class="notes-grid">
    <% for (Note note : notes) { %>
    <div class="note-card">
      <h2>Title: <%=note.getTitle()%></h2>
      <p>Content: <%=note.getContent()%></p>
      <% if (note.getURL() != null && !note.getURL().isEmpty()) { %>
      <p>URL: <a href="<%=note.getURL()%>" target="_blank"><%=note.getURL()%></a></p>
      <% } %>
      <% if (note.getImageURL() != null && !note.getImageURL().isEmpty()) { %>
        <p>Image: </p>
      <img src="<%=note.getImageURL()%>" alt="<%=note.getTitle()%>">
      <% } %>
      <div class="actions">
        <a href="viewNote.html?id=<%=note.getId()%>">View</a> |
        <a href="editNote.jsp?id=<%=note.getId()%>">Edit</a> |
        <a href="deleteNote.html?id=<%=note.getId()%>" onclick="return confirm('Are you sure?')">Delete</a>
      </div>
    </div>
    <% } %>
  </div>
  <% } else { %>
  <h1>No Notes Found</h1>
  <p>There are no notes to display</p>
  <% } %>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>