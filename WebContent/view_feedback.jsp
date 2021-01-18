<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style>
body{
     font-family:sans-serif;
     font-size:1em;
    }
table{
      width:88%;
     }    
table,th,td{
      border:1px solid black;
      border-collapse:collapse;
      opacity:0.95;
     }    
th,td{
      padding:10px;
      text-align:center;
     }  
th{
   background-color:#0000;
   color:black;
  }   
tr:nth-child(even)
    {
      background-color:;
    }  
tr:nth-child(odd)
    {
      background-color:white;
    }           
</style>
</head>
<body>
                 <button    > <B><a href="adfeat1.html;">BACK</B> </a></button>

<form name="form1" method="post" action="view_feedback.jsp" >
    <center>
    
    </form>
<table align="center">
      <tr>
      <td colspan="7"><h1>FEEDBACK</h1></td>
      </tr>
      <tr>
           <th>NAME</th>
          <th>PHONE NUMBER</th>
          
           <th>FEEDBACK</th>
          <th>FID</th>

           
      </tr>

<% 
String connectionURL ="jdbc:mysql://localhost:3306/Dairymanagement";

Connection connection = null;



ResultSet rs=null;

try {

	Class.forName("com.mysql.jdbc.Driver").newInstance();

	connection = DriverManager.getConnection(connectionURL,"root","root");
	
	CallableStatement st=connection.prepareCall("CALL feed_display();");
	

   rs=st.executeQuery();
   
   while(rs.next())
   {
	 %>	   
	 <tr>
	     <td><%=rs.getString(1) %></td>
	     <td><%=rs.getString(2) %></td>
	     <td><%=rs.getString(3) %></td>
	     <td><%=rs.getString(4) %></td>

	     
	 </tr>
     <%
   }

   
}catch(Exception e)
{
}
finally {

	

	connection.close();

	}

	
%>

</table>
</body>
</html>