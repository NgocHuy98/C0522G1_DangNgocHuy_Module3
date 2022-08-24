<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/24/2022
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="get" action="/calculator">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand:</td>
                <td><input name="firstOperand" placeholder="First number" type="text"/></td>
            </tr>
            <tr>
                <td>Operator:</td>
                <td>
                    <select name="operator">
                        <option value="+">Addition(+)</option>
                        <option value="-">Subtraction(-)</option>
                        <option value="*">Multiplication(x)</option>
                        <option value="/">Division(/)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input name="secondOperand" placeholder="Second number" type="text"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calculate"/></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
