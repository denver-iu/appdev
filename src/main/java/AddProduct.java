import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    String asInsertValue(String uid, String name, String description, int amount, Double price) {
        return "('" + uid + "', " + "'" + name + "', " + "'" + description + "', "
                + amount + ", " + price + ")";
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		pw.append("Served at: ").append(request.getContextPath());

		String id = request.getParameter("product_uid");
		String name = request.getParameter("product_name");
		String description = request.getParameter("product_description");
		String samount = request.getParameter("product_amount");
		int amount = 0;
		try {
			amount = Integer.parseInt(samount);
		}
		catch (Exception e) {
			response.sendError(400, "Input Error" + e);
			return;
		}
		String sprice = request.getParameter("product_price");
		Double price = 0.0;
		try {
			price = Double.parseDouble(sprice);
		}
		catch (Exception e) {
			response.sendError(400, "Input Error" + e);
			return;
		}
		
		String sql;
		try {
			Connection con = DatabaseInitializer.connect();
			if (con == null) {
				response.sendError(500, "Error connecting to the database");
				return;
			}
			
			Statement stmt = con.createStatement();
			sql = "INSERT INTO products (uid, name, description, amount, price) VALUES"
					+ asInsertValue(id, name, description, amount, price) + ";";
			stmt.executeUpdate(sql);
			con.close();
			
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

}
