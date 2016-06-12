package BookAirlines;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCart_servlet
 */
@WebServlet("/AddToCart_servlet")
public class AddToCart_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart_servlet() {
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
		String flight_id = request.getParameter("flight_id");
		String flight_class= request.getParameter("flight_class");
		int numberOfTickets = Integer.parseInt(request.getParameter("numberOfTickets"));
				//Integer.parseInt(request.getParameter("numberOfTickets"));
		System.out.println("AddToServlet -no.of tickts"+numberOfTickets);
		int total_cost = 350*numberOfTickets;
		
		PrintWriter out = response.getWriter();
		HttpSession session =  request.getSession();
		
		ShoppingCartBean flight = new ShoppingCartBean();
		
		
			
			// Creating new bean to copy
			flight.setFlight_class(flight_class);
			flight.setFlight_id(flight_id);
			flight.setNumberOfTickets(numberOfTickets);
			flight.setTotal_cost(total_cost);
			
			if(session.getAttribute("cart")==null) {
				List<ShoppingCartBean> cart= new ArrayList();
				cart.add(flight);
				session.setAttribute("cart", cart);
				System.out.println("cart = null");
			}
			else {
				
				List<ShoppingCartBean> newcart = (List<ShoppingCartBean>) session.getAttribute("cart");
				newcart.add(flight);
				session.setAttribute("cart", newcart);
				System.out.println("cart != null");
			}
			out.write("Flight successfully added to cart");      

	}

}
