<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<% request.setCharacterEncoding("utf-8"); %> 
<%
 	int memono = Integer.parseInt(request.getParameter("memono"));
 	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
 	String user = "soldesk";
 	String password = "1234";
 	String driver = "oracle.jdbc.driver.OracleDriver";

 	Class.forName(driver);

 	Connection con = DriverManager.getConnection(url, user, password);
 	
 
 	StringBuffer sql = new StringBuffer();
 	sql.append(" update memo1 ");
 	sql.append(" set viewcnt = viewcnt + 1 ");
 	sql.append(" where memono = ? ");
 	
 	PreparedStatement pstmt = con.prepareStatement(sql.toString());
 	pstmt.setInt(1, memono);
 	pstmt.executeUpdate();
 	
 	
 	sql.delete(0, sql.length());
 	
 	sql.append(" select memono,title,content, ");
	sql.append(" to_char(wdate,'yyyy-mm-dd') wdate,viewcnt from memo1 where memono = ? ");
	
	pstmt = con.prepareStatement(sql.toString());
	pstmt.setInt(1, memono);
	
	ResultSet rs = pstmt.executeQuery();
	
	String content = null;
	if(rs.next()){
		content = rs.getString("content");
		content = content.replaceAll("\r\n", "<br>");
	}
			
			
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
div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	
} 
textarea {
	border : none;
	resize: none;
	text-transform: none;
	background-color: white;
}
</style> 
<script type="text/javascript">
function mupdate(memono){
	var url = "./updateForm.jsp";
	url += "?memono="+memono;
	location.href= url;
}
function mdelete(memono){
	var url ="./deleteForm.jsp";
	url += "?memono="+memono;
	location.href=url;
}
</script>
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div> 조 회 </div>
<table>
	<tr>
		<td> 제 목 </td>
		<td><%=rs.getString("title") %></td>	
	</tr>
	<tr>
		<td> 내 용 </td>
		
		<td> <textarea rows="10" cols="29" disabled="disabled" > <%=rs.getString("content") %> </textarea> </td>
	</tr>
	<tr>
		<td> 조회수 </td>
		<td><%=rs.getInt("viewcnt") %> </td>
	</tr>
	<tr>
		<td> 등록일 </td>
		<td><%=rs.getString("wdate") %> </td>
	</tr>
</table>
<div>
	<button type="button" class="btn btn-success" onclick="location.href='./createForm.jsp'">등록</button>
	<button type="button" class="btn btn-success" onclick="mupdate('<%=memono%>')">수정</button>
	<button type="button" class="btn btn-success" onclick="mdelete('<%=memono%>')">삭제</button>
	<button type="button" class="btn btn-success" onclick="location.href='./list.jsp'">목록</button>
	
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