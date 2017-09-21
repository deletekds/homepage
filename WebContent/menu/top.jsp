<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String root = request.getContextPath();
    String id =(String)session.getAttribute("id");
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--   <meta charset="utf-8"> -->
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

</head>
<body>
	
	<div style="background-color: white">
		<table class="table">
			<tr>
				<td class="td"><img src="../menu/images/main.png"
					width='100%' height='100%'></td>
			</tr>

			 <tr>
    <td class="td">
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=root %>/member1/home.jsp">HOME</a>
    </div>
   <ul class="nav navbar-nav">
    
   <%if(id!=null){ %>
    <li><a href="<%=root %>/member1/deleteForm.jsp">회원탈퇴</a></li>  
    <li><a href="<%=root %>/member1/logout.jsp">로그아웃</a></li>  
   <%}%>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/bbs1/createForm.jsp">생성</a></li>
       <li><a href="<%=root %>/bbs1/list.jsp">목록</a></li>
      </ul>
     </li>
     <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">메모
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/memo1/createForm.jsp">생성</a></li>
       <li><a href="<%=root %>/memo1/list.jsp">목록</a></li>
      </ul>
     </li>
  
    
     <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">이미지
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/image1/createForm.jsp">생성</a></li>
       <li><a href="<%=root %>/image1/list.jsp">목록</a></li>
      </ul>
     </li>
    </ul>
    
    
    
    
    
       
    <ul class="nav navbar-nav navbar-right">
     <%if(id==null) {%>
      <li><a href="<%=root %>/member1/agreement.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="<%=root %>/member1/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
     <%}else{ %>
      <li><a href="<%=root %>/member1/read.jsp"><span class="glyphicon glyphicon-user"></span> My Info</a></li>
      <li><a href="<%=root %>/member1/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
     
     <%}%>  
   
    </ul>
    
   </div>
</nav>
  </td> 
 </tr>
 
</table>
</div>

<div style="width: 100%; padding-top: 10px;">