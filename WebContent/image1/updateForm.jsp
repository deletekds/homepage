<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image1/ssi.jsp" %>
<%
	int imageno = Integer.parseInt(request.getParameter("imageno"));
	Image1DTO dto = dao.read(imageno);
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
  color:red;
} 
</style> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">

function inputCheck(f){
	if(f.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		return false;
	}
}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">정 보 수 정</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./updateProc.jsp'
	  onsubmit="return inputCheck(this)">
<input type="hidden" name="imageno" value="<%=dto.getImageno() %>">
  <TABLE>
    <TR>
      <td colspan='3'>
      	<img src="./storage/<%=dto.getFname()%>">
      </td>
    </TR>
    <TR>
      <TH>번호</TH>
      <TD>
		<%=dto.getImageno() %>
      </TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD>
      	<input type="text" name="name" value="<%=dto.getName() %>">
      </TD>
    </TR>
     <TR>
      <TH>제목</TH>
      <TD>
      	<input type="text" name="title" value="<%=dto.getTitle() %>"> 
      </TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD>
      	<input type="text" name="content" value="<%=dto.getContent() %>"> 
      </TD>
    </TR>
     <TR>
      <TH>비밀번호</TH>
      <TD>
      	<input type="password" name="passwd" value="<%=dto.getPasswd() %>"> 
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='회원수정' class="btn btn-success">
    <input type='button' value='취소'  class="btn btn-success" onclick="history.back()">
  </DIV>
  
</FORM>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 