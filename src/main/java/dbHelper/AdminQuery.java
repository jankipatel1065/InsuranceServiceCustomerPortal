package dbHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/*
 * AdminQuery class - To handle all Admin related functionalities with database.
 */
public class AdminQuery {
	Connection con = null;
	ResultSet resultset = null;
	
	public AdminQuery() throws Exception {
		con = DBConnection.getConnection();
	}
	
	//Method to validate and perform Admin Login
	public boolean doLoginAdmin(String adminname, String a_password) {
		boolean res = true;
		
		try {
			String query = "SELECT * FROM admin WHERE adminname = ? AND a_password = ?";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, adminname);
			preparedStatement.setString(2, a_password);
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {			
				System.out.println("Admin record exists");								
			} else {
				res = false;
				System.out.println("No admin record exists");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

}
