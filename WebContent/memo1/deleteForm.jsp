<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %> 

<%
	int memono = Integer.parseInt(request.getParameter("memono"));
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
div {
	text-align: center;
	margin-top: 100px;
	font-weight: bold;
}
</style> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div>[ 삭 제 확 인  ]</div>
<hr>
<form action="./deleteProc.jsp" method="post">
	<input type="hidden" name="memono" value="<%=memono%>">
	<div>
		삭제를 하면 복구할 수 없습니다.<br><br>
		삭제를 하시려면 삭제 버튼을 눌러주세요.<br><br>
		취소는 '목록'버튼을 눌러주세요.<br><br>
		<button type="button" class="btn btn-danger" onclick="location.href='./list.jsp'">목록</button>
		<button type="submit" class="btn btn-danger">삭제</button>
	</div>
</form>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html>
 