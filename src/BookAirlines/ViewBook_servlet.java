package BookAirlines;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewBook_servlet
 */
@WebServlet("/ViewBook_servlet")
public class ViewBook_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewBook_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String flight_id= request.getParameter("flight_id");
		String flight_class = request.getParameter("flight_class");
		System.out.println("flight_id ="+flight_id + " &flight_class="+flight_class);
		
		Flights flights = new Flights();
		int ticketsAvailable = 0;
		try {
			ticketsAvailable = flights.TicketAvailability(flight_id,flight_class);
			System.out.println("Flight-tickets Avail."+ticketsAvailable);
			PrintWriter out = response.getWriter();
			out.write(Integer.toString(ticketsAvailable));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("(viewBook Servlet)tickets available:" +ticketsAvailable);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flight_id= request.getParameter("flight_id");
		String flight_class = request.getParameter("flight_class");
		int numberOfTickets = Integer.parseInt(request.getParameter("numberOfTickets"));
		System.out.println("number of tkts : "+numberOfTickets);
		int cost_per_ticket = 350;
		int total_cost = (numberOfTickets * cost_per_ticket);
		
		Flights flights = new Flights();
		int ticketsAvailable = 0;
		try {
			ticketsAvailable = flights.TicketAvailability(flight_id,flight_class);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("(viewBook Servlet)tickets available:" +ticketsAvailable);
		
		if(ticketsAvailable >  numberOfTickets){
			
		request.setAttribute("flight_id", flight_id);
		request.setAttribute("flight_class", flight_class);
		request.setAttribute("numberOfTickets", numberOfTickets);
		request.setAttribute("total_cost", total_cost); 
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Transaction.jsp");  
		rd.forward(request, response); 
		}
		
		else{
			response.sendRedirect("NoTickets.jsp");
		}
	}

}
