<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image1/ssi.jsp" %>
<%
int imageno = Integer.parseInt(request.getParameter("imageno"));
boolean flag = dao.getRefnum(imageno);

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
<script type="text/javascript">
function inputCheck(f){
	if(f.passwd.vlaue==""){
		alert("PASSWORD를 입력하세요");
		f.passwd.focus();
		return false;
		
	}
}
function blist(){
	var url ="./list.jsp";
	url +="?imageno=<%=imageno%>";
	url +="&col=<%=request.getParameter("col")%>";
	url +="&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">삭제파일</DIV>
<%
if(flag){
%>
<div class="content">답변글확인되서 삭제불가합니다.</div> 
<div class="bottom">
<input type="submit" value="목록" onclick="blist()">
<input type="button" value="뒤로가기" onclick="history.back()">

</div>
<%
}else{
%>
<FORM name='frm' method='POST' 
onsubmit="return inputCheck(this)"
action='./deleteProc.jsp'>
<input type="hidden" name="imageno" value="<%=imageno%>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
<div class="content">삭제시 복구불가</div>
  <TABLE>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='확인' class="btn btn-primary">
    <input type='button' value='취소' class="btn btn-primary" onclick="history.back()">
  </DIV>
</FORM>
 <%} %>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
