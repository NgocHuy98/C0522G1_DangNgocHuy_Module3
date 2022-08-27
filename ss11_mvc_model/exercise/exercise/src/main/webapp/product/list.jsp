<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/25/2022
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>
        h1 {
            text-align: center;
        }
        a {
            color: black;
        }
    </style>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<form class="d-flex justify-content-end" action="/product?action=search">
    <input type="text" name="nameSearch" placeholder="Search..." style="margin-right: 20px">
    <input type="submit" name="action" value="search" style="margin-right: 20px">
</form>
<table class="table table-striped">
    <tr>
       <th>Name</th>
       <th>Price</th>
       <th>Description</th>
       <th>Date Of Manufacture</th>
       <th>Address</th>
       <th>Edit</th>
       <th>Delete</th>
       <th>view</th>
    </tr>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getDateOfManufacture()}</td>
            <td>${product.getAddress()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
