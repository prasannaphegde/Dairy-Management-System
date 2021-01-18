import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class feedback extends GenericServlet
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
		String phone=request.getParameter("phone");
		String fedback=request.getParameter("fedback");
		String fid=request.getParameter("fid");

		
        try{
        	String query="insert FEEDBACK values(?,?,?,?)";
    		PreparedStatement ps=con.prepareStatement(query);
    		
    		ps.setString(1,username);
    		ps.setString(2,phone);
    		ps.setString(3,fedback);
    		ps.setString(4,null);

    		int i=ps.executeUpdate();
    		
    		if(i>0)
    		{
    			pw.println("Thanks For Your FeedBack");
    		}
    		else{
    			pw.println("values not inserted successfully");

    		}
        }catch(Exception e)
        {
        	pw.println("ERROR"+e);
        }
        
		pw.print("<center><a href='index.html'>BACK</a>");
		pw.close();
		
		
	}
			
	
}