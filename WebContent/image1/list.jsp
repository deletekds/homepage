<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/image1/ssi.jsp"%>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if (col.equals("total"))
		word = "";

	int nowPage = 1;
	int recordPerPage = 5;
	if (request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	int total = dao.total(map);
	List<Image1DTO> list = dao.list(map);
	String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
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
form{
text-align: center;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function read(imageno) {
		var url = "read.jsp?imageno=" + imageno;
		location.href = url;

	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">이미지목록</DIV>

	<FORM name='frm' method='POST' action='./list.jsp' ">
		<select name="col" >
			<option value="id"
				<%if (col.equals("id"))
				out.print("selected='selected'");%>>ID</option>
			<option value="name"
				<%if (col.equals("name"))
				out.print("selected='selected'");%>>성명</option>
			<option value="total"
				<%if (col.equals("total"))
				out.print("selected='selected'");%>>전체</option>

		</select> <input type="text" name="word" value="<%=word%>">
		<button class="btn btn-info">검색</button>
		<button type="button" class="btn btn-info"
		 onclick="location.href='./createFrom.jsp'">등록</button>
	</FORM>
	</div>
	<TABLE>
		<TR>
			<TH>이미지</TH>
			<TH>성명</TH>
			<TH>제목</TH>
			<TH>날짜</TH>
			<TH>사진 이름</TH>
			<TH>Grpno</TH>
			<TH>Indent</TH>
			<TH>Ansnum</TH>

		</TR>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="8">등록된 이미지가 없습니다</td>
		</tr>
		<%
			}
			for (int i = 0; i < list.size(); i++) {
				Image1DTO dto = list.get(i);
		%>
		<tr>
			<td><img src="./storage/<%=dto.getFname()%>" width="100"></td>
			<td><%=dto.getName()%></td>
			<td>
				<%
					for (int j = 0; j < dto.getIndent(); j++) {
							out.print("&nbsp;&nbsp;&nbsp;");
						}
						if (dto.getIndent() > 0)
							out.print(" <img src='../images/re.jpg'>");
				%> <a href="javascript:read('<%=dto.getImageno()%>')"> <%=dto.getTitle()%></a>
			</td>
			<td><%=dto.getMdate()%></td>
			<td><%=dto.getFname()%></td>
			<td><%=dto.getGrpno()%></td>
			<td><%=dto.getIndent()%></td>
			<td><%=dto.getAnsnum()%></td>
		</tr>
		<%
			}
		%>



	</table>


	<DIV class='bottom'>
		<%=paging%>
	</DIV>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
