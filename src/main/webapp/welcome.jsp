<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome - Milky Tea Shop</title>
    <link rel="icon" href="./imgs/logo2.png" type="image/x-icon">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
    	<img src="./imgs/logo2.png" alt="Logo">
        <div class="title"><h3>Milky Tea Shop</h3></div>
        <% String username = request.getParameter("username"); %>
        <% if (username == null) { %>
        <% 		response.sendRedirect("login.jsp"); %>
        <% } %>
        <h2>Welcome, <%= username %>!</h2>
        <p>You have successfully logged in to the Milk Tea Shop.</p>
        <a class="order-button" href=<%= "order.jsp?username=" + username %>>ORDER NOW</a>
    </div>
</body>
</html>
