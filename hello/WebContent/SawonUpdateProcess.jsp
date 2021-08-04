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
	String tel=request.getParameter("tel");
	
	boolean b1=tidao.update_nametel(tel,name);
	
	if(b1)
		response.sendRedirect("SawonAllView.jsp");
	else{%>
	<a href="SawonAllUpdate.jsp">사원수정 에러- 수정화면으로</a>
	<%} %>
</body>
</html>