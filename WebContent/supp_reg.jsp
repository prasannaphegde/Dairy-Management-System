<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SUPPLIER REGISTER</title>
<style>

body{
    margin: 0;
    padding: 0;
    background: #7FB3D5;

    background-size: cover;
    background-position: center;
    font-family: sans-serif;
}

.loginbox{
    width: 320px;
    height: 490px;
    background: #212F3D;
    opacity: 0.5;
    color: #fff;
    top: 50%;
    left: 50%;
    position: absolute;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 70px 30px;
}

.avatar{
    width: 100px;
    height: 100px;
    border-radius: 50%;
    position: absolute;
    top: -50px;
    left: calc(50% - 50px);
}

h1{
    margin: 0;
    padding: 0 0 20px;
    text-align: center;
    font-size: 22px;
}

.loginbox p{
    margin: 0;
    padding: 0;
    font-weight: bold;
}

.loginbox input{
    width: 100%;
    margin-bottom: 20px;
}

.loginbox input[type="text"], input[type="password"]
{
    border: none;
    border-bottom: 1px solid #fff;
    background: transparent;
    outline: none;
    height: 30px;
    color: #fff;
    font-size: 16px;
}
.loginbox input[type="submit"]
{
    border: none;
    outline: none;
    height: 40px;
    background: #212F3D;
    color: #fff;
    font-size: 18px;
    border-radius: 20px;
}
.loginbox input[type="submit"]:hover
{
    cursor: pointer;
    background: #757575;
    color: #000;
}
.loginbox a{
    text-decoration: none;
    font-size: 12px;
    line-height: 20px;
    color: darkgrey;
}

.loginbox a:hover
{
    color: #757575;
}



</style>
</head>
<body>
 <form action="supp_reg.jsp" method="post">

    <div class="loginbox">
 
        <h1>SUPPLIER REGISTER</h1>
            <p>USERNAME</p>
            <input type="text" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="username" placeholder="Enter username">
            <p>PASSWORD</p>
            
            <input type="password" name="password" placeholder="Maximum 8 characters">
           
             <p>ADDRESS</p>
            <input type="text" name="address" placeholder="Maximum 30 characters">
             <p>PHONE NUMBER</p>
            <input type="text" pattern="[6789][0-9]{9}"  name="phone" placeholder="Enter 10 digit phone number">
            <input type="submit" name="submit" value="Register"/>
            
            
               
                  
               </div>
<% 


String username=request.getParameter("username");
String password=request.getParameter("password");
String sup_id=request.getParameter("sup_id");
String address=request.getParameter("address");
String phone=request.getParameter("phone");



String connectionURL ="jdbc:mysql://localhost:3306/Dairymanagement";

Connection connection = null;

PreparedStatement pstatement = null;

Class.forName("com.mysql.jdbc.Driver");

int updateQuery = 0;

if( username!=null && password!=null && address!=null && phone!=null ){

if( username!="" && password!="" && address!="" && phone!="") {

try {

connection = DriverManager.getConnection(connectionURL,"root","root");

String queryString = "insert into supp(username,password,sup_id,address,phone) values( ?, ? , ? ,?, ?)";

pstatement = connection.prepareStatement(queryString);


pstatement.setString(1, username);

pstatement.setString(2,password);

pstatement.setString(3,null);
pstatement.setString(4,address);
pstatement.setString(5,phone);


updateQuery = pstatement.executeUpdate();

if (updateQuery != 0) { %>

<br>

<center><TABLE style="background-color: white;" WIDTH="80%" border="1">

<tr><th>Data is inserted successfully to database.</th></tr>

</table></center>

<%

}

}



catch(Exception ex){
	%>
	<script type="text/javascript">
	alert("<%=ex %> ");
	window.location="supp_reg.jsp";
	</script> 
	 <% 
}

finally {

pstatement.close();

connection.close();

}

}

}

%>

  </form>
  
             <button    > <B><a href="adfeat1.html">BACK</B> </a></button>

</body>
</html>