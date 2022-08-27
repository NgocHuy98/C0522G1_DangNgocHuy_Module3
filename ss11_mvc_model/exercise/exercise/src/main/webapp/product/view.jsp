<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/25/2022
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Products List</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td>Id: </td>
        <td><input type="number" name="id" id="id" value="${product.getId()}"></td>
    </tr>
    <tr>
        <td>Name: </td>
        <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
    </tr>
    <tr>
        <td>Price: </td>
        <td><input type="number" name="price" id="price" value="${product.getPrice()}"></td>
    </tr>
    <tr>
        <td>Description: </td>
        <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
    </tr>
    <tr>
        <td>Date Of Manufacture: </td>
        <td><input type="text" name="dateOfManufacture" id="dateOfManufacture" value="${product.getDateOfManufacture()}"></td>
    </tr>
    <tr>
        <td>Address: </td>
      <td><input type="text" name="address" id="address" value="${product.getAddress()}"></td>
    </tr>
</table>
</body>
</html>
