package BookAirlines;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Flights {
	
	private String flight_number;
	private String operator_name;
	private String source;
	private String destination;
	private long departure_time;
	private long arrival_time;
	private String plane_number;
	private int firstclass_available;
	private int businessclass_available;
	private int economy_available;
	
	
	ArrayList<Integer> flightId = new ArrayList<Integer>();
	ArrayList<Integer> planeId = new ArrayList<Integer>();
	ArrayList<String>  operator= new ArrayList<String>();
	

	public ArrayList<Results> FlightSearchResults(String source,String destination,String[] deptdate,String flight_class) throws SQLException{
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "cse464", "bgorthi", "Xn3r6K");
		ArrayList<Object> param =  new ArrayList<Object>();
		ArrayList<Results> resultsArray = new ArrayList<Results>();
		param.add(source);
		param.add(destination);
		param.add(Integer.parseInt(deptdate[2]));
		param.add(Integer.parseInt(deptdate[1]));
		param.add(Integer.parseInt(deptdate[0]));
		ResultSet rs1 = jdbc.queryDB("SELECT * FROM flights"
				+ " WHERE source = ? "
				+ " AND destination = ? "
				+ " AND DAY(departure) = ? "
				+ " AND MONTH(departure) = ? "
				+ " AND YEAR(departure) = ? ", param);
		System.out.println(jdbc.toString());
		try {
			if (rs1 != null){
				while(rs1.next()){
				Results result = new Results();
				result.setArrivalTime(rs1.getTime("arrival"));
	     		result.setFlight(rs1.getString("id"));
				result.setDepartureTime(rs1.getTime("departure"));
				result.setDepartuteDate(rs1.getDate("departure"));
				result.setClassType(flight_class);
				resultsArray.add(result);
					}
				
				
				}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return resultsArray;
	}
	
	public ResultSet SelectedFlightDetails(String flight_id) throws SQLException{
		
		System.out.println("Flight Id is : "+flight_id);
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "cse464", "bgorthi", "Xn3r6K");
		ArrayList<Object> param =  new ArrayList<Object>();
		param.add(flight_id);
		ResultSet rs1 = jdbc.queryDB("SELECT * FROM flights WHERE id=?", param);
		try {
			if (rs1 != null){
//				while(rs1.next()){
//					System.out.println("abc"+rs1.getString("id"));
////					request.setAttribute("rs", rs);
////					RequestDispatcher rd = getServletContext().getRequestDispatcher("SearchResult.jsp");  
////					rd.forward(request, response); 
//
//					}
//				
				
				}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}
//	jdbc.conn.close();
		return rs1;
		
	}
	
	public int TicketAvailability(String flight_id, String flight_class) throws SQLException{
		try{
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "cse464", "bgorthi", "Xn3r6K");
		ArrayList<Object> param =  new ArrayList<Object>();
		System.out.println("Flight ID (ticAval) : "+flight_id);
		param.add(flight_id);
	
		   if(flight_class.equals("FirstClass")){
			ResultSet rs1 = jdbc.queryDB("SELECT P.first_class_capacity FROM planes AS P, flights as F WHERE F.id=? AND F.plane=P.id", param);
			
				if (rs1 != null){
				while(rs1.next()){
					return rs1.getInt("first_class_capacity");
				}
				}
				else{
					return 0;
				}
				jdbc.conn.close();
				 
			}
			else if(flight_class.equals("Business")){
				ResultSet rs1 = jdbc.queryDB("SELECT P.business_capacity FROM planes AS P, flights as F WHERE F.id=? AND F.plane=P.id ", param);
			
					if (rs1 != null){
					while(rs1.next()){
						return rs1.getInt("business_capacity");
					}
					}
					else{
						return 0;
					}
					jdbc.conn.close();
					
			}
			else {
				ResultSet rs1 = jdbc.queryDB("SELECT P.economy_capacity FROM planes AS P, flights as F WHERE F.id=? AND F.plane=P.id", param);
		
					if (rs1 != null){
					while(rs1.next()){
						return rs1.getInt("economy_capacity");
					}
					}
					else{
						return 0;
					}
					jdbc.conn.close();
					
			}
		
		
		}catch(Exception e){
			
			System.out.println("Some error occured");
		}
		return 0;
		
		
	}

	public String getPlane_number() {
		return plane_number;
	}
	public void setPlane_number(String plane_number) {
		this.plane_number = plane_number;
	}
	public int getFirstclass_available() {
		return firstclass_available;
	}
	public void setFirstclass_available(int firstclass_available) {
		this.firstclass_available = firstclass_available;
	}
	public int getBusinessclass_available() {
		return businessclass_available;
	}
	public void setBusinessclass_available(int businessclass_available) {
		this.businessclass_available = businessclass_available;
	}
	public int getEconomy_available() {
		return economy_available;
	}
	public void setEconomy_available(int economy_available) {
		this.economy_available = economy_available;
	}
	public String getFlight_number() {
		return flight_number;
	}
	public void setFlight_number(String flight_number) {
		this.flight_number = flight_number;
	}
	public String getOperator_name() {
		return operator_name;
	}
	public void setOperator_name(String operator_name) {
		this.operator_name = operator_name;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public long getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(long departure_time) {
		this.departure_time = departure_time;
	}
	public long getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(long arrival_time) {
		this.arrival_time = arrival_time;
	}
	
	
}
