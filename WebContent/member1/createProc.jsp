<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member1/ssi.jsp"%>
<jsp:useBean id="dto" class="member1.Member1DTO" />
<%
	UploadSave upload = (UploadSave) request.getAttribute("upload");

	dto.setId(upload.getParameter("id"));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setTel(upload.getParameter("tel"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setEmail(upload.getParameter("email"));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));

	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String filename = "member.jpg";
	if (size > 0) {
		filename = UploadSave.saveFile(fileItem, upDir);

	}
	dto.setFname(filename);

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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">★SK 회원가입★</DIV>
	<div class="content">
		<%
			if (flag) {
				out.print("회원가입 축하드립니다.");
			} else {
				out.print("회원가입에 실패하셨습니다.");
			}
		%>


	</div>

	<DIV class='bottom'>


		<input type='button' value='로그인' class="btn btn-warning"
			onclick="location.href='./loginForm.jsp'"> 
			<input type='button' value='다시시도' class="btn btn-warning" onclick="history.back()">
			 <input type='button' value='홈' class="btn btn-warning" onclick="location.href='../index.jsp'">
	</DIV>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
