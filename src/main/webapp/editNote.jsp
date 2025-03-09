<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Note</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <section>
    <h1>Edit Note</h1>
    <form action="edit-note.html" method="post">
      <input type="hidden" name="id" value="${note.id}">
      <div>
        <label for="noteLabel">Label:</label>
        <input type="text" id="noteLabel" name="label" value="${note.label}" required>
      </div>
      <div>
        <label for="noteContent">Content:</label>
        <textarea id="noteContent" name="content" required>${note.content}</textarea>
      </div>
      <div>
        <button type="submit">Update Note</button>
      </div>
    </form>
  </section>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>