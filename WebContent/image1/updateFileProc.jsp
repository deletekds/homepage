<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/image1/ssi.jsp"%>
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	int imageno = Integer.parseInt(upload.getParameter("imageno"));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
    String col=UploadSave.encode(upload.getParameter("col"));
    String word=UploadSave.encode(upload.getParameter("word"));
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = null;
	if (size > 0) {
		if (oldfile != null && !oldfile.equals("main.png"))
			UploadSave.deleteFile(upDir, oldfile);

		fname = UploadSave.saveFile(fileItem, upDir);
	}

	Map map = new HashMap();
	map.put("imageno", imageno);
	map.put("fname", fname);

	boolean flag = dao.updateFile(map);
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
<script type="text/javascript">
function tlist(){
	var url = "./list.jsp";

	location.href = url;
	}
function update(){
	var url = "./updateFileForm.jsp?imageno=<%=imageno%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&oldfile=<%=fname%>";
	location.href = url;
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">사진 변경</DIV>
	<div class="content">
		<%
			if (flag) {
				out.print("사진을 변경했습니다.");
			} else {
				out.print("사진변경을 실패했습니다.");
			}
		%>
	</div>
	<DIV class='bottom'>
		<input type='submit' value='다시시도' class="btn btn-primary" onclick="update()"> <input
			type='button' value='목록' class="btn btn-primary" onclick="tlist()">
	</DIV>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
