<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>
<%
String id = request.getParameter("id");
String oldfile = request.getParameter("oldfile");

boolean flag = dao.delete(id);
if(flag){
	if(oldfile!=null && !oldfile.equals("main.png")){
		UploadSave.deleteFile(upDir, oldfile);
	}
	session.invalidate();
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
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원탈퇴</DIV>
 
<div class="content">
<% 
if(flag){
out.print("탈퇴가되었습니다. 다음에 또 이용해주시기 바랍니다.");

}else{
out.print("탈퇴가 실패되었습니다.");
}
%>
</div>
 
  
  <DIV class='bottom'>
    <input type='submit' value='다시시도' class="btn btn-success" onclick="history.back()">
    <input type='button' value='홈' class="btn btn-success" onclick="location.href='../index.jsp'">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
