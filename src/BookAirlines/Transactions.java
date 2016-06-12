package BookAirlines;

import java.sql.ResultSet;
import java.util.ArrayList;

public class Transactions {
	
	int account_balance;
	

	public boolean AccountExists(int account_number){
		
		JDBCAuthentication jdbc = new JDBCAuthentication("cse.unl.edu", "nihar", "nihar", "K=A$QM");
		boolean accountCheck = false;
		ArrayList<Object> param =  new ArrayList<Object>();
		param.add(account_number);

		ResultSet rs1 = jdbc.queryDB("SELECT * from Accounts where account_id=?", param);
		
		try {
			if(rs1.next()){
					accountCheck = true;
					account_balance = rs1.getInt("balance");
					
					
				}
				 
			else{
				System.out.println("no such account exists");
			}
			jdbc.conn.close();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return accountCheck;
	}
	
	
	public int getaccount_Balance() {
		return account_balance;
	}
	
	
}
	
