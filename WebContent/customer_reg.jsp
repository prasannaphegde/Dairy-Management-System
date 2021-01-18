<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CUSTOMER REGISTER</title>
<style>

body{
    margin: 0;
    padding: 0;
 background: #78909C;
    background-size: cover;
    background-position: center;
    font-family: sans-serif;
}

.loginbox{
    width: 320px;
    height: 490px;
    background: #000;
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
    background: #000;
    color: #fff;
    font-size: 18px;
    border-radius: 20px;
}
.loginbox input[type="submit"]:hover
{
    cursor: pointer;
    background: #78909C;
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
    color: #78909C;
}

</style>
</head>
<body>
             <button    > <B><a href="adfeat1.html">BACK</B> </a></button>

 <form action="customer_reg.jsp" method="post">

    <div class="loginbox">
 
        <h1>CUSTOMER REGISTER</h1>
            <p>USERNAME</p>
            <input type="text" pattern=pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="username" placeholder="Enter Customer name">
            <p>PASSWORD</p>
            
            <input type="password" name="password" placeholder="Maximum of 8 characters" >
           
             <p>PHONE NUMBER</p>
            <input type="text" pattern="[6789][0-9]{9}"  name="phone" placeholder="Enter 10 digit phone number">
            
             <p>QUANTITY</p>
             <input type="text" pattern="[0-9]|[0-9][0-9]" name="quantity" placeholder="Enter Quantity(Ltrs)" >
             
            <input type="submit" name="submit" value="Register"/>
               
               
               
        
        
<%


String username=request.getParameter("username");
String password=request.getParameter("password");
String sup_id=request.getParameter("cid");
String phone=request.getParameter("phone");
String quantity=request.getParameter("quantity");



String connectionURL ="jdbc:mysql://localhost:3306/Dairymanagement";

Connection connection = null;

PreparedStatement pstatement = null;

Class.forName("com.mysql.jdbc.Driver");

int updateQuery = 0;

if( username!=null && password!=null  && phone!=null && quantity!=null ){

if( username!="" && password!="" && phone!="" && quantity!="") {

try {

connection = DriverManager.getConnection(connectionURL,"root","root");

String queryString = "insert into customer(username,password,cid,quantity,phone) values( ?, ? , ? ,?, ?)";

pstatement = connection.prepareStatement(queryString);


pstatement.setString(1, username);

pstatement.setString(2,password);

pstatement.setString(3,null);
pstatement.setString(4,quantity);
pstatement.setString(5,phone);


updateQuery = pstatement.executeUpdate();

if (updateQuery != 0) { %>

<br>

<center><TABLE style="background-color: black;" WIDTH="50%" border="1">

<tr><th>Data is inserted successfully to database.</th></tr>

</table></center>

<%

}

}

catch (Exception ex) {

out.println("Unable to connect to database.");

}

finally {

pstatement.close();

connection.close();

}

}

}

%>

  </form>

</body>
</html>