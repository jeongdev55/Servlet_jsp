<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원 전체 명단</title>
</head>
<body>
<h1>사원 전체 명단</h1>

<% request.setCharacterEncoding("EUC-KR"); %>
<%
	TelInfoDAO tidao=new TelInfoDAO(); //객체 생성  (why? 다른곳에 있는 .java를 사용하려면)
	ArrayList <TelInfoVO> tiArray=tidao.getAllInfo(); //dao 전체 출력을 위해
									//객체.메소드								
%>

<!-- 전체 인원에 대한 객체수만큼 반복하여 출력해보자 -->
<table border=1>
<tr>
<th>사번</th><th>이름</th><th>전화번호</th><th>입사일</th>
</tr>

<%
for(TelInfoVO imsi:tiArray){ %>
<tr>
<td> <%=imsi.getId() %></td>
<td> <%=imsi.getName() %></td>
<td> <%=imsi.getTel() %></td>
<td> <%=imsi.getD() %></td>
<% } %>
</tr>
</table>

<table border=0>
<tr>
	<td><a href="SawonInsertForm.jsp">[입력]</a></td>
	<td><a href="SawonAllforUpdate.jsp">[수정]</a></td>
	<td><a href="SawonAllforDelete.jsp">[삭제]</a></td>
</tr></table>

</body>
</html>

</body>
</html>