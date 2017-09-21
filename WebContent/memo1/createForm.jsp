<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

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
<div class="first">[ 메 모 작 성  ]</div>
<form action="./createProc.jsp" method="post" name="frm">
	<fieldset>
		<legend></legend>
		<table>
		<tr>
			<th>제 목</th>
			<td> <input type="text" name="title" size="30" value="메모"> </td>
		</tr>
		<tr>
			<th>내 용</th>
			<td>
				<textarea rows="10" cols="29" name="content"></textarea>
			</td>
		</tr>
		</table>
	<div>
		<input type="submit" value="저장"  class="btn btn-info">
	</div>
	</fieldset>
</form>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body> 
</html>
