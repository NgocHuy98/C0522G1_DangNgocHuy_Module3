<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/28/2022
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <a href="/users">Back to user List</a>
</p>
<fieldset>
    <legend><h3>Information User</h3></legend>
    <table>
        <tr>
            <td>Name:</td>
            <td><input value="${user.name}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" value="${user.email}"></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td><input value="${user.country}"></td>
        </tr>
    </table>
</fieldset>
</body>
</html>
