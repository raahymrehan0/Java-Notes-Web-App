<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="uk.ac.ucl.model.Model" %>
<%@ page import="uk.ac.ucl.model.ModelFactory" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/meta.jsp"/>
  <title>Edit Note</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <section>
    <h1>Edit Note</h1>
    <%
      String noteId = request.getParameter("id");
      Note note = null;
      if (noteId != null && !noteId.isEmpty()) {
        Model model = ModelFactory.getModel();
        note = model.getNoteById(Integer.parseInt(noteId));
      }

      if (note != null) {
    %>
    <form action="editNote.html" method="post">
      <input type="hidden" name="id" value="<%=note.getId()%>">
      <div>
        <label for="noteCategory">Category:</label>
        <input type="text" id="noteCategory" name="noteCategory" required>
      </div>
      <div>
        <label for="noteTitle">Title:</label>
        <input type="text" id="noteTitle" name="noteTitle" value="<%=note.getTitle()%>" required>
      </div>
      <div>
        <label for="noteContent">Content:</label>
        <input type="text" id="noteContent" name="noteContent" value="<%=note.getContent()%>">
      </div>
      <div>
        <label for="noteURL">URL:</label>
        <input type="text" id="noteURL" name="noteURL" value="<%=note.getURL()%>">
      </div>
      <div>
        <label for="noteImage">Image:</label>
        <input type="text" id="noteImage" name="noteImage" value="<%=note.getImageURL()%>">
      </div>
      <div>
        <button type="submit">Update Note</button>
      </div>
    </form>
    <% } else { %>
    <p>Note not found. <a href="allNotes.html">Back to All Notes</a></p>
    <% } %>
  </section>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>