<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stu</title>
</head>
<body>
 <%

try
 {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Dairymanagement","root","root");
   String sup_id=request.getParameter("sup_id");
   String address=request.getParameter("address");
  String phone=request.getParameter("phone");
  String quantity=request.getParameter("quantity");

   
   
   PreparedStatement st=con.prepareStatement("update supp set address=?,phone=?,quantity=? where sup_id=?");
   st.setString(1,address);
   st.setString(2,phone);
   st.setString(3,quantity);

   st.setString(4,sup_id);

   
   
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
 <a href="updsup.html" class="previous">Retry</a>

 </body>