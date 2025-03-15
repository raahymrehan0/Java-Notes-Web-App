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
    <form action="editNote.html" method="post">
      <input type="hidden" name="id">
      <div>
        <label for="noteTitle">Title:</label>
        <input type="text" id="noteTitle" name="noteTitle" required>
      </div>
      <div>
        <label for="noteContent">Content:</label>
        <input type="text" id="noteContent" name="noteContent" required>
      </div>
      <div>
        <label for="noteURL">URL:</label>
        <input type="text" id="noteURL" name="noteURL">
      </div>
      <div>
        <label for="noteImage">Image:</label>
        <input type="text" id="noteImage" name="noteImage">
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