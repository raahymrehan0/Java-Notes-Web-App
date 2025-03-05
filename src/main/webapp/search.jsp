<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="meta.jsp" />
  <title>Note Application - Home</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <meta charset="UTF-8">
  <title>Search Notes</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<header>
  <h1>Search Notes</h1>
  <nav>
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="listNotes.jsp">All Notes</a></li>
    </ul>
  </nav>
</header>
<main>
  <form action="searchNote" method="get">
    <label for="query">Search:</label>
    <input type="text" id="query" name="query" placeholder="Enter search term...">
    <button type="submit">Search</button>
  </form>
  <div>
    <c:if test="${not empty searchResults}">
      <h2>Results:</h2>
      <ul>
        <c:forEach var="note" items="${searchResults}">
          <li><a href="viewNote.jsp?id=${note.id}">${note.label}</a></li>
        </c:forEach>
      </ul>
    </c:if>
  </div>
</main>
<footer>
  <p>&copy; 2025 My Note Application</p>
</footer>
</body>
</html>
