<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="meta.jsp" />
  <title>Note Application - Home</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <meta charset="UTF-8">
  <title>View Note</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<header>
  <h1>View Note</h1>
  <nav>
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="listNotes.jsp">All Notes</a></li>
      <li><a href="editNote.jsp?id=${note.id}">Edit Note</a></li>
    </ul>
  </nav>
</header>
<main>
  <article>
    <h2>${note.label}</h2>
    <p>${note.content}</p>
    <!-- Include additional details as needed (e.g., URL, image if applicable) -->
  </article>
</main>
<footer>
  <p>&copy; 2025 My Note Application</p>
</footer>
</body>
</html>
