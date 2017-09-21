<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>
<jsp:useBean id="dto" class="member1.Member1DTO"/>
<jsp:setProperty property="*" name="dto">
<%
boolean flag = dao.update(dto);
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
function read(){
	var url="read.jsp?id=<%=dto.getId()%>";
	
	location.href=url;
	
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원정보수정</DIV>
 

 
  <div class="content">
 <%
 if(flag){
	 out.print("정보를 수정했습니다.");
 }else{
	 out.print("정보수정이 실패했습니다.");
 }
 
 
 %>
 
 
 </div>
  <DIV class='bottom'>
    <input type='submit' value='정보확인'class="btn btn-primary" onclick="read()">
    <input type='button' value='다시시도'class="btn btn-primary" onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
