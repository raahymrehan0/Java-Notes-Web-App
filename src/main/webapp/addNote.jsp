<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add Note</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<header>
  <h1>Add Note</h1>
  <nav>
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="listNotes.jsp">All Notes</a></li>
    </ul>
  </nav>
</header>
<main>
  <section>
    <form action="addNote" method="post">
      <div>
        <label for="noteLabel">Label:</label>
        <input type="text" id="noteLabel" name="label" required>
      </div>
      <div>
        <label for="noteContent">Content:</label>
        <textarea id="noteContent" name="content" required></textarea>
      </div>
      <div>
        <button type="submit">Add Note</button>
      </div>
    </form>
  </section>
</main>
<footer>
  <p>&copy; 2025 My Note Application</p>
</footer>
</body>
</html>