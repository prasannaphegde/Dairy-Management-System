<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ page import="java.sql.*" %>

<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="icon"  href="logo.jpg" type="image/jpg"/>
<style>
body{
      background:#212F3D;
      background-repeat:no-repeat;
      background-size:100% 700px;  
            color:white; 
}
.simple-form{
     text-align:center;
     margin:100px 450px;
}
#registration{
     width:100%;
     background-color:black;
     opacity:.8;
     padding:50px 0px;
     outline:0px;
}
#button{
     width:250px;
     padding:10px;
     border-radius:5px;
          outline:0px;
}
#number{
     width:25px;
     padding:10px;
     border-radius:5px;
     outline:0px;
}
#butt{
     width:100px;
     padding:10px;
     border-radius:5px;
     outline:0px;
     background-color:#F44336;
     border:2px solid #01010;
}
a{
  text-decoration:none;
  color:#C70039;
}
a:hover{
     text-decoration:underline;
}


.loginbox button
{

border: none;
    outline: none;
    height: 40px;
    width:80px;
    background: #212F3D;
    color: #fff;
    font-size: 18px;
    border-radius: 20px;

}


.loginbox button:hover
{

 cursor: pointer;
    background: #757575;
    color: #000;

}


</style>
</head>
<body>
     <button> <B><a href="adfeat1.html">BACK</B> </a></button>

<center>

<div class="simple-form">

      <form id="registration" action="delete_staff.jsp" method="post">
    
                  <label><b>STAFF ID:&nbsp;
                 </b></label>
         <input type="text" name="sid" id="button" placeholder="Enter The STAFF ID to remove" required><br><br>
                <input type="submit" name="submit" value="delete" id="butt"/>&nbsp;&nbsp;
                                     <button> <B><a href="view-staff.jsp">CHECK</B> </a></button>
                
    </div>

<%	
String vnum = request.getParameter("sid");

if(vnum!=null){
	
if(vnum!=""){
try{

	
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Dairymanagement","root","root");
	
    String query="select * from staff  where sid=?" ;
    
    
    
	PreparedStatement ps=con.prepareStatement(query);
	
	ps.setString(1,vnum);
   
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
	
	//out.println(n);
	         String q="delete  from  staff   where sid=? " ;
	        
	     	 PreparedStatement statement=con.prepareStatement(q);
	     
	     	statement.setString(1,vnum);
	     	
	     	
	     	
             int i=statement.executeUpdate();
             
             if(i>0 ){
            	 out.println("<script>alert('deleted sucessfully');window.location='delete_staff.jsp';</script>");
             }
	}
	else
	{
   	 out.println("<script>alert('NOT RECORDS FOUND TO DELETE');window.location='delete_staff.jsp';</script>");

	}

}
catch(Exception e){
    	 
    	 out.println(e);
    	 out.println("Unable to connect to database.");

     }
}
}
     

	%>
  </form>
</center>

</body>
</html>