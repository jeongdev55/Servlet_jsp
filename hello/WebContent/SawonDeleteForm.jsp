<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사원 삭제 폼</title>
</head>
<body>
<% request.setCharacterEncoding("EUC-KR"); %>

<% 
	TelInfoDAO tidao=new TelInfoDAO();
	String oriName=request.getParameter("name");
	//out.print(oriNmae);
	TelInfoVO tv2= tidao.search_nametel(oriName);
	//홍길동 정보(id,name,tel,d입사일까지)를 db에서 꺼내서 객체 상태로 tv2에 넣어옴
	//out.println(tv2.getId());
%>
<form action="SawonDeleteProcess.jsp" method="post">
<table border=2>
<tr>
<th>사번</th><th>이름</th><th>전화번호</th><th>입사일</th></tr>
<tr>
	<td><%=tv2.getId() %></td>
	<td><%=tv2.getName() %></td>
	<td><%=tv2.getTel() %></td>
	<td><%=tv2.getD() %></td>
	<input type="hidden" name="name" value="<%=tv2.getName() %>">
	<!-- 이렇게 하면 이름과 전화번호는  -->
</tr>
<tr>
<td colspan=4><input type="submit" value="삭제하자"></td>
</tr>
</table>

<table border=0>
<tr>
	<td><a href="SawonInsertForm.jsp">[입력]</a></td>
	<td><a href="SawonAllforUpdate.jsp">[수정]</a></td>
	<td><a href="SawonAllView.jsp">[모두보기]</a></td>
</tr></table>

</form>


</body>
</html>