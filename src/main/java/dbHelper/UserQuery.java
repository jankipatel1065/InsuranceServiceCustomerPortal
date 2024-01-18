package dbHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
/*
 * UserQuery class - To handle all User related functionalities with database.
 */
public class UserQuery {	
	Connection con = null;
	ResultSet resultset = null;

	public UserQuery() throws Exception {
		con = DBConnection.getConnection();
	}
	
	//Method to insert/register new user in database
	public void doAddUser(User user) {		
		String Username = user.getUsername();
		String Password = user.getPassword();
		String Phone = user.getPhone();
		String Email = user.getEmail();
		String Address = user.getAddress();	

		try {
			String query = "INSERT INTO user(Username, Password, Phone, Email, Address) VALUES (?,?,?,?,?)";

			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, Username);
			preparedStatement.setString(2, Password);
			preparedStatement.setString(3, Phone);			
			preparedStatement.setString(4, Email);
			preparedStatement.setString(5, Address);
			preparedStatement.executeUpdate();
			System.out.println("SQL Query: " + query);


		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//Method to validate and perform User Login
	public boolean doLoginUser(String username, String password) {
		boolean res = true;
		try {
			String query = "SELECT * FROM user WHERE Username = '" + username + "' AND Password = '" + password + "'";

			PreparedStatement preparedStatement = con.prepareStatement(query);			
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {			
				System.out.println("User record exists");								
			} else {
				res = false;
				System.out.println("No user record exists");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

}
