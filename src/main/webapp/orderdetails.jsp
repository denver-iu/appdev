<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation - Milk Tea Shop</title>
    <link rel="icon" href="./imgs/logo2.png" type="image/x-icon">
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background-color: #fef3e6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('./imgs/bg.jpg');
            background-size: cover;
        }
        .confirmation {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 50px auto;
            text-align: left;
        }
        .confirmation h1 {
            color: #8b4513;
            margin-bottom: 20px;
        }
        .confirmation p {
            font-size: 16px;
            line-height: 1.5;
            color: #333;
        }
        .confirmation p strong {
            color: #8b4513;
        }
        .center {
  			display: block;
 			margin-left: auto;
 			margin-right: auto;
  			width: 50%;
		} 
		</style>
</head>
<body>
    <div class="confirmation">
        <img src="./imgs/logo2.png" alt="Logo" class="center" style="width: 100px; margin-bottom: 20px;">
        <h1>Order Confirmation</h1>
        <p><strong>Milk Tea Ordered:</strong> <%= request.getParameter("tea") %></p>
        <p><strong>Amount:</strong> 1</p>
        <p><strong>Addon:</strong> <%= request.getParameter("addons") %></p>
        <p><strong>Contact:</strong> <%= request.getParameter("contact") %></p>
        <p><strong>Date:</strong> <%= request.getParameter("date") %></p>
        <p><strong>Paid Amount:</strong> $<%= request.getParameter("amountPaid") %></p>
		<p><strong>Total:</strong> $<%= request.getParameter("totalPrice") %></p>
        <p><strong>Change:</strong> $<%= request.getParameter("change") %></p>
    </div>
</body>
</html>