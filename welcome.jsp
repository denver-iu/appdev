<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome - Milky Tea Shop</title>
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
    </style>
</head>
<body>
    <div class="container">
    	<img src="logo2.png" alt="Logo">
        <div class="title"><h3>Milky Tea Shop</h3></div>
        <h2>Welcome, <%= request.getParameter("username") %>!</h2>
        <p>You have successfully logged in to the Milk Tea Shop.</p>
    </div>
</body>
</html>
