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
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm mới sản phẩm</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 500px;
            max-width: 90%;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }
        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group select {
            width: calc(100% - 16px);
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        .form-group input[type="text"]:focus,
        .form-group input[type="number"]:focus,
        .form-group select:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
        }
        .form-group select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg fill="black" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>');
            background-repeat: no-repeat;
            background-position-x: calc(100% - 10px);
            background-position-y: 50%;
        }
        .form-group .required {
            color: #e74c3c;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        button:hover {
            background-color: #45a049;
        }
        .error {
            color: #e74c3c;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
        }
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            .form-group input[type="text"],
            .form-group input[type="number"],
            .form-group select,
            button {
                font-size: 1rem;
            }
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
            <label for="name">Tên sản phẩm <span class="required">*</span></label>
            <input type="text" id="name" name="name" placeholder="Nhập tên sản phẩm" required>
        </div>
        <div class="form-group">
            <label for="price">Giá <span class="required">*</span></label>
            <input type="number" id="price" name="price" min="101" placeholder="Nhập giá (tối thiểu 101)" required>
        </div>
        <div class="form-group">
            <label for="discount">Giảm giá <span class="required">*</span></label>
            <select id="discount" name="discount" required>
                <option value="5%">5%</option>
                <option value="10%">10%</option>
                <option value="15%">15%</option>
                <option value="20%">20%</option>
            </select>
        </div>
        <div class="form-group">
            <label for="stock">Số lượng kho <span class="required">*</span></label>
            <input type="number" id="stock" name="stock" min="11" placeholder="Nhập số lượng (tối thiểu 11)" required>
        </div>
        <button type="submit">Thêm sản phẩm</button>
    </form>
</div>
</body>
</html>