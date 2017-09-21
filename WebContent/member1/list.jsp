<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member1/ssi.jsp" %>
<%
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));
if(col.equals("total"))
word="";

int nowPage= 1;
int recordPerPage =3;
if(request.getParameter("nowPage") !=null){
	nowPage= Integer.parseInt(request.getParameter("nowPage"));
}
int sno = ((nowPage -1) * recordPerPage) + 1;
int eno = nowPage * recordPerPage;
Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

int total = dao.total(map);
List<Member1DTO> list = dao.list(map);

String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function read(id) {
	var url = "<%=root%>/member1/read.jsp?id=" +id;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}


</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원 목록</DIV>
<div class="search"> 
<FORM name='frm' method='POST' action='./list.jsp'>
<select name="col">
<option value="id" <%if(col.equals("id")) out.print("selected='selected'"); %>>ID</option>
<option value="mname" <%if(col.equals("mname")) out.print("selected='selected'"); %>>성명</option>
<option value="email" <%if(col.equals("email")) out.print("selected='selected'"); %>>EMAIL</option>
<option value="total" <%if(col.equals("total")) out.print("selected='selected'"); %>>전체</option>


</select>
<input type="text" name="word" value="<%=word %>">
<button class="btn btn-info">검색</button>
<button type="button" class="btn btn-info"
 onclick="location.href='<%=root%>/member1/agreement.jsp'">회원가입</button>
</FORM>
</div>
  <TABLE width = "800px">
  <%
  for(int i = 0;i<list.size();i++){
	  Member1DTO dto = list.get(i);
  
  
  %>
    <TR>
    <td rowspan="5" width="30%">
    <img src="<%=root %>/member1/storage/<%=dto.getFname()%>" width="100%">
    </td>
      <TH width="20%">ID</TH>
      <TD width="50%">
      <a href = "javascript:read('<%=dto.getId() %>')"><%=dto.getId() %></a>
      </TD>
    </TR>
    <TR>
			<TH>성명</TH>
			<TD><%=dto.getMname()%></TD>
		</TR>
		<TR>
			<TH>EMAIL</TH>
			<TD><%=dto.getEmail()%></TD>
		</TR>
		
  <%} %>
  </TABLE>
  <DIV class='bottom'>
    <%=paging %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
