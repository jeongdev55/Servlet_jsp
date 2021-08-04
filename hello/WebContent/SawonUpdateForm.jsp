<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 전화번호 수정 폼</title>
</head>
<body>
<% 

	request.setCharacterEncoding("EUC-KR"); 
	TelInfoDAO tidao=new TelInfoDAO();
	String oriName=request.getParameter("name");
	TelInfoVO tv2= tidao.search_nametel(oriName);
%>
<form action="SawonUpdateProcess.jsp" method="post">
<table border=2>
<tr>
<th>사번</th><th>이름</th><th>전화번호</th><th>입사일</th></tr>
<tr>
	<td><%=tv2.getId() %></td>
	<td><%=tv2.getName() %></td>
	<td><input type="text" name="tel" value="<%=tv2.getTel() %>"></td>
	<td><%=tv2.getD() %></td>
	<input type="hidden" name="name" value="<%=tv2.getName() %>">
	<!-- 이렇게 하면 이름과 전화번호는  -->
</tr>
<tr>
<td colspan=4><input type="submit" value="수정하자"></td>
</tr>
</table>
</form>
</body>
</html>