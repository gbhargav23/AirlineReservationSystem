package BookAirlines;





import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookingHistoryServlet
 */
@WebServlet("/BookingHistoryServlet")
public class BookingHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	

		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("user_id");
		
		System.out.println("the user name is " + userId);
		
		
		Booking b = new Booking();
		
		System.out.println("before null cart");
		if(null == (session.getAttribute("cart"))) {
			
			try {
				ArrayList<Booking> booking_list = b.getBookingHistory(userId);
				
				// if the value of list is 0, then redirect to a no history page
				if(booking_list.size() == 0){
					response.sendRedirect("noBookingHistory.jsp");
				}
				else{
					System.out.println("Booking list size is : "+booking_list.size());
					session.setAttribute("booking_list", booking_list);
					RequestDispatcher rd = request.getRequestDispatcher("/booking-history.jsp") ;
					rd.include(request, response);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   }
			else{
				@SuppressWarnings("unchecked")
		List<ShoppingCartBean> flights = (List<ShoppingCartBean>) session.getAttribute("cart");
		System.out.println(flights.size());
		try {
			
			for (Iterator<ShoppingCartBean> iter = flights.iterator(); iter.hasNext(); ) {
				 ShoppingCartBean element = iter.next();
				 String flight_id= element.getFlight_id().toString();
				 int booking_id = b.update_booking_flights(flight_id);
				 int numberOfTickets = element.getNumberOfTickets();
				 int account_number = 100001;
				 int user_id= (int) session.getAttribute("user_id");
				 System.out.println("user_id(int)(bookinghistory serlvet)"+user_id);
				 int total_cost= element.getTotal_cost();
				 b.update_bookings(booking_id, flight_id, numberOfTickets, account_number, user_id, total_cost);
										   
				} 
		}
			 catch (SQLException e) {
				e.printStackTrace();
			}	
		 session.removeAttribute("cart");
		
		
		try {
			ArrayList<Booking> booking_list = b.getBookingHistory(userId);
			
			// if the value of list is 0, then redirect to a no history page
			if(booking_list.size() == 0){
				response.sendRedirect("noBookingHistory.jsp");
			}
			else{
				System.out.println("Booking list size is : "+booking_list.size());
				session.setAttribute("booking_list", booking_list);
				RequestDispatcher rd = request.getRequestDispatcher("/booking-history.jsp") ;
				rd.include(request, response);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	  }
}
		
		
		
	

	
	
	

