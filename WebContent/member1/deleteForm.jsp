<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>
<%
String id = request.getParameter("id");
if(id==null)id=(String)session.getAttribute("id");
String oldfile = request.getParameter("oldfile");
if(oldfile==null){
	oldfile = dao.getFname(id);
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
 
<DIV class="title">회원삭제</DIV>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="oldfile" value="<%=oldfile%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
  <div class="content">
  회원탈퇴시 더이상 받은 정보를 받을 수 없습니다.<br>
  그래도 하시겠습니까??
  </div>

  
  <DIV class='bottom'>
    <input type='submit' value='탈퇴' class="btn btn-success">
    <input type='button' value='취소' class="btn btn-success" onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
