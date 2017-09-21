<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String user = "soldesk";
	String password ="1234";
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	Class.forName(driver);
	
	Connection con = DriverManager.getConnection(url,user,password);
	
	StringBuffer sql = new StringBuffer();
	sql.append(" delete from memo1 where memono = ? ");
	
	PreparedStatement pstmt = con.prepareStatement(sql.toString());
	pstmt.setInt(1, memono);
	
	int cnt = pstmt.executeUpdate();
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
}
</style> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div>
	<%
		if(cnt>0){
			out.print("메모삭제에 성공했습니다.");
		}else {
			out.print("메모삭제에 실패했습니다.");
		}
	%>
	<br><br>
	<input type="button" value="계속 등록" class="btn btn-link" onclick="location.href='./createForm.jsp'">
	<input type="button" value="목록" class="btn btn-link" onclick="location.href='./list.jsp'">
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html>
<%
	if(pstmt != null){
		pstmt.close();
	}
	if(con != null){
		con.close();
	}
%>