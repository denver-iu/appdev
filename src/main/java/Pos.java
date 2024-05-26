

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * Servlet implementation class Pos
 */
@WebServlet("/Pos")
public class Pos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	String getUserId(Connection con, String name) throws Exception {
		try {
			String sql = "SELECT uid FROM customers WHERE username = '" + name + "'";
		    ResultSet rs = con.createStatement().executeQuery(sql);
		    if (rs.next()) {
		        String uid = rs.getString("uid");
		        return uid;
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		return null;
	}
	
	String asInsertValue(String productId, String userId, String addons, int sugarContent, String contact, String datetime, Double paid) {
	    return "('" + productId + "','" + userId + "','" + addons + "'," + sugarContent + ",'" + contact + "','" + datetime + "'," + paid + ")";
	}
	
	ResultSet getProductInfo(Connection con, String id) throws Exception {
		ResultSet rs = con.createStatement().executeQuery("SELECT uid, name, type, price FROM products WHERE uid = '" + id + "';");
		return rs;
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String contact = request.getParameter("contact_number");
		
		String prodId = request.getParameter("tea_base");
		String ssugar = request.getParameter("sugar_level");
		int sugar = Integer.parseInt(ssugar);
		String samountPaid = request.getParameter("amount_paid");
		Double amountPaid = Double.parseDouble(samountPaid);
		
		String[] toppings = request.getParameterValues("toppings");
		String addons = "";
		for (String i : toppings) {
			addons += i + ",";
		}
		
		try {
			Double totalPrice = 0.0;
			Connection con = DatabaseInitializer.connect();
			if (con == null) {
				response.sendError(500, "Error connecting to the database");
				return;
			}
			
			for (String addon: toppings) {
				ResultSet rs = getProductInfo(con, addon);
				if (rs.next()) {
					totalPrice += rs.getDouble("price");
				}
			}
			System.out.println("addon");
			ResultSet rs = getProductInfo(con, prodId);
			String teaName = "";
			if (rs.next()) {
				teaName += rs.getString("name");
				totalPrice += rs.getDouble("price");
			}
			System.out.println("tea");
			Double change =  amountPaid - totalPrice;
			if (change <= -1.0) {
				response.sendRedirect("welcome.jsp?username="+username);
				return;
			}
			
			String userUID = getUserId(con, username);
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	        String transactionDate = timestamp.toString();
	        
			Statement stmt = con.createStatement();
			String sql = "INSERT INTO sales (productId, customerId, addOns, sugarContent, contactNumber, transactionDate, amountPaid) VALUES"
					+ asInsertValue(prodId, userUID, addons, sugar, contact, transactionDate, amountPaid) + ";";
			stmt.executeUpdate(sql);
			con.close();
			
			
			String rdr = "orderdetails.jsp?username=" + username + "&contact=" + contact + "&amountPaid=" + amountPaid
						+ "&totalPrice=" + totalPrice + "&addons=" + addons + "&tea=" + teaName + "&change=" + change
						+ "&date=" + transactionDate;
			
			response.sendRedirect(rdr);
			return;
		}
		catch (Exception e) {
			System.out.println(e);
		}
		response.sendRedirect("welcome.jsp?username="+username);
		
	}

}
