<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/23/2022
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
  </head>
  <body>
  <form method="post" action="/product">
    <label>Product Description: </label><br/>
    <input type="text" name="product" placeholder="PRODUCT" /><br/>
    <label>List Price: </label><br/>
    <input type="text" name="price" placeholder="PRICE" value="0"/><br/>
    <label>Discount Percent(%)</label><br>
    <input type = "text" name = "percent" placeholder="PERCENT" value = "0"/>
    <input type = "submit" id = "submit" value = "Calculate"/>
  </form>
  </body>
</html>
