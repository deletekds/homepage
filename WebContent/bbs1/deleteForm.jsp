<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs1/ssi.jsp" %>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	boolean flag = dao.getRefnum(bbsno);
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
<script type="text/javascript">
function inCheck(f){
	if(f.passwd.value ==""){
		alert("비밀번호를 입력해주세요.");
		f.passwd.focus();
		return false;
	}
}
function blist(){
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href= url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV class="title"> [ 테이블 삭제 ] </DIV>
 
  <%
 	if(flag){
 %>
 <div class="content">답글이 존재하므로 삭제할 수 없습니다. </div>
 <DIV class='bottom'>
    <input type='button' value='목록' onclick="location.href='./list.jsp'">
    <input type='button' value='뒤로가기' onclick="history.back()">
  </DIV>
 <% }else{ %>
<FORM name='frm' method='POST' action='./deleteProc.jsp' onsubmit="return inCheck(this)">
<input type="hidden" name="bbsno" value="<%=bbsno %>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<h1 style="text-align: center">※ 삭제하면 복구할 수 없습니다.</h1><br>
  <TABLE>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" ></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='확인'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 <% } %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
