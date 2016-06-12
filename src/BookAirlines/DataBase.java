package BookAirlines;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBase {

	   public static Connection getConnection(){
		   
		   Connection con = null;
		   String host = "cse.unl.edu";
		   String db = "nihar";
		   String user = "nihar";
		   String pwd = "K=A$QM";
		   try{
			   Class.forName("com.mysql.jdbc.Driver").newInstance();
			   String connString = String.format("jdbc:mysql://%s:3306/%s?user=%s&password=%s",host,db,user,pwd);
			   con = DriverManager.getConnection(connString);
		   }catch(Exception e){
			   System.out.println("Error in connecting to the DB"+e);
		   }
		return con;
	   }
	   
}
