<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF">
  <title>Search Note Results</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <h2>Search Results</h2>
  <%
    java.util.List<uk.ac.ucl.model.Note> noteList = (java.util.List<uk.ac.ucl.model.Note>) request.getAttribute("searchResults");
    if (noteList != null && !noteList.isEmpty()) {
      for (uk.ac.ucl.model.Note note : noteList) {
        String noteLink = "viewNote.jsp?id=" + note.getId();
  %>
  <%
    }
  } else {
  %>
  <p>No matching notes found.</p>
  <%
    }
  %>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>