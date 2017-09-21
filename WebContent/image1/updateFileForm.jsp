<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>사진변경</title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function incheck(f) {
	if(f.fname.value == ""){
	alert("파일을 선택하세요");
	f.fname.focus();
	return false;
	}
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진 추가</DIV>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' 
enctype = "multipart/form-data" onsubmit= "return incheck(this)">
<input type ="hidden" name = "imageno" value = "<%=request.getParameter("imageno") %>">
<input type ="hidden" name = "oldfile" value = "<%=request.getParameter("oldfile") %>">
<input type ="hidden" name = "col" value = "<%=request.getParameter("col") %>">
<input type ="hidden" name = "word" value = "<%=request.getParameter("word") %>">
 <TABLE>
    <TR>
      <TH>원본파일</TH>
     <TD>
      	<img src = "./storage/<%=request.getParameter("oldfile") %>" width = "300px" height = "230px" ><br>
      	원본파일명 : <%=request.getParameter("oldfile") %>
      </TD>
    </TR>
    <tr>
    	<th>변경파일</th>
    	<td>
    		<input type = "file" name = "fname" accept = ".png, .gif, .jpg">
    	</td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경' class="btn btn-link">
    <input type='button' value='취소' class="btn btn-link" onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 