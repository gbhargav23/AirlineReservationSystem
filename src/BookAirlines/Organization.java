package BookAirlines;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Organization {
	private String orgname;
	private String orgaddress;
	private Connection con;
	public Organization(){
		this.orgname="organizationName";
		this.orgaddress="organizationAddress";
		
	}
	public void setOrganization(String username,String orgname,String orgaddress){
		try{
			JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");
			ArrayList<Object> param =  new ArrayList<Object>();
			param.add(orgname);
			param.add(orgaddress);
			param.add(username);
			
			int rowsUpdated = jdbc.updateDB("update Users SET organizationName = ? , organizationAddress = ? where username = ?",param);
			if(rowsUpdated>0){
				System.out.println("Successfully added the Booking ");
				}else{
				System.out.println("not update Booking..something went wrong");
				}
				jdbc.conn.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		catch(Exception e){
			System.out.println(e);
		}		
	}
	public OrgBean getOrganization(String username){
		OrgBean org = null;
		try{
			JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");
			ArrayList<Object> param =  new ArrayList<Object>();
			param.add(username);
			ResultSet rs = jdbc.queryDB("select organizationName,organizationAddress from Users where username = ?",param);			
			if(rs.next()){
				orgname = rs.getString(1);
				orgaddress = rs.getString(2);
				org=new OrgBean(orgname,orgaddress);	
			}	
			jdbc.conn.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		catch(Exception e){
			System.out.println(e);
		}
		return org;		
	}
  
}
