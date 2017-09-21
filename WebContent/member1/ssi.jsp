<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="member1.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean class="member1.Member1DAO" id="dao"/>
<%  
request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();  
      
      String upDir = application.getRealPath("/member1/storage");
      String tempDir = application.getRealPath("/member1/temp");
      
      
      
      
%> 
