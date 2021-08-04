<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>사원정보 입력</h1>
<form action="Telinsert" method="post">
<table border="1">
	<tr><td>사번</td><td><input type="text" name="id"></td></tr>
	<tr><td>이름</td><td><input type="text" name="name"></td></tr>
	<tr><td>전화번호</td><td><input type="text" name="tel"></td></tr>
	<tr><td>입사일</td><td><input type="text" name="d"></td></tr>
	<tr><td colspan="4"><input type="submit" value="추가"></td></tr>
</table>
<a href="Telallview">[모두보기]</a>
</form>
</body>
</html>