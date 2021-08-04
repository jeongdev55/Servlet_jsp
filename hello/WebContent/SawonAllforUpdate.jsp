<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원 전체 명단</title>
</head>
<body>
<h1>수정할 이름 선택</h1>

<%
	request.setCharacterEncoding("euc-kr");
	TelInfoDAO tidao=new TelInfoDAO();
	ArrayList<TelInfoVO> tiAarry=tidao.getAllInfo();
%>

<table border="2">
<tr>
<th>사번</th><th>이름</th><th>전화번호</th><th>입사일</th>
</tr>
<%
for(TelInfoVO imsi: tiAarry){%>
<tr>
<td><%=imsi.getId() %></td>
<td><a href="SawonUpdateForm.jsp?name=<%=imsi.getName() %>">
									<%=imsi.getName() %></a></td>
<td><%=imsi.getTel() %></td>
<td><%=imsi.getD() %></td>
<% } %>
</tr>
</table>

<table border=0>
<tr>
	<td><a href="SawonInsertForm.jsp">[입력]</a></td>
	<td><a href="SawonDeleteForm.jsp">[삭제]</a></td>
	<td><a href="SawonAllView.jsp">[모두보기]</a></td>
</tr></table>

</body>
</html>