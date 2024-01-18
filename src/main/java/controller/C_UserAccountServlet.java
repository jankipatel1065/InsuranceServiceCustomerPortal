package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelper.UserQuery;
import model.User;

/**
 * Servlet implementation class C_UserAccountServlet
 */
@WebServlet("/C_UserAccountServlet")
public class C_UserAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public C_UserAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String css = "<link rel='stylesheet' type='text/css'>";
		String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " + "Transitional//EN\">\n";
		boolean isValid = true;		
		
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		String Phone = request.getParameter("Phone");
		String Email = request.getParameter("Email");
		String Address = request.getParameter("Address");	

		if (Username.isEmpty() || Password.isEmpty() || Phone.isEmpty() || Email.isEmpty()
				|| Address.isEmpty()) 
		{
			out.println("<H3 style='color:red;'>*Please go back, and enter all the details to add a new user.*</H3>");
			isValid = false;
		}
		
		if (isValid) {		
			User user = new User();
			user.setUsername(Username);
			user.setPassword(Password);
			user.setPhone(Phone);
			user.setEmail(Email );
			user.setAddress(Address);
						
			try {
				UserQuery add = new UserQuery();				
				add.doAddUser(user);	
				
				request.setAttribute("loggedInUser", user.getUsername());
				String url = "/LoginUser.jsp";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
	}
}
