<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs1/ssi.jsp"   %> 
<jsp:useBean id="dto" class="bbs1.Bbs1DTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	Map map = new HashMap();
	map.put("grpno",dto.getGrpno());
	map.put("ansnum",dto.getAnsnum());
	
	dao.upAnsnum(map);	
	boolean flag = dao.replyCreate(dto);
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

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> [ 테이블 답글등록 처리결과 ] </DIV>

<div class="content">
	<%
		if(flag){
			out.print("답글이 등록되었습니다.");
		}else {
			out.print("답글등록이 실패했습니다.");
		}
	%>

</div>

  <DIV class='bottom'>
    <input type='button' value='계속등록'class="btn btn-link" onclick="location.href='./createForm.jsp'">
    <input type='button' value='목록' class="btn btn-link" onclick="blist()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
