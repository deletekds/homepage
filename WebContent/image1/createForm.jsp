<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>사진 게시판</title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
th{
text-align: center;

}
.title{
text-align: center;
}
</style> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진 등록</DIV>
 
<FORM name='frm' method='POST' action='./createProc.jsp'
enctype="multipart/form-data"
onsubmit="return inCheck(this)"
>
  <TABLE>
    <TR>
      <TH style="width: 106px">사진 등록</TH>
      <TD style="width: 400px; height:22px;"><input type="file" name="fname" accept=".jpg,.png,.gif"></TD>
    </TR>
     <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title"></TD>
    </TR>
     <TR>
      <TH>성명</TH>
      <TD><input type="text" name="name"></TD>
    </TR>
     <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD><textarea row="10" cols="29" name="content"></textarea></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록' class="btn btn-danger">
    <input type='reset' value='리셋' class="btn btn-danger">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
