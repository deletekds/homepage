<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image1/ssi.jsp" %>
<%
int imageno = Integer.parseInt(request.getParameter("imageno"));
String passwd = request.getParameter("passwd");
String oldfile = request.getParameter("oldfile");
Map map = new HashMap();
map.put("imageno",imageno);
map.put("passwd",passwd);

boolean pflag = dao.passwdCheck(map);

boolean flag = false;
if(pflag){
	flag = dao.delete(imageno);
}
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
	
	location.href=url;
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">처리결과</DIV>
<div class="content">
<%
if(!pflag){
	out.print("비밀번호가 불일치 합니다.");
}else if(flag){
	if(oldfile!=null && !oldfile.equals("main.png")){
		UploadSave.deleteFile(upDir, oldfile);
	}
	out.print("글삭제 되었습니다.");
}else{
	out.print("글삭제 실패되었습니다.");
}


%>


</div> 


  
  <DIV class='bottom'>
  <%if(!pflag){ %>
    <input type='button' value='다시 시도' class="btn btn-success" onclick="history.back()">
    <%}else{ %>
    <input type='button' value='계속등록' class="btn btn-success" onclick="location.href='./createForm.jsp'">
    <%} %>
    <input type='button' value='목록' class="btn btn-success" onclick="blist()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
