<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="meta.jsp" />
  <title>All Notes</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="header.jsp" />
<main>
  <table>
    <thead>
    <tr>
      <th>Categories</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<String> categories = (List<String>) request.getAttribute("categories");
      if (categories != null && !categories.isEmpty())
      {
        for (String category : categories)
        {
    %>
    <tr>
      <td><a href="notes.html?category=<%=category%>"><%=category%></a></td>
    </tr>
    <%
      }
    } else
    {
    %>
    <tr><td colspan="2">No Notes found</td></tr>
    <% } %>
    </tbody>
  </table>
</main>
</body>
</html>