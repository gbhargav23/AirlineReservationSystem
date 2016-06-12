package BookAirlines;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class SearchResults_servlet
 */
@WebServlet("/SearchResults_servlet")
public class SearchResults_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchResults_servlet() {
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
		System.out.println("Flight number is : "+flight_id);
		String flight_class = request.getParameter("flight_class");
		System.out.println("Flight class is : "+flight_class);
//		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "cse464", "nihar", "K=A$QM");
		Flights flight = new Flights();
		ResultSet rs = null;
		try {
			rs = flight.SelectedFlightDetails(flight_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BookResults bookRes = new BookResults();
		HttpSession session = request.getSession();
		bookRes.setFlightId(flight_id);
		bookRes.setDepartuteDate((String)session.getAttribute("departureDate"));
		bookRes.setSource((String)session.getAttribute("source"));
		bookRes.setSource((String)session.getAttribute("destination"));
		bookRes.setFlightClass(flight_class);
		
		request.setAttribute("flight_class", flight_class);
		request.setAttribute("rs", rs);
		session.setAttribute("bookList", bookRes);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Book.jsp");  
		rd.forward(request, response); 
		
	}

}
