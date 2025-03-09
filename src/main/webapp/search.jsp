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
<jsp:include page="header.jsp" />
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
<jsp:include page="footer.jsp" />
</body>
</html>
