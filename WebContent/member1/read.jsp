<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>
<%
String id = request.getParameter("id");
if(id==null)id=(String)session.getAttribute("id");

Member1DTO dto = dao.read(id);
String nowPage = request.getParameter("nowPage");
String col = request.getParameter("col");
String word = request.getParameter("word");



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
<script type="text/javascript">
function updateFile(){
	
	var url ="updateFileForm.jsp";
	url +="?id=<%=id%>";
	url +="&oldfile=<%=dto.getFname()%>";
	url +="&col=<%=col%>";
	url +="&word=<%=word%>";
	url +="&nowPage=<%=nowPage%>";
	
	location.href=url;
	
}
function updatePw(){
	var url ="updatepwForm.jsp";
	
	url +="?id=<%=id%>";
	url +="&col=<%=col%>";
	url +="&word=<%=word%>";
	url +="&nowPage=<%=nowPage%>";
	
	
	location.href=url;
	
}
function update(){
	var url ="updateForm.jsp";
	
	url +="?id=<%=id%>";
	url +="&col=<%=col%>";
	url +="&word=<%=word%>";
	url +="&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function del(){
	var url ="deleteForm.jsp";
	
	url +="?id=<%=id%>";
	url +="&oldfile=<%=dto.getFname()%>";
	url +="&col=<%=col%>";
	url +="&word=<%=word%>";
	url +="&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function downM(){
	var url ="<%=root%>/download";
	url +="dir=/member1/stroage";
	url +="&filename=<%=dto.getFname()%>";
	
	location.href=url;
	
	
}

</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"><%=dto.getMname() %>의 회원정보</DIV>
 

  <TABLE>
    <TR>
      <TD colspan="2">
      <img src="./storage/<%=dto.getFname()%>">
      </TD>
    </TR>
<tr>
<th>ID</th>
<td><%=dto.getId() %></td>
</tr>  
<tr>
<th>성명</th>
<td><%=dto.getMname() %></td>
</tr>     
<tr>
<th>전화번호</th>
<td><%=Utility.checkNull(dto.getTel())%></td>
</tr> 
<tr>
<th>EMAIL</th>
<td><%=dto.getEmail()%></td>
</tr> 
<tr>
<th>우편번호</th>
<td><%=Utility.checkNull(dto.getZipcode())%></td>
</tr> 
<tr>
<th>주소</th>
<td><%=Utility.checkNull(dto.getAddress1())%><br>
<%=Utility.checkNull(dto.getAddress2())%>
</td>
</tr> 

  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='정보수정'class="btn btn-warning" onclick="update()">
    <input type='button' value='패스워드변경'class="btn btn-warning" onclick="updatePw()">
        <input type='button' value='사진수정'class="btn btn-warning" onclick="updateFile()">
        <input type='button' value='회원삭제'class="btn btn-warning" onclick="del()">
        <input type='button' value='다운로드'class="btn btn-warning" onclick="downM()">
        
    
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
