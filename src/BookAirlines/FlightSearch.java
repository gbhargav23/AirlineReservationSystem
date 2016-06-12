package BookAirlines;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FlightSearch
 */
@WebServlet("/FlightSearch")
public class FlightSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

//
//HttpSession session = request.getSession(false);
//		if(session == null){
//			response.sendRedirect("Login.jsp");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "cse464", "nihar", "K=A$QM");

		String tripType = request.getParameter("tripType");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String departureDate = request.getParameter("departureDate");
		String returnDate= request.getParameter("returnDate");
		String flight_class = request.getParameter("flightClass");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		System.out.println("username in flightserach servlet is "+ username);
		
	
		session.setAttribute("source", source);
		session.setAttribute("destination", destination);
		session.setAttribute("departureDate", departureDate);
		session.setAttribute("flight_class", flight_class);
		
		String[] deptdate = dateSplit(departureDate);
		String[] arrdate = dateSplit(returnDate); 
		
		Results result = new Results();
	//	result.setClassType(flight_class);
		
		Flights flight = new Flights();
		ArrayList<Results> flightList;
		try {
			flightList = flight.FlightSearchResults(source, destination,deptdate,flight_class);
		
		
		request.setAttribute("flight_class", flight_class);
		session.setAttribute("flightList", flightList);
		System.out.println("Size is : "+flightList.size());
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/SearchResult.jsp");  
		rd.forward(request,response); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(rs);
//		try {
//			if (!rs.wasNull()){
////				response.sendRedirect("SearchResults.jsp");
//				while(rs.next()){
//				System.out.println("abc"+rs.getString("id"));
////				request.setAttribute("rs", rs);
////				RequestDispatcher rd = getServletContext().getRequestDispatcher("SearchResult.jsp");  
////				rd.forward(request, response); 
//
//				}
//			
//			jdbc.conn.close();
//
//			}
//		}
//		catch (SQLException e) {
//			e.printStackTrace();
//		}
		
		
	}
	private String[] dateSplit(String departure_date) {
		// TODO Auto-generated method stub
		System.out.println("Departure Date is : "+departure_date);
		String[] buffer = departure_date.split("-");
		return buffer;
	}
	
	}
		



