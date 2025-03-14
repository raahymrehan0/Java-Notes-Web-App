<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="meta.jsp" />
  <title>View Note</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <%
    Note note = (Note) request.getAttribute("note");
    if (note != null)
    {
  %>
  <article>
    <h2><%=note.getTitle()%></h2>
    <p><%=note.getContent()%></p>
    <p><a href="<%=note.getURL()%>">
      <img src="<%=note.getImageURL()%>" alt="<%=note.getTitle()%>">

    <div class="actions">
      <a href="editNote.html?id=<%=note.getId()%>">Edit</a> |
      <a href="deleteNote.html?id=<%=note.getId()%>" onclick="return confirm('Are you sure?')">Delete</a> |
      <a href="allNotes.html">Back to All Notes</a>
    </div>
  </article>
  <%
  }
    else
  {
  %>
  <p>Note not found</p>
  <p><a href="allNotes.html">Back to All Notes</a></p>
  <% } %>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>