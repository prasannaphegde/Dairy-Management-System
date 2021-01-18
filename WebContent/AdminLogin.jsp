<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
      <%@ page import="java.io.*" %>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>
   JSP Page
   </title> 
   </head> 
   <body> 
   <form action="AdminLogin.jsp">
   <%
   
   
   
	
   String username=request.getParameter("username"); 
   String password=request.getParameter("password");
if(username!=null&&password!=null){
	if(username!=""&&password!=""){


   

   
   try{
	   

	   
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Dairymanagement","root","root");
   
   response.setContentType("text/html");
	
	
   
	String query = "select username,password from admin where username=? and password=?";		
	PreparedStatement ps=con.prepareStatement(query);
	ps.setString(1,username);
	ps.setString(2,password);
	
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
     RequestDispatcher rd=request.getRequestDispatcher("adfeat1.html");
     rd.forward(request,response);
	}
	else
	{
	   	 out.println("<script>alert('INVALID USERNAME OR PASSWORD');window.location='Login.html';</script>");

	}
	}catch(Exception e)
	{
		out.println(e);

	}
   
   
	}
}
   
   
   
   
   
   
   
   
   
   
   
   
  

   %> 
   
   </form>
   </body> 
   </html>

