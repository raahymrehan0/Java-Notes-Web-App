<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="meta.jsp" />
  <title>Search Notes</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <h2>Search Notes</h2>
  <form action="searchResult.html" method="post">
    <label for="searchstring">Search by title or content:</label>
    <input type="text" id="searchstring" name="searchstring" placeholder="Enter search term..." required>
    <button type="submit">Search</button>
  </form>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>