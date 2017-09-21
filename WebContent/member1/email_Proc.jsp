<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>
<%
String email = request.getParameter("email");
boolean flag  = dao.duplicateEmail(email);


%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style>
<script type="text/javascript">
function use(){
	opener.frm.email.value='<%=email%>'
	window.close();
	
}


</script>

 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">EMAIL 중복확인</DIV>
 
<div class="content">
입력된 EMAIL:<%=email %><br><br>
<%
if(flag){
	out.print("중복되서 사용 할수 없습니다.<br><br>");
}else{
	out.print("사용가능합니다 <br><br>");
	out.print("<button type='button' onclick='use()'>사용</button>");
}


%>

</div>

  
   <DIV class='bottom'>
    <input type='button' value='다시시도'class="btn btn-success" onclick="location.href='email_Form.jsp'">
    <input type='button' value='닫기'class="btn btn-success" onclick="window.close()">
  </DIV>

 
 
 

</body>
<!-- *********************************************** -->
</html> 
