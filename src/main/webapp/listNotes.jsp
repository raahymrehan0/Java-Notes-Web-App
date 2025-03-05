<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="meta.jsp" />
  <title>Note Application - Home</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <meta charset="UTF-8">
  <title>All Notes</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <table>
    <thead>
    <tr>
      <th>Label</th>
      <th>Date Created</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="note" items="${notes}">
      <tr>
        <td><a href="viewNote.jsp?id=${note.id}">${note.label}</a></td>
        <td>${note.creationDate}</td>
        <td>
          <a href="editNote.jsp?id=${note.id}">Edit</a> |
          <a href="deleteNote?id=${note.id}" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>
