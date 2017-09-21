<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>
<%
  UploadSave upload = new UploadSave(request,-1,-1,tempDir);
String id = upload.getParameter("id");
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

FileItem fileItem = upload.getFileItem("fname");
int size =(int)fileItem.getSize();
String filename = null;
if(size>0){
	if(oldfile!=null && !oldfile.equals("main.png"))
	UploadSave.deleteFile(upDir, oldfile);
	filename = UploadSave.saveFile(fileItem, upDir);
}
Map map = new HashMap();
map.put("id", id);
map.put("fname", filename);
boolean flag = dao.updateFile(map);

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(id) {
	var url = "read.jsp?id=<%=id%>";
	
	location.href=url;
}

</script>
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
 
<DIV class="title">사진변경</DIV>
 

<div class="content">
<%if(flag){ 
	out.print("사진을 변경했습니다.");
} else {
	out.print("사진변경이 실패함");



 } %>
</div>
  <DIV class='bottom'>
  <%if(flag){ %>
    <input type='button' value='나의정보'class="btn btn-primary" onclick="read()">
    <%}else{ %>
    <input type='button' value='다시시도'class="btn btn-primary" onclick="history.back()">
    <%} %>
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
