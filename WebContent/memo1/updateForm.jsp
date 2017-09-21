<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*" %>
<%  request.setCharacterEncoding("utf-8"); 
	int memono = Integer.parseInt(request.getParameter("memono"));
	
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
 	String user = "soldesk";
 	String password = "1234";
 	String driver = "oracle.jdbc.driver.OracleDriver";

 	Class.forName(driver);

 	Connection con = DriverManager.getConnection(url, user, password);
 	
 	StringBuffer sql = new StringBuffer();
 	
 	
 	sql.append(" select memono,title,content ");
	sql.append(" from memo1 where memono = ? ");
	
	PreparedStatement pstmt = con.prepareStatement(sql.toString());
	pstmt.setInt(1, memono);
	
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		
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
  font-size: 21px; 
}
div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
} 
table {
	width : 50%;
	margin : 0 auto;
}
table,th,td {
	border: 2px solid black;
	border-collapse: collapse;
	border-radius: 3px;
}
.first {
	font-weight: bold;
	font-size: 30px;
}
fieldset,legend {
	border : none;
}
input[type="text"],textarea {
	margin-left: 10px;
	margin-top: 2px;
}
</style> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class="first">[ 메 모 수 정  ]</div>
<form action="./updateProc.jsp" method="post" name="frm">
<input type="hidden" name="memono" value="<%=memono%>">
	<fieldset>
		<legend></legend>
		<table>
		<tr>
			<th>제 목</th>
			<td> <input type="text" name="title" size="30" value="<%=rs.getString("title")%>"> </td>
		</tr>
		<tr>
			<th>내 용</th>
			<td>
				<textarea rows="10" cols="29" name="content"><%=rs.getString("content")%> </textarea>
			</td>
		</tr>
		</table>
	<div>
		<input type="submit" value="저장" class="btn btn-info">
	</div>
	</fieldset>
</form>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body> 
</html>
<%
	}
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