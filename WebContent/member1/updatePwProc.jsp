<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
Map map = new HashMap();
map.put("id",id);
map.put("passwd",passwd);

boolean flag = dao.updatePw(map);



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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">패스워드 변경처리</DIV>
 

<div class="content">
<%
if(flag){
	out.print("패스워드 변경했습니다.<br>");
	out.print("로그인 하세요.<br>");
	
}else{
	out.print("변경 실패");
}


%>



</div>
 
  
  <DIV class='bottom'>
  <%if(flag) {%>
    <input type='button' value='로그인' class="btn btn-info">
    <% } else { %>
    <input type='button' value='홈'class="btn btn-info" onclick="location.href='../index.jsp'">
    
    <%} %>
    <input type='button' value='다시시도'class="btn btn-info" onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
