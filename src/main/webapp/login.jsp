<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Milk Tea Shop</title>
    <link rel="icon" href="./imgs/logo2.png" type="image/x-icon">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
    	<img src="./imgs/logo2.png" alt="Logo">
        <div class="title"><h3>Milky Tea Shop</h3></div>
        <h2>Login</h2>
        <% String error = request.getParameter("error"); %>
        <% String message = request.getParameter("message"); %>
        <% if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>
        <% if (message != null) { %>
            <div class="message"><%= message %></div>
        <% } %>
        <form action="Login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
        <a href="register.jsp" class="register-button">Register</a>
    </div>
</body>
</html>
