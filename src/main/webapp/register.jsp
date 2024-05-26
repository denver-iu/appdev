<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Milk Tea Shop</title>
    <link rel="icon" href="./imgs/logo2.png" type="image/x-icon">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
    	<img src="./imgs/logo2.png" alt="Logo">
        <div class="title"><h3>Milky Tea Shop</h3></div>
        <h2>Register</h2>
        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>
        <form action="Register" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Register">
        </form>
        <a href="login.jsp" class="back-button">Back to Login</a>
    </div>
</body>
</html>
