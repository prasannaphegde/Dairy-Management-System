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
   String cid=request.getParameter("cid");
  // String address=request.getParameter("address");
   String password=request.getParameter("password");

  String phone=request.getParameter("phone");

   
   
   PreparedStatement st=con.prepareStatement("update customer set phone=? where cid=? and password=?");
   
   st.setString(1,phone);
   st.setString(2,cid);
   st.setString(3,password);

   
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
<a href="customer_feat1.html" class="previous">Retry</a>
 </body>