<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image1/ssi.jsp" %>
<jsp:useBean id="dto" class="image1.Image1DTO"/>
<%
UploadSave upload=new UploadSave(request,-1,-1,tempDir);
dto.setName(UploadSave.encode(upload.getParameter("name")));
dto.setPasswd(upload.getParameter("passwd"));
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setImageno(Integer.parseInt(upload.getParameter("imageno")));
dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));
dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
FileItem fileItem=upload.getFileItem("fname");
int size=(int)fileItem.getSize();
if(size>0){
	dto.setFname(UploadSave.saveFile(fileItem,upDir));
}else{
	dto.setFname("main.png");
}
	Map map = new HashMap();
	map.put("grpno",dto.getGrpno());
	map.put("ansnum",dto.getAnsnum());
	dao.upAnsum(map);	
	boolean flag = dao.replyCreate(dto);
	if(flag)
		flag=dao.replyUpdate(dto);
	
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
 
<DIV class="title">이미지 답글 처리</DIV>
 
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
    <input type='button' value='계속등록'class="btn btn-danger" onclick="location.href='./replyForm.jsp'">
    <input type='button' value=목록'class="btn btn-danger" onclick="blist()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
 
 