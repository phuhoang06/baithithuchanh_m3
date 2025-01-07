<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #3498db;
        }
        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        button, .submit-button {
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }
        button:hover, .submit-button:hover {
            background-color: #2980b9;
        }
        .form-group {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .form-group select, .form-group input[type="date"] {
            width: calc(100% - 12px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .actions {
                flex-direction: column;
                align-items: stretch;
            }
            .actions button {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<div class="actions">
    <button onclick="location.href='/views/addProduct.jsp'">Thêm mới sản phẩm</button>
</div>

<div class="form-group">
    <form action="${pageContext.request.contextPath}/products" method="get">
        <label for="top">Xem top sản phẩm bán chạy nhất:</label>
        <select id="top" name="top">
            <option value="3">Top 3</option>
            <option value="5">Top 5</option>
            <option value="10">Top 10</option>
        </select>
        <button type="submit" name="action" value="topProducts" class="submit-button">Xem</button>
    </form>
</div>

<div class="form-group">
    <form action="filterProducts" method="get">
        <label>Lọc sản phẩm theo ngày đặt hàng:</label>
        <div>
            <label for="startDate">Từ ngày:</label>
            <input type="date" id="startDate" name="startDate">
        </div>
        <div>
            <label for="endDate">Đến ngày:</label>
            <input type="date" id="endDate" name="endDate">
        </div>
        <button type="submit" class="submit-button">Xem sản phẩm</button>
    </form>
</div>

<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Giảm giá</th>
        <th>Tồn kho</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.productId}</td>
            <td>${product.productName}</td>
            <td>${product.price}</td>
            <td>${product.discount}</td>
            <td>${product.stock}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>