package BookAirlines;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Clients {

	Organization org=new Organization();
	
	
	/*
	Properties prop;
	String propertiesFileName;
	FileInputStream  inputStream = null;
	public Users(String path) throws IOException{
		prop = new Properties();
		propertiesFileName = path + "\\WEB-INF\\classes\\configure.properties";
		System.out.println(propertiesFileName);
		
		File f = new File(propertiesFileName);
		
		if(!f.exists()){
			f.createNewFile();
		}
		inputStream = new FileInputStream(propertiesFileName);
	}
	
	public boolean getPropValues(String username, String password) throws IOException {
		 
        boolean result = false;
        prop.load(inputStream);
        String company1 = prop.getProperty(username);
        inputStream.close();
        if(company1 != null && company1.equals(password))
        	result = true;
        return result;
    }
	
	public void setPropValues(String username, String password) throws IOException{
		//Properties prop = new Properties();
        
        System.out.println("Setting the new property "+ username + " And password " +password);
        prop.setProperty(username,password);
        //File f = new File(propertiesFileName);
        FileOutputStream output = new FileOutputStream(propertiesFileName,true);
		prop.store(output, null);
		output.close();
		System.out.println("New property Set");
		
		
	}
	*/
	
	
	public boolean checkUserName(String uName) throws SQLException{
		
		System.out.println("In the Model Class");
		
		boolean result = false;
		
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");
		ArrayList<Object> param =  new ArrayList<Object>();

	    param.add(uName);
	    
		
		ResultSet returnedResults  = jdbc.queryDB("SELECT * FROM Users Where username = ? ",param);
		// Checking if record exists
				if(returnedResults != null && returnedResults.next()){
					result = true;
					
				}
		
				jdbc.conn.close();
				System.out.println("Username check : "+result);
		return result;
	}
	
	public boolean checkPwd(String uName, String pwd) throws SQLException{
		
		boolean result = false;
		
		// List to hold the username 
				ArrayList<Object> param =  new ArrayList<Object>();
				
				JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");
				// Adding the username to the list
				param.add(uName);
				
				ResultSet returnedResults  = jdbc.queryDB("SELECT * FROM Users" +  " WHERE username = ? ",param);
			if(returnedResults != null)	{
				returnedResults.next();
				if(returnedResults.getString("password").equals(pwd)){
					result = true;
				}
			}
			jdbc.conn.close();

		return result;
	}
	
	public int UserID (String username) throws SQLException{
		int user_id = 0;
		ArrayList<Object> param =  new ArrayList<Object>();
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");
		param.add(username);
		ResultSet rs = jdbc.queryDB("SELECT user_id FROM Users where username=? ",param);
		if(rs.next()){
			user_id= rs.getInt("user_id");
			
		}
		else{
			System.out.println("error UserID User.java");
		}
		jdbc.conn.close();

		return user_id;
	}
	
	

}
