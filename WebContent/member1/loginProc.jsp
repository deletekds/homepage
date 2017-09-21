<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

Map map = new HashMap();
map.put("id",id);
map.put("passwd",passwd);

boolean flag = dao.loginCheck(map);


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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">LOGIN</DIV>
 
<div class="content">
<%
if(flag){
	out.print("로그인 되셨습니다.");
}else{
	out.print("로그인이 실패되었습니다.");
}


%>



</div>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도'class="btn btn-danger" onclick="history.back()">
    <input type='button' value='홈'class="btn btn-danger" onclick="location.href='./home.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
