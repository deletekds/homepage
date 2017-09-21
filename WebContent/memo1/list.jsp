<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String user = "soldesk";
	String password = "1234";
	String driver ="oracle.jdbc.driver.OracleDriver";
	
	Class.forName(driver);
	
	Connection con = DriverManager.getConnection(url,user,password);
	StringBuffer sql = new StringBuffer();
	sql.append(" select memono,title, to_char(wdate,'yyyy-mm-dd') wdate,viewcnt ");
	sql.append(" from memo1 order by memono desc ");
	
	PreparedStatement pstmt = con.prepareStatement(sql.toString());
	
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 22px; 
} 
div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	font-weight: bold;
	font-size: 30px;
}
table {
	width : 60%;
	margin : 0 auto;
}
table,th,td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
 th,td {
	padding : 5px;
} 
a:LINK {
	color: #000000;
	text-decoration: none;
}
a:VISITED {
	color: #000000;
	text-decoration: none;
}
a:HOVER {
	color: red;
	text-decoration: none;
}
a:ACTIVE {
	color: #000000;
	text-decoration: none;
}
</style> 
<script type="text/javascript">
	function read(memono){
		var url = "./read.jsp";
		url += "?memono="+memono;
		//alert("url : "+url);
		location.href = url;
	}
</script>
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div>[ 메 모 목 록  ]</div>
<hr>
<table>
	<tr>
		<th>번 호</th>
		<th>제 목</th>
		<th>날 짜</th>
		<th>조회수</th>
	</tr>
	<%if(rs.next() == false){ %>
	
	<tr>
		<td colspan="4"> 등록된 메모가 없습니다.</td>
	</tr>
	<%}else{
		do{
	%>
	<tr>
		<td><%=rs.getInt("memono") %></td>
		<td>
		<a href="javascript:read('<%=rs.getInt("memono") %>')"><%=rs.getString("title") %> </a>	
		</td>
		<td><%=rs.getString("wdate") %></td>
		<td><%=rs.getString("viewcnt") %></td>
	</tr>
	<% }while(rs.next());
		} %>
</table>
<div>
	<input type="button" value="등록" class="btn btn-primary" onclick="location.href='./createForm.jsp'">
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html>
<%
	if(rs != null){
		rs.close();
	}
	if(pstmt != null){
		pstmt.close();
	}
	if(con != null){
		con.close();
	}
%>