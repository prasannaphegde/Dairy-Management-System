<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MILK REGISTER</title>
<style>

body{
    margin: 0;
    padding: 0;
    background: #D2B48C;

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
    background: #D2B48C;
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
    color: #D2B48C;
}

</style>
</head>
<body>             <button    > <B><a href="adfeat1.html">BACK</B> </a></button>

 <form action="milk_reg.jsp" method="post">

    <div class="loginbox">
 
        <h1>ADD MILK DETAILS</h1>
            
            <p>SUPPLIER ID</p>
            <input type="text" name="sup_id" placeholder="Enter supplier id" >
             <p>FAT(%)</p>
            <input type="text" pattern="([0.1-0.9])|([0-9])|([0-9][0-9])" name="fat" placeholder="Enter amount of fat">
             <p>PRICE(Rs)</p>
            <input type="text" pattern="([0-9])|([0-9][0-9])|([0-9][0-9][0-9])|([0-9][0-9][0-9][0-9])"name="price" placeholder="Enter price">
            
            <input type="submit" name="submit" value="Register"/>
               |
        
        
<%



String sup_id=request.getParameter("sup_id");
String fat=request.getParameter("fat");
String price=request.getParameter("price");

String connectionURL ="jdbc:mysql://localhost:3306/Dairymanagement";

Connection connection = null;

PreparedStatement pstatement = null;

Class.forName("com.mysql.jdbc.Driver");

int updateQuery = 0;

if(  sup_id!=null && fat!=null && price!=null){

if(  sup_id!="" && fat!="" && price!="") {

try {

connection = DriverManager.getConnection(connectionURL,"root","root");

String queryString = "insert into milk(sup_id,fat,price) values(  ? , ? ,?)";

pstatement = connection.prepareStatement(queryString);




pstatement.setString(1,sup_id);

pstatement.setString(2,fat);
pstatement.setString(3,price);


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