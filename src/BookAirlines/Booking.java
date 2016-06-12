package BookAirlines;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Booking {
//	int booking_id;

	private int booking_id;
	private Date date_of_booking;
	private int number_of_seats;
	private long account_id;
	private int flight_id;
	private String user_id;
	public int getBooking_id() {
		return booking_id;
	}


	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}


	public Date getDate_of_booking() {
		return date_of_booking;
	}


	public void setDate_of_booking(Date date_of_booking) {
		this.date_of_booking = date_of_booking;
	}


	public int getNumber_of_seats() {
		return number_of_seats;
	}


	public void setNumber_of_seats(int number_of_seats) {
		this.number_of_seats = number_of_seats;
	}


	public long getAccount_id() {
		return account_id;
	}


	public void setAccount_id(long account_id) {
		this.account_id = account_id;
	}


	public int getFlight_id() {
		return flight_id;
	}


	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public double getTotal_cost() {
		return total_cost;
	}


	public void setTotal_cost(double total_cost) {
		this.total_cost = total_cost;
	}


	public String getOperator() {
		return operator;
	}


	public void setOperator(String operator) {
		this.operator = operator;
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


	public Date getDeparture_time() {
		return departure_time;
	}


	public void setDeparture_time(Date departure_time) {
		this.departure_time = departure_time;
	}


	public Date getArrival_time() {
		return arrival_time;
	}


	public void setArrival_time(Date arrival_time) {
		this.arrival_time = arrival_time;
	}

	private double total_cost;
	
	private String operator;
	private String source;
	private String destination;
	private Date departure_time;
	private Date arrival_time;
	
	
	public int update_booking_flights(String flight_id) throws SQLException{
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");

		ArrayList<Object> param =  new ArrayList<Object>();
		param.add(flight_id);
		int returedrows= jdbc.updateDB("insert into booking_flights (flight_id) values (?)",param);
		if(returedrows>0){
			System.out.println("flight_id inserted into booking_flights");
			ResultSet rs1 = jdbc.queryDB("select booking_id from booking_flights where flight_id=?",param);
			if(rs1.next()){
				booking_id = rs1.getInt("booking_id");
			
			}
		}
		else{
			System.out.println("now rows inseted into booking_flights ");
		}
		jdbc.conn.close();
		return booking_id;
		
	}
	
	
	public void update_bookings(int booking_id,String flight_id,int numberOfTickets ,int account_number, int user_id, int total_cost) throws SQLException{
		
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");


				Timestamp currentTimestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
				System.out.println(currentTimestamp);
								
				ArrayList<Object> param =  new ArrayList<Object>();
				param.add(booking_id);
				param.add(flight_id);
				param.add(currentTimestamp);
				param.add(numberOfTickets);
				param.add(account_number);
				param.add(user_id);
				param.add(total_cost);

				
				int rowsUpdated = jdbc.updateDB("INSERT INTO Bookings values (?,?, ?, ?, ?, ?, ?)",param);

				
				if(rowsUpdated>0){
				System.out.println("Successfully added the Booking ");
				}else{
				System.out.println("not update Booking..something went wrong");
				}
				
				
				jdbc.conn.close();
				

		}
	
	public void update_accounts (int account_number,int remainingBalance ) throws SQLException{
		
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");

		ArrayList<Object> param =  new ArrayList<Object>();
		param.add(remainingBalance);
		param.add(account_number);
		
		int rowsUpdated = jdbc.updateDB("UPDATE Accounts SET balance=? WHERE account_id=?",param);
		
		if(rowsUpdated>0){
			System.out.println("Successfully update accounts ");
			}else{
			System.out.println("accounts not updated..something went wrong");
			}
			
			
			jdbc.conn.close();
			}
	
	// Function to fetch booking history results
		public ArrayList<Booking> getBookingHistory(int userID) throws SQLException{
			
			
			ArrayList<Object> param =  new ArrayList<Object>();
			param.add(userID);
			System.out.println("booking userid"+userID);
//			//String query_string = "select x.booking_id, x.date_of_booking, x.flight_id, x.number_of_seats, x.total_cost"
//					+ " FROM "
//					+"Bookings as x"
//					+"WHERE"
//					+"x.user_id=?";
					
			
			JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");
			ResultSet rs1 = jdbc.queryDB("select booking_id, date_of_booking, flight_id, number_of_seats, total_cost from Bookings where user_id=?",param);
					
			
			System.out.println(rs1.getStatement());
			
			ArrayList<Booking> booking_list = new ArrayList<Booking>();
			
			if(rs1!=null){
				while(rs1.next()){
					Booking b = new Booking();
					b.setBooking_id(rs1.getInt("booking_id"));
					b.setFlight_id(rs1.getInt("flight_id"));
				//	b.setDate_of_booking(new Date(rs1.getTimestamp("date_of_booking").getTime()));
				//	b.setOperator(rs1.getString("operator"));
				//	b.setSource(rs1.getString("source"));
				//	b.setDestination(rs1.getString("destination"));
				//	b.setDeparture_time(new Date(rs1.getTimestamp("departure").getTime()));
				//	b.setArrival_time(new Date(rs1.getTimestamp("arrival").getTime()));
					b.setNumber_of_seats(rs1.getInt("number_of_seats"));
					b.setTotal_cost(rs1.getDouble("total_cost"));
					
					booking_list.add(b);
				}
			}
			
			jdbc.conn.close();
			return booking_list;
		}
	
}
