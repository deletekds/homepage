<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<TABLE align='center' border="1" cellpadding="20px" cellspacing="5px">
  <TR>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH rowspan='5' bgcolor='#AAFFAA'> 6% </TH>    
  </TR>
  <TR>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH> </TH>
    <TH rowspan='4' bgcolor='#AAFFAA'> 5% </TH>
  </TR>
  <TR>
    <TH> </TH>
    <TH> </TH>
    <TH rowspan='3' bgcolor='#AAFFAA'> 3% </TH>
    <TH> </TH>
   
  </TR>
  <TR>
    <TH> </TH>
    <TH rowspan='2' bgcolor='#AAFFAA'> 2% </TH>
    <TH rowspan='2' bgcolor='#AAFFAA'> 4% </TH>
  </TR>
  <TR>
    <TH rowspan='1' bgcolor='#AAFFAA'> 1% </TH>
  </TR>
</TABLE>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html>