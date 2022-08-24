<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/24/2022
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>
        img {
            height: 100px;
            width: 100px;
        }

        .table {
            text-align: center;
        }
    </style>
</head>
<body>
<table class="table">
    <tr>
        <th>No.</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Address</th>
        <th>Photo</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
            <td>${customer.getId()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getDayOfBirth()}</td>
            <td>${customer.getAddress()}</td>
            <td><img src=${customer.getPhoto()}></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
