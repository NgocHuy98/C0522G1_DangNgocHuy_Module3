<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/28/2022
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            margin: 10px 30px;
        }
        a {
            text-decoration: none;
        }
        a:hover {
            color: green;
        }
    </style>
</head>
<body class="text-center">
<h1>List User</h1>
<form action="/users" class="my-3">
    <input type="text" name="nameSearch" placeholder="Search name ...">
    <button type="submit" name="action" value="search" class="btn btn-secondary btn-sm">Search</button>

    <a href="/users?action=sort">
        <button class="btn btn-sm btn-danger btn-sm">Sort By Name</button>
    </a>
</form>
<a href="/users?action=create">Create new user</a>
<table class="table table-striped ">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Country</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${listUser}" var="user">
        <tr>
            <td><a href="/users?action=view&id=${user.getId()}">${user.name}</a></td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/users?action=edit&id=${user.id}">
                <button class="btn btn-primary btn-sm">Edit</button>
            </a></td>
            <td><a href="/users?action=delete&id=${user.id}">
                <button class="btn btn-danger btn-sm">Delete</button>
            </a></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
