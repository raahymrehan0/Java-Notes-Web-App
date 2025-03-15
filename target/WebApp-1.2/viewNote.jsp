<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page contentType="text/html;charset=UTF-8"%>
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
    <h2>Category: <%=note.getCategory()%></h2>
    <h2>Title: <%=note.getTitle()%></h2>
    <p>Content: <%=note.getContent()%></p>
    <p>URL: <%=note.getURL()%></p>
    <p>Image: </p>
    <p>
      <img src="<%=note.getImageURL()%>" alt="<%=note.getTitle()%>">
    </p>
    <div class="actions">
      <a href="editNote.jsp?id=<%=note.getId()%>">Edit</a> |
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