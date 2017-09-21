<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="image1.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="image1.Image1DAO" />
<%  
	request.setCharacterEncoding("utf-8");
    String root = request.getContextPath();
    
    String upDir = application.getRealPath("/image1/storage");
    String tempDir = application.getRealPath("/image1/temp");
%> 