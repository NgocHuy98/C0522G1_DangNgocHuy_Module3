<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/25/2022
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete product</title>
</head>
<body>
<h3>Delete</h3>
<p>
    <a href="/products">Back to List</a>
</p>
<form method="post">
    <p>Are you sure ?</p>
    <fieldset>
        <table>
            <tr>
                <td>Id: </td>
                <td>${product.getId()}</td>
            </tr>
            <tr>
                <td>Name: </td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td>Price: </td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td>Description: </td>
                <td>${product.getDescription()}</td>
            </tr>
            <tr>
                <td>Date Of Manufacture: </td>
                <td>${product.getDateOfManufacture()}</td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${product.getAddress()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="delete"></td>
                <td><a href="/products">Back to List</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
