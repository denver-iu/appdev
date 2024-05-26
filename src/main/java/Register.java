

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Random;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	String genUID() {
		String chars = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
		String ret = "";
		Random rnd = new Random();
		for (int i=0;i<20;i++) {
			ret += chars.charAt(rnd.nextInt(chars.length()));
		}
		return ret;
	}
	
	boolean isUserExist(Connection con, String username) throws Exception {
		String sql = "SELECT username FROM customers WHERE username = '" + username + "';";
		ResultSet rs = con.createStatement().executeQuery(sql);
		return rs.next();
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username == null || password == null) {
			response.sendRedirect("register.jsp?error=Username or Password cannot be empty");
			return;
		}
		try {
			Connection con = DatabaseInitializer.connect();
			String uid = genUID();
			
			if (isUserExist(con, username)) {
				response.sendRedirect("register.jsp?error=User already exists with username");
				return;
			}
			
			String sql = "INSERT INTO customers (uid, username, password) VALUES "
					+ "('" + uid + "','" + username + "','" + password + "');";
			Statement st = con.createStatement();
			st.execute(sql);
			
			response.sendRedirect("login.jsp");
			con.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}
