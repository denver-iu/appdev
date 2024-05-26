import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
			Connection con = DatabaseInitializer.connect();
			if (con == null) {
				response.sendError(500, "Error connecting to the database");
				return;
			}
			
			Statement stmt = con.createStatement();
			String sql = "SELECT username, password FROM customers WHERE "
					+ "username = '" + username + "' AND password = '" + password + "';";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				response.sendRedirect("welcome.jsp?username=" + username);
			}
			else {
				response.sendRedirect("login.jsp?error=Invalid Username or Password");
			}
			con.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
    }
}