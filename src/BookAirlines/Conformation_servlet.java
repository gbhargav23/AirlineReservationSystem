package BookAirlines;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Conformation_servlet
 */
@WebServlet("/Conformation_servlet")
public class Conformation_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Conformation_servlet() {
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
		String flight_id= request.getParameter("flight_id");
		String flight_class = request.getParameter("flight_class");
		int numberOfTickets= Integer.parseInt(request.getParameter("numberOfTickets"));
		int total_cost = Integer.parseInt(request.getParameter("total_cost"));
		//String account_name= request.getParameter("account_name");
		int account_number = Integer.parseInt(request.getParameter("account_number"));
		int booking_id=0;
		
		//PrintWriter out = response.getWriter();
		 response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
		 response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		  
		
		HttpSession session = request.getSession();
		session.setAttribute("flight_id", flight_id);
		session.setAttribute("numberOfTickets", numberOfTickets);
		session.setAttribute("total_cost", total_cost);
		//session.setAttribute("flight_id", flight_id);

	//	int user_id = 0;
		
   		int user_id = (int) session.getAttribute("user_id");
		System.out.println("Session elements"+(String)session.getAttribute("username"));
		
		Transactions trans = new Transactions();
		
		if(trans.AccountExists(account_number))	{
		int account_balance = trans.getaccount_Balance();
		Booking b = new Booking();
		
			
			if(account_balance > total_cost){
				try {
					booking_id = b.update_booking_flights(flight_id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					b.update_bookings(booking_id, flight_id, numberOfTickets, account_number, user_id, total_cost);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					int remainingBalance = (account_balance - total_cost);
					
					try {
						b.update_accounts(account_number,remainingBalance);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				//put a link to next page
					/*request.setAttribute("flight_class", flight_class);
					request.setAttribute("flight_id", flight_id);
					request.setAttribute("numberOfTickets", numberOfTickets);
					request.setAttribute("total_cost", total_cost);
					request.setAttribute("user_id", user_id);
					

					RequestDispatcher rd = getServletContext().getRequestDispatcher("/Transaction_success.jsp");  
					rd.forward(request, response); */
					//out.write("Transaction Successfull");
					response.getWriter().write("Transaction Successfull");
			}
			
			else{//insufficient funds to purchase tickets
				//response.sendRedirect("noFunds.jsp");
				//out.write("No Funds");
				response.getWriter().write("No Funds");

			}
			
		
		}
		else{ // account number doesn't exist
			//response.sendRedirect("noAccount.jsp");
			//out.write("No Account");
			response.getWriter().write("No Account");

		}
		
	}

}
