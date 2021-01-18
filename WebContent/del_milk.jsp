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
      background:#556B2F;
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
  color:#F44336;
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
      <form id="registration" action="del_milk.jsp" method="post">
    
                  <label><b>SAMPLE ID:&nbsp;
                 </b></label>
         <input type="text" name="samp_id" id="button" placeholder="Enter The SAMPLE ID" required><br><br>
                <input type="submit" name="submit" value="delete" id="butt"/>&nbsp;&nbsp;
                                     <button> <B><a href="view_milk.jsp">CHECK</B> </a></button>

<%	

String vnum = request.getParameter("samp_id");

if(vnum!=null){
	
if(vnum!=""){



try{

	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Dairymanagement","root","root");
	
    String query="select * from milk  where samp_id=?" ;
    
    
    
	PreparedStatement ps=con.prepareStatement(query);
	
	ps.setString(1,vnum);
   
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
	
	//out.println(n);
	         String q="delete  from  milk   where samp_id=? " ;
	        
	     	 PreparedStatement statement=con.prepareStatement(q);
	     
	     	statement.setString(1,vnum);
	     	
	     	
	     	
             int i=statement.executeUpdate();
             
             if(i>0 ){
            	 out.println("<script>alert('deleted sucessfully');window.location='del_milk.jsp';</script>");
             }
	}
	else
	{
   	 out.println("<script>alert('NOT RECORDS FOUND TO DELETE');window.location='del_milk.jsp';</script>");

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
</center>

</body>
</html>