<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("EUC-KR"); %>
<%
	TelInfoDAO tidao=new TelInfoDAO();

	String name=request.getParameter("name");
	
	boolean b1=tidao.delete_nametel(name);
	
	if(b1)
		response.sendRedirect("SawonAllView.jsp");
	else{%>
	<a href="SawonAllforDelete.jsp">사원삭제 에러- 삭제화면으로</a>
	<%} %>
</body>
</html>