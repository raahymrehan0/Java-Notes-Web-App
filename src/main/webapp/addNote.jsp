<%@ page import="java.util.List" %>
<%@ page import="uk.ac.ucl.model.Model" %>
<%@ page import="uk.ac.ucl.model.ModelFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/meta.jsp"/>
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
    <form action="add-note.html" method="post">
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
<jsp:include page="footer.jsp" />
</body>
</html>