import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class Supplier_login extends GenericServlet
{
	Connection con;
	
	public void init() throws ServletException
	{
		try{
	      Class.forName("com.mysql.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Dairymanagement","root","root");
			
		}catch(Exception e)
		{
			
			
		}
	}
	public void service(ServletRequest request,ServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		try{
		String query = "select username,password from supp where username=? and password=?";		
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,username);
		ps.setString(2,password);
		
		ResultSet rs=ps.executeQuery();
		
		if(rs.next())
		{
          RequestDispatcher rd=request.getRequestDispatcher("sup_feat.html");
          rd.forward(request,response);
		}
		else
		{
			 RequestDispatcher rd=request.getRequestDispatcher("supplier.html");
	         rd.forward(request,response);
			
		}
		}catch(Exception e)
		{
			pw.println("invalid password"+e);
			
		}
	}
			
	
}