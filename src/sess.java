import java.io.*;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
public class sess extends HttpServlet
{
	Connection con;
	public void init()throws ServletException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Dairymanagement","root","root");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String us=request.getParameter("username");
		String pd=request.getParameter("password");
		
		if((us==null || us.trim().isEmpty()) && (pd==null || pd.trim().isEmpty())) {
			request.setAttribute("errorMessage", "UserName or Password is empty or null");
		    RequestDispatcher rd=request.getRequestDispatcher("/sup_reg");
	        rd.forward(request, response);
		}else {
	
		try
		{
			
		CallableStatement stmt = con.prepareCall("{call verifyUser(?,?,?,?)}");
		stmt.setString(1, us);
		stmt.setString(2, pd);
		stmt.registerOutParameter(3,java.sql.Types.VARCHAR);
		stmt.registerOutParameter(4, java.sql.Types.BOOLEAN);
		ResultSet rs = stmt.executeQuery();
		String uName = stmt.getString(3);
		Boolean isVerified = stmt.getBoolean(4);
		rs.close();
		if(isVerified){
			 HttpSession session = request.getSession();
			 session.setAttribute("userName", uName);
             //RequestDispatcher rd=request.getRequestDispatcher("/home");
             response.sendRedirect("adfeat.html");
             //rd.forward(request, response);
		}
		else
		{
			  request.setAttribute("errorMessage", "Unable to verify user with the credentails provided");
		      RequestDispatcher rd=request.getRequestDispatcher("/sup_reg");
	          rd.forward(request, response);
		}
			
		}
		catch(Exception e)
		{
			request.setAttribute("errorMessage", e.getMessage());
		    RequestDispatcher rd=request.getRequestDispatcher("/sup_reg");
	        rd.forward(request, response);
		}
		}}
	}