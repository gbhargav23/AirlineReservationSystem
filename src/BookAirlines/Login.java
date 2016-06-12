package BookAirlines;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String password = request.getParameter("pwd");
		String remember_me = request.getParameter("rememberMe");
		
		System.out.println("Remember me Value is : "+remember_me);
		

//		// Session
		HttpSession session = request.getSession(true);
     	session.setAttribute("username", username);
     	session.setMaxInactiveInterval(15*60);
     	System.out.println(session.getAttribute("username")+ " in login page" );
 
		// Handling bad form data in order to avoid Null Pointer Exception
		if (remember_me == null) {
			remember_me = "off";
		}


		// Creating an instance of the user class with project's root path as
		// the parameter to the constructor
		Users newUser = new Users(this.getServletContext().getRealPath("/"));

		System.out.println("Checking the user : ");
		try {
			if (!newUser.checkUserName(username)) {
				response.sendRedirect("Registration.jsp");
			} else {// Setting cookie
				if (remember_me.equals("on")) {
					System.out.println("Setting the cookie");
					Cookie c = new Cookie("username", username);
					// Setting cookie's age to one day - 24 hours
					c.setMaxAge(24 * 60 * 60);
					response.addCookie(c);
				}
				if (newUser.checkPwd(username, password)) {
					// attaching user_id as Session variable
					//retreiving user_id
					
					int user_id= newUser.UserID(username);
					
					// Session
			//		HttpSession session = request.getSession();
					session.setAttribute("user_id", user_id);
					System.out.println("User Id is : "+session.getAttribute("user_id"));
					
					Organization org=new Organization();
					OrgBean ob = org.getOrganization(username);
					session.setAttribute("org", ob);
					
					
					RequestDispatcher rd = request
							.getRequestDispatcher("FlightSearch.jsp");
					rd.include(request, response);
					
				//	response.sendRedirect("FlightSearch.jsp");
				} else { // Incorrect password, so send an error message
					request.setAttribute("password_error",
							"Incorrect password! Try again.");
	//				RequestDispatcher rd = request
	//						.getRequestDispatcher("Login.jsp");
	//				rd.include(request, response);
					response.sendRedirect("Registration.jsp");
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
