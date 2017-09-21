<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs1/ssi.jsp"   %> 
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dao.upViewcnt(bbsno);
	Bbs1DTO dto= dao.read(bbsno);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function blist(){
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href= url;
}
function bupdate(){
	var url = "./updateForm.jsp";
	url += "?bbsno=<%=bbsno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href =url;
}
function bdelete(){
	var url = "./deleteForm.jsp";
	url += "?bbsno=<%=bbsno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href = url;
}
function breply(){
	var url = "./replyForm.jsp";
	url += "?bbsno=<%=bbsno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> [게시판 조회] </DIV>
 

  <TABLE>
    <TR>
      <TH>제 목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>작성자</TH> 
      <TD><%=dto.getWname() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="45" ><%=dto.getContent() %></textarea></TD>
    </TR>
    <TR>
      <TH>등록날짜</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
    <TR>
      <TH>조회수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록' class="btn btn-warning" onclick="location.href='./createForm.jsp'">
    <input type='button' value='목록'class="btn btn-warning" onclick="blist()">
    <input type='button' value='수정'class="btn btn-warning" onclick="bupdate()">
    <input type='button' value='삭제' class="btn btn-warning" onclick="bdelete()">
    <input type='button' value='답변' class="btn btn-warning" onclick="breply()">
  
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
