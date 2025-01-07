<%--
  Created by IntelliJ IDEA.
  User: manh
  Date: 1/7/2025
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm mới sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group .required {
            color: red;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Thêm mới sản phẩm</h2>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <form action="${pageContext.request.contextPath}/products" method="post">
        <div class="form-group">
            <label for="name">Name: <span class="required">*</span></label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="price">Price: <span class="required">*</span></label>
            <input type="number" id="price" name="price" min="101" required>
        </div>
        <div class="form-group">
            <label for="discount">Discount: <span class="required">*</span></label>
            <select id="discount" name="discount" required>
                <option value="5%">5%</option>
                <option value="10%">10%</option>
                <option value="15%">15%</option>
                <option value="20%">20%</option>
            </select>
        </div>
        <div class="form-group">
            <label for="stock">Stock: <span class="required">*</span></label>
            <input type="number" id="stock" name="stock" min="11" required>
        </div>
        <button type="submit">Thêm</button>
    </form>
</div>
</body>
</html>







