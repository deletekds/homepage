<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs1/ssi.jsp" %> 
<%  

String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));
if (col.equals("total"))
	word = "";

int nowPage = 1;
int recordPerPage = 5;
if (request.getParameter("nowPage") != null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
int sno = ((nowPage - 1) * recordPerPage) + 1;
int eno = nowPage * recordPerPage;
Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);
int total = dao.total(map);
List<Bbs1DTO> list = dao.list(map);
String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<script type="text/javascript">
function read(bbsno){
var url = "read.jsp";
url += "?bbsno="+bbsno;
url += "&col=<%=col%>";
url += "&word=<%=word%>";
 
location.href=url;
}
</script>
<style type="text/css"> 
.search{
width:80%;
text-align:center;
margin:2px auto;
}
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
 <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="search">
<form method="post" action="./list.jsp">
<select name="col">
<option value="wname"
<%if(col.equals("wname")) out.print("selected='selected'");%>
>성명</option>
<option value="title"
<%if(col.equals("title")) out.print("selected='selected'");%>
>제목</option>
<option value="content"
<%if(col.equals("content")) out.print("selected='selected'");%>
>내용</option>
<option value="total">전체출력</option>
</select>
<input type="text" name="word" value="<%=word %>">
<button class="btn btn-info">검색</button>
<button type="button" class="btn btn-info"
 onclick="location.href='./createForm.jsp'">등록</button>
</form>
</DIV>
<div class="container">
<h2><span class="glyphicon glyphicon-pencil"></span>알림판</h2>
  <TABLE class="table table-bordered">
  <thead>
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>성명</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <TH>grpno</TH>
      <TH>indent</TH>
      <TH>ansnum</TH>
    </TR>
  </thead>
<% if(list.size()==0){ %>
   <tbody>
    <tr>
    <td colspan="8">등록된 글이 없습니다.</td>
    </tr>
    </tbody>   
<% }else{
for(int i=0;i<list.size();i++){
  Bbs1DTO dto = list.get(i);
%>    
  <tbody>
<tr>
<td><%=dto.getBbsno() %></td>
<td>
<%
for(int j=0;j<dto.getIndent();j++){
out.print("&nbsp;&nbsp;&nbsp;");
}
   if(dto.getIndent()>0){
    out.print("<img src='../images/re.jpg'>");
   }
%>
<a href="javascript:read('<%=dto.getBbsno() %>')">
<%=dto.getTitle() %></a>
<%if(Utility.compareDay(dto.getWdate().substring(0,10))){ %>
<img src="<%=root %>/images/new.gif">
<%} %>
</td>
<td><%=dto.getWname() %></td>
<td><%=dto.getViewcnt() %></td>
<td><%=dto.getWdate() %></td>
<td><%=dto.getGrpno() %></td>
<td><%=dto.getIndent() %></td>
<td><%=dto.getAnsnum() %></td>
</tr>
   </tbody>
<%
}
   }
%>   
  </TABLE>
 
  <DIV class='bottom'>
    <%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
  </DIV>
 
 </div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
