<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="/meta.jsp"/>
  <title>Add Note</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <section>
    <form action="add-note.html" method="post">
      <div>
        <label for="noteTitle">Title:</label>
        <input type="text" id="noteTitle" name="noteTitle" required>
      </div>
      <div>
        <label for="noteContent">Content:</label>
        <input type="text" id = "noteContent" name="noteContent" required>
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