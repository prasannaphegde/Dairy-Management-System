<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 <%

try
 {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Dairymanagement","root","root");
   String samp_id=request.getParameter("samp_id");
   String fat=request.getParameter("fat");
   String price=request.getParameter("price");


   
   
   PreparedStatement st=con.prepareStatement("update milk set fat=?,price=? where samp_id=?");
   st.setString(1,fat);
   st.setString(2,price);
   st.setString(3,samp_id);

   int i=st.executeUpdate();
	if(i>0){
	out.println("Updated successfully");
 }
	else{
		out.println("Not updated successfully");

	}
 }	
 
catch(Exception e)
 {

	
 }           

%>
 <a href="update_milk.html" class="previous">Retry</a>

 </body>