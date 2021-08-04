<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- WEB-INF/lib 방에 jstl.jar,
   standard.jar, cos.jar, ojdbc.jar(스프링에서는 tomcat에) -->
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- input부분 -->
<table border=1>
<tr>
	<td colspan=4>
	<form action="Telallview">
		<input type="submit" value="가자- 모두보기"> <!-- 서블릿으로 일단 가자 -->
	</form>
	</td>
</tr>

<!-- 서블릿으로 갔다가 business logic 처리한 후 다시 출발한 곳으로 온다 -->

<!-- output 부분(출력만 하면 됨) -->
<tr>
<td>사번</td><td>이름</td><td>전화</td><td>입사일</td>
</tr>
<c:forEach var="i" items="${requestScope.alist1}">
<tr>
<td>${i.id}</td>
<td><a href="Telsearchone?name=${i.name}">${i.name}</a></td>
<td>${i.tel}</td>
<td>${i.d}</td>
</tr>
</c:forEach>
</table>
<a href="SawonInsert.jsp">[입력]</a>
</body>
</html>