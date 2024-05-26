<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./imgs/logo2.png" type="image/x-icon">
<link rel="stylesheet" href="style.css">
<title>Add Product</title>
</head>
<body>
<div class="container">
<form action="AddProduct" method="get">
    <h2>Add Product</h2>
    <label for="product_code">ADMIN USERNAME:</label>
	<input type="text" name="admin_username" required><br>
    <label for="product_code">ADMIN PASSWORD:</label>
	<input type="text" name="admin_password" required><br>

    <hr size="2px" color="#d3a625">

    <label for="product_code">Code:</label>
	<input type="text" name="product_code" required><br>
    <label for="product_code">Name:</label>
	<input type="text" name="product_name" required><br>
    <label for="product_code">Desc:</label>
	<input type="text" name="product_desc" required><br>

    <div class="container-flex">
        <div>
            <label for="product_code">Amount:</label>
            <input type="number" name="product_amount" required>
        </div>
        <div>
            <label for="product_code">Price:</label>
            <input type="number" step="0.5" name="product_price" required>
        </div>
    </div>

	<input type="Submit" value="Add">
	<input type="Reset">
</form>
</div>
</body>
</html>
