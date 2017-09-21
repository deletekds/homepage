<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs1/ssi.jsp"   %> 
<jsp:useBean id="dto" class="bbs1.Bbs1DTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	boolean flag = dao.create(dto);
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
	
	location.href= url;
}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> [ 테이블 등록 처리결과 ] </DIV>

<div class="content">
	<%
		if(flag){
			out.print("글이 등록되었습니다.");
		}else {
			out.print("글등록이 실패했습니다.");
		}
	%>

</div>

  <DIV class='bottom'>
    <input type='button' value='계속등록'class="btn btn-success" onclick="location.href='./createForm.jsp'">
    <input type='button' value='목록' class="btn btn-success" onclick="blist()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
