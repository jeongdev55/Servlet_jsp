<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>한명 출력</h1>
<!-- 수정할 이름을 가지거 sevlet으로 가자 -->
<!-- controller에서 stv 객체에 한 사람의 정보가 넘어왔음-->

<form action="sawonUpdate.do?sname=${stv.name}"> 
<table border=1 style="border-collapse:collapse;">
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>입사일</th>
	</tr>
	<!-- 입출력이 가능한 상태 -->
	<tr>
		<td><input type="text" value="${stv.id}" name="id"></td>
		<td><input type="text" value="${stv.name}" name="name"></td>
		<td><input type="text" value="${stv.tel}" name="tel"></td>
		<td><input type="text" value="${stv.d}" name="d"></td>
		<input type="hidden" name="sname" value="${stv.name}">
	</tr>
	
	<tr><td colspan=4>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
	</td></tr>
</table>

<a href="${pageContext.request.contextPath}/getAllinfo.jsp">[모두보기]</a>
<a href="sawonDelete.do?name=${stv.name}">[삭제]</a>

<!-- jsp방식으로 <%=request.getContextPath()%>프로젝트명 -->
<!-- 예를 들어 프로젝트명이 변경되어도 잘 진행하도록 하기 위함
		http://localhost:8081/프로젝트명/getAllinfo.jsp에서
		프로젝트명이 변경되어도 소스 수정 필요없음 -->
</form>

</body>
</html>