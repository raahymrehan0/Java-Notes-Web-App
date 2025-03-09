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
<jsp:include page="header.jsp" />
<main>
  <article>
    <h2>${note.label}</h2>
    <p>${note.content}</p>
    <!-- Include additional details as needed (e.g., URL, image if applicable) -->
  </article>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>
