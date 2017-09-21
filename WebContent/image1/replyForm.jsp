<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image1/ssi.jsp" %>


<%
  int imageno = Integer.parseInt(request.getParameter("imageno"));
   Image1DTO dto = dao.replyRead(imageno);
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
function inCheck(f){
	if(f.name.value == ""){
		alert("이름을 입력해주세요.");
		f.name.focus();
		return false;
	}else if(f.title.value == ""){
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;

	}else if(f.passwd.value ==""){
		alert("비밀번호를 입력해주세요.");
		f.passwd.focus();
		return false;
	}else if(f.content.value ==""){
		alert("내용을 입력해주세요.");
		f.content.focus();
		return false;
	}
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진 답글</DIV>
 
<FORM name='frm' method='POST' action='./replyProc.jsp'
enctype="multipart/form-data"
onsubmit="return inCheck(this)">
<input type="hidden" name="imageno" value="<%=imageno%>">
<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
  <TABLE>
    <TR>
      <TH>이름</TH> 
      <TD>
          <input type="text" name="name">
      </TD>
    </TR>
    <TR>
    <TH>제목</TH>
     <TD>
     <input type="text" name="title">
     </TD>
      </TR>
       <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="10" cols="29" name="content"></textarea>
      </TD>
      </TR>
     <TR>
    <TH>이미지</TH>
     <TD>
     <input type="file" name="fname">
     </TD>
      </TR>
      <TR>
    <TH>비밀번호</TH>
     <TD>
     <input type="password" name="passwd">
     </TD>
      </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='답글등록' class="btn btn-warning">
    <input type='button' value='취소'  class="btn btn-warning" onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 