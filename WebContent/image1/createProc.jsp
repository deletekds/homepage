<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/image1/ssi.jsp"%>
<jsp:useBean id="dto" class="image1.Image1DTO" />
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(upload.getParameter("passwd"));
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = "main.png";
	if (size > 0) {
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFname(fname);

	boolean flag = dao.create(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="content">

		<%
			if (flag) {
				out.print("이미지 등록 했습니다.");
			} else {
				out.print("이미지 등록에 실패했습니다.");
			}
		%>



	</DIV>



	<DIV class='bottom'>
		<input type="button" value="계속 등록"  class="btn btn-link"
			onclick="location.href='./createForm.jsp'"> <input
			type="button" value="목록"  class="btn btn-link" onclick="location.href='./list.jsp'">
	</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
