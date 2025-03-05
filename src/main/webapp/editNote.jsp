<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Note</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<header>
  <h1>Edit Note</h1>
  <nav>
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="listNotes.jsp">All Notes</a></li>
    </ul>
  </nav>
</header>
<main>
  <form action="editNote" method="post">
    <input type="hidden" name="id" value="${note.id}">
    <label for="label">Label:</label>
    <input type="text" id="label" name="label" value="${note.label}" required>
    <br>
    <label for="content">Content:</label>
    <textarea id="content" name="content" required>${note.content}</textarea>
    <br>
    <button type="submit">Update Note</button>
  </form>
</main>
<footer>
  <p>&copy; 2025 My Note Application</p>
</footer>
</body>
</html>
