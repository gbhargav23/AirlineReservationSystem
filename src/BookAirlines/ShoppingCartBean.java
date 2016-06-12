package BookAirlines;

import java.sql.Date;
import java.sql.Time;

public class ShoppingCartBean {

	private String flight_id= "";
	private String flight_class= "";
	private int total_cost = 0;
	private int numberOfTickets = 0;
	//private int 
	//private String
	//private String 
	public String getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(String flight_id) {
		this.flight_id = flight_id;
	}
	public String getFlight_class() {
		return flight_class;
	}
	public void setFlight_class(String flight_class) {
		this.flight_class = flight_class;
	}
	public int getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}
	public int getNumberOfTickets() {
		return numberOfTickets;
	}
	public void setNumberOfTickets(int numberOfTickets) {
		this.numberOfTickets = numberOfTickets;
	}

	
}
