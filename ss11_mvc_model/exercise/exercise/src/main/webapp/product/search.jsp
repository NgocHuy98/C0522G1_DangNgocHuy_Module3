<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/27/2022
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search</title>

</head>
<body>

<h1>Products</h1>
<a href="/products">Back to List</a>
<table >
    <tr>
        <td>Product Name</td>
        <td>Price</td>
        <td>Description</td>
        <th>Date Of Manufacture</th>
        <th>Address</th>
        <td>Producer</td>
        <td>Edit</td>
        <td>Delete</td>
        <td>View</td>
    </tr>
    <c:forEach items='${productList}' var="product">
        <tr>
            <td>${product.getProductName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getDateOfManufacture()}</td>
            <td>${product.getAddress()}</td>
            <td><a href="/product?action=update&id=${product.getId()} "  role="button">Edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}"  role="button">Delete</a></td>
            <td><a href="/product?action=view&id=${product.getId()}"  role="button">View</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
