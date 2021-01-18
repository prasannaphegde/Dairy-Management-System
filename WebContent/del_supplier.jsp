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
    background: #000;
    color: #fff;
    font-size: 18px;
    border-radius: 20px;

}


.loginbox button:hover
{

 cursor: pointer;
    background: #F44336;
    color: #000;

}
</style>



</head>
<body>
     <button> <B><a href="adfeat1.html">BACK</B> </a></button>


<div class="simple-form">
      <form id="registration" action="del_supplier.jsp" method="post">
    
                 </b></label>
         <input type="text" name="sup_id" id="button" placeholder="Enter The SUPPLIER ID to remove" required><br><br>
                <input type="submit" name="submit" value="delete" id="butt"/>&nbsp;&nbsp;
                     <button> <B><a href="view_supplier.jsp">CHECK</B> </a></button>
                
   
<%
String vnum = request.getParameter("sup_id");

if(vnum!=null){
	
if(vnum!=""){





try{

	
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Dairymanagement","root","root");
	
    String query="select * from supp  where sup_id=?" ;
    
    
    
	PreparedStatement ps=con.prepareStatement(query);
	
	ps.setString(1,vnum);
   
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
	
	//out.println(n);
	         String q="delete  from  supp   where sup_id=? " ;
	        
	     	 PreparedStatement statement=con.prepareStatement(q);
	     
	     	statement.setString(1,vnum);
	     	
	     	
	     	
             int i=statement.executeUpdate();
             
             if(i>0 ){
            	 out.println("<script>alert('deleted sucessfully');window.location='del_supplier.jsp';</script>");
             }
	}
	else
	{
   	 out.println("<script>alert('NOT RECORDS FOUND TO DELETE');window.location='del_supplier.jsp';</script>");

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
  
</div>

</body>
</html>