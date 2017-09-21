<%@ page contentType="text/html; charset=UTF-8" %> 

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
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">LOGIN</DIV>
 
<FORM name='frm' method='POST' action='./loginProc.jsp'>
  <TABLE>
    <TR>
      <TH>ID</TH>
      <TD><input type="text" name="id"></TD>
    </TR>
    <tr>
    <th>PASSWD</th>
    <td><input type="password" name="passwd"></td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='LOGIN'class="btn btn-danger">
    <input type='button' value='회원가입'class="btn btn-danger" onclick="location.href='./agreement.jsp'">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
