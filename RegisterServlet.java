package com.example.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Dummy validation for demonstration. Add proper validation and storage logic here.
        if (username != null && !username.isEmpty() && password != null && !password.isEmpty() && email != null && !email.isEmpty()) {
            // Simulate saving the user information to a database
            // In a real application, you would save the user data to a database here

            // Redirect to login page with a success message
            response.sendRedirect("login.jsp?message=Registration Successful, Please Login");
        } else {
            // Redirect back to the registration page with an error message
            response.sendRedirect("register.jsp?error=Please fill in all fields");
        }
    }
}
