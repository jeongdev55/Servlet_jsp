<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- WEB-INF/lib 방에 jstl.jar,
   standard.jar, cos.jar, ojdbc.jar(스프링에서는 tomcat에) -->
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원전체보기(getAllinfo.jsp)</title>
</head>
<body>
<h1>사원 전체 보기</h1>

<!-- input부분 -->
<table border=1>
<tr>
	<td colspan=4>
	<form action="getAllinfo.do"> <!-- .do!!! 중요!!!! -->
		<input type="submit" value="모두보기">
	</form>
	</td>
</tr>

<!-- 우선 컨트롤러에서 파일 명을 처리할 때 .do를 붙이자!!!
		+ 총지배인(front controller)  >> .java 안만들고 하나에 만든다!		
		-->

<!-- 서블릿으로 갔다가 business logic 처리한 후 다시 출발한 곳으로 온다 -->

<!-- output 부분(출력만 하면 됨) -->
<tr>
	<td>사번</td>
	<td>이름</td>
	<td>전화</td>
	<td>입사일</td>
</tr>
<c:forEach var="vo1" items="${alist1}"> <!-- request srocpe 객체 전체를 ArrayList alist1에 저장 -->
<tr>
	<td>${vo1.id}</td>
		<!-- 수정을 시작하기 위한 단계, 여기서 수정과 삭제가 쫙~ -->
	<td><a href="sawonSearchOne.do?name=${vo1.name}">${vo1.name}</a></td>
		<!-- 전체보기 하면서 수정도 가능하게 하자-->
	<td>${vo1.tel}</td>
	<td>${vo1.d}</td>
</tr>
</c:forEach>
</table>

<table border=0>
<tr>			<!-- 입력은 여기서-- 그렇다면 수정은 위에서 -->
	<td><a href="sawonInsertForm.jsp">[입력]</a></td>
	<td><a href="getAllinfo.jsp">[모두보기]</a></td>
	
	<!-- 모두보기 전체출력은 지금 소스 자체 즉. 모두보기와 입력이 쫙 -->
	<!-- 이렇게 진행되면 crud완성 -->
</tr>
</table>
</body>
</html>