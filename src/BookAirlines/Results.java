package BookAirlines;

import java.sql.Date;
import java.sql.Time;

public class Results {
	
private String flight;
private Date departuteDate;
private Date arrivalDate;
private Time departureTime;
private Time arrivalTime;
private String classType;

public Date getArrivalDate() {
	return arrivalDate;
}
public void setArrivalDate(Date arrivalDate) {
	this.arrivalDate = arrivalDate;
}
public Time getDepartureTime() {
	return departureTime;
}
public void setDepartureTime(Time departureTime) {
	this.departureTime = departureTime;
}
public Time getArrivalTime() {
	return arrivalTime;
}
public void setArrivalTime(Time arrivalTime) {
	this.arrivalTime = arrivalTime;
}

public Date getDepartuteDate() {
	return departuteDate;
}
public void setDepartuteDate(Date departuteDate) {
	this.departuteDate = departuteDate;
}


public String getFlight() {
	return flight;
}
public void setFlight(String flight) {
	this.flight = flight;
}
public String getClassType() {
	return classType;
}
public void setClassType(String classType) {
	this.classType = classType;
}

}
