import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetProduct
 */
@WebServlet("/GetProduct")
public class GetProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    String asQuery(String name, String description) {
        String res = "WHERE ";
        if (name == null) {
            res += "description = '" + description + "'";
        }
        else if (description == null) {
            res += "name = '" + name + "'";
        }
        else {
            res += "name = '" + name + "' AND " + "description = '" + description + "'";
        }

        return res;
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        PrintWriter pw = response.getWriter();
        String name = request.getParameter("product_name");
        String description = request.getParameter("product_description");

        if (name == null && description == null) {
            response.sendError(400);
            return;
        }

        try {
            Connection con = DatabaseInitializer.connect();
            if (con == null) {
                response.sendError(500, "Error connecting to the database");
                return;
            }
            String sql = "SELECT * FROM products " + asQuery(name, description);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            String retJson = "[";
            int c = 0;
            while (rs.next()) {
            	if (c != 0) {
            		retJson += ",";
            	}
            	String rid = rs.getString(0);
            	String rname = rs.getString(1);
            	String rdesc = rs.getString(2);
            	int ramount = rs.getInt(3);
            	Double rprice = rs.getDouble(4);
            	retJson += "[\"" + rid + "\",\"" + rname + "\",\"";
            	retJson += rdesc + "\"," + ramount + "," + rprice + "]";
            }
            retJson += "]";
            response.setHeader("Content-Type", "application/json");
            pw.println(retJson);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
