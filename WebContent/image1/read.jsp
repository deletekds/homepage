<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/image1/ssi.jsp"%>
<%
	int imageno = Integer.parseInt(request.getParameter("imageno"));
	Image1DTO dto = dao.read(imageno);
	List<Integer> imglist= dao.imgList();
 
 
%>
<%!   
	int mid,count;
	
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
.go{
border-style:solid;
border-color:#0033CC;
border-width:10px;
 
}
 
</style>
<script type="text/javascript">
function read(imageno){
	var url="read.jsp?imageno="+imageno;
	location.href=url;
	
}
function updateForm(){
	var url="./updateForm.jsp";
	url+="?imageno=<%=imageno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;	
}
 
function updateFileForm(){
	var url="./updateFileForm.jsp";
	url+="?imageno=<%=imageno%>";
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;	
}
function deleteForm(){
	var url="./deleteForm.jsp";
    url+="?imageno=<%=imageno%>";
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;	
}
function replyForm(){
	var url="./replyForm.jsp";
	url+="?imageno=<%=imageno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;	
}
 
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
 
	<DIV class="title"><%=dto.getName()%>의 이미지 정보
	</DIV>
 
 
	<TABLE>
		<TR>
			<Td colspan="2"><img src="./storage/<%=dto.getFname()%>"
				width="400"></Td>
		</TR>
		<TR>
			<Th>성명</Th>
			<TD><%=dto.getName()%></TD>
		</TR>
		<TR>
			<Th>제목</Th>
			<TD><%=dto.getTitle()%></TD>
		</TR>
		<TR>
			<Th>내용</Th>
			<TD><%=dto.getContent()%></TD>
		</TR>
		<TR>
			<Th>등록날짜</Th>
			<TD><%=dto.getMdate()%></TD>
		</TR>
	    </TABLE>
	    	    <br>
	    <TABLE>
	    <tr>
	    
	   	<% for(int i=0;i<imglist.size();i++){
		if(imglist.get(i)==dto.getImageno())
		mid=i;
		count=mid-2;
	   	}
	   	
	   	
		for(int i=0;i<5;i++){
			Image1DTO check=new Image1DTO();
			if(count>=0 && count<imglist.size())
			check=dao.read(imglist.get(count));
			else if(count<0 )
				check.setImageno(0);
			
			if(check.getImageno()!=0 && count!=mid){
			%>
	<Td><a href="javascript:read('<%=check.getImageno() %>')">
	<img src="./storage/<%=check.getFname()%>" width="100" height="100"></a></Td>
	
			<% }
			else if(count==mid){
			%>
		
		<Td class="go"><a href="javascript:read('<%=dto.getImageno() %>')">
		<img src="./storage/<%=dto.getFname()%>" width="100" height="100"></a></Td>
			<% }
			 if(check.getImageno()==0){
			 %>
			<Td ><img src="./storage/main.png" width="100" height="100"></Td>
 
		<%}count++; 
		}%>
		</tr>
	</TABLE>
	
	
	
	
 
	<DIV class='bottom'>
		<input type='button' value='정보수정' class="btn btn-info" 	onclick="updateForm()">
		<input type='button' value='사진수정' class="btn btn-info" onclick="updateFileForm()">
		<input	type='button' value='사진삭제' class="btn btn-info" onclick="deleteForm()"> 
		<input	type='button' value='답변' class="btn btn-info"	 onclick="replyForm()">
	</DIV>
 
 
 
	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>