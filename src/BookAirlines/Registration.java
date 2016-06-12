package BookAirlines;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username =  request.getParameter("username");
		String password = request.getParameter("pass1");
		
		String orgname = request.getParameter("orgName");
		String orgaddress = request.getParameter("orgAddr");
		
		if(orgname == null || orgname == ""){
			orgname = "UNL";
			}
		if(orgaddress == null || orgaddress == ""){
			orgaddress = "LINCOLN";
			}
		
		System.out.println("orgname : "+orgname + " Orgaddr : "+orgaddress);
				
	    
	    Connection con = null;
	    int rowsInserted = -1;
	    try{
	    	
	    	con = DataBase.getConnection();
	    	String query = "INSERT INTO Users (username, password,organizationName,organizationAddress) VALUES (?,?,?,?)";
	    	PreparedStatement preparedStmt = con.prepareStatement(query);
	    	preparedStmt.setString(1, username);
	    	preparedStmt.setString(2, password);
	    	preparedStmt.setString(3, orgname);
	    	preparedStmt.setString(4, orgaddress);
	    	rowsInserted = preparedStmt.executeUpdate();
	    	con.close();
	    	
	    }catch(MySQLIntegrityConstraintViolationException e){
	    	
	    	System.out.println("User already exists");
	    }catch(Exception e){
	    	System.out.println(e);
	    }

		if (rowsInserted > 0) {
		    System.out.println("A new user was inserted successfully!");
	//	    Organization org=new Organization();
	//	    org.setOrganization(username,orgname,orgaddress);
		}
	
		
		System.out.println("New property Set " +username+ " And password as " +password );
		
		response.sendRedirect("Login.jsp");
		
	}

}
