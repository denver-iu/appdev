<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Milk Tea Shop</title>
    <link rel="icon" href="logo2.png" type="image/x-icon">
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background-color: #fef3e6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('bg.jpg');
            background-size: cover;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
            color: #8b4513;
        }
        .container img {
            width: 200px; 
            margin-bottom: 20px;
        }
        .container label {
            display: block;
            margin: 10px 0 5px;
            text-align: left;
        }
        .container input[type="text"],
        .container input[type="password"],
        .container input[type="email"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #d3a625;
            border-radius: 5px;
        }
        .container input[type="submit"] {
            background-color: #d3a625;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .container input[type="submit"]:hover {
            background-color: #b28b0b;
        }
        .container .back-button {
            background-color: #fff;
            color: #d3a625;
            padding: 5px;
            border: 2px solid #d3a625;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
            text-decoration: none;
            display: inline-block;
            float: right;
        }
        .container .back-button:hover {
            background-color: #d3a625;
            color: #fff;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
        .message {
            color: green;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
    	<img src="logo2.png" alt="Logo">
        <div class="title"><h3>Milky Tea Shop</h3></div>
        <h2>Register</h2>
        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>
        <form action="RegisterServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <input type="submit" value="Register">
        </form>
        <a href="login.jsp" class="back-button">Back to Login</a>
    </div>
</body>
</html>
