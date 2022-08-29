<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/28/2022
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${mess!=null}">
    <span style="color: darkblue">${mess}</span>
</c:if>
<a href="/users">Back to list</a>
<form action="/users?action=create" method="post">
    <pre>Name:             <input type="text" name="name"></pre>
    <pre>Email:            <input type="text" name="email"></pre>
    <pre>Country:          <input type="text" name="country"></pre>
    <pre>                  <button style="background-color: #67dc6a">Save</button></pre>
</form>
</body>
</html>
