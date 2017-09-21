<%@ page contentType="text/html; charset=UTF-8" %> 
<%
String id= (String)session.getAttribute("id");
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
background-color:red;
  font-family: gulim; 
  font-size: 40px; 
  
} 
.title
{
color:white;
font-size: 90px;
text-align: center;
}
.content {


text-align: center;
}
</style> 
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">zzzzz인천 Sk Wyverns</DIV>
<div class="content">

<br>
<img width="100%" height="500px" src="images/sk1.jpg">
<%if(id==null){ %>
<button type="button"  onclick="location.href='member1/loginForm.jsp'">LOGIN</button>
<%}else{ %>
<button type="button" onclick="location.href='member1/logout.jsp'">LOGOUT</button>
<%} %>
<button type="button" onclick="location.href='member1/agreement.jsp'">Sk Wyverns JOINING</button>
</div> 

  

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
