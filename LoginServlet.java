package com.example.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Dummy validation for demonstration. Replace with actual validation logic.
        if("admin".equals(username) && "admin123".equals(password)) {
            response.sendRedirect("welcome.jsp?username=" + username); // Redirect to a welcome page on successful login
        } else {
            response.sendRedirect("login.jsp?error=Invalid Username or Password");
        }
    }
}
