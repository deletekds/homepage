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

 
<DIV class="title">ID 중복확인 </DIV>
 
<FORM name='frm' method='POST' action='./id_Proc.jsp'>
  <TABLE>
    <TR>
      <TH>ID</TH>
      <TD><input type="text" name="id"></TD>
    </TR>
  </TABLE>
  
   <DIV class='bottom'>
    <input type='button' value='중복확인' class="btn btn-danger">
    <input type='button' value='취소'class="btn btn-danger" onclick="window.close()">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html> 
