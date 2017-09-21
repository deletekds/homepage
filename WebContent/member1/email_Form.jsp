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

 
<DIV class="title">EMAIL 중복확인</DIV>
 
<FORM name='frm' method='POST' action='./email_Proc.jsp'>
  <TABLE>
    <TR>
      <TH>EMAIL</TH>
      <TD><input type="text" name="email"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='중복확인' class="btn btn-success">
    <input type='button' value='취소' class="btn btn-success" onclick="window.close()">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html> 
