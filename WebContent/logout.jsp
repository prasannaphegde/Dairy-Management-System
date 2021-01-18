<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>log out</title>
</head>
<script type="text/javascript">
history.pushState(null,null,location.href);
window.onpopstate = function () {
	history.go(1);
}
</script>
<body>
            <%
 
     String username=(String)session.getAttribute("username");
   if(username!=null)
        {
         out.println(username+" logged out, <a href=\"index.html\">Back</a>");
            session.removeAttribute("username");
             
      }
     else
         {
        out.println("Now you are LOGGED OUT!!! <a href=\"index.html\">Back</a>");
     }
 
 
 
%>
            
</body>
</html>


