<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- WEB-INF/lib �濡 jstl.jar,
   standard.jar, cos.jar, ojdbc.jar(������������ tomcat��) -->
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- input�κ� -->
<table border=1>
<tr>
	<td colspan=4>
	<form action="Telallview">
		<input type="submit" value="����- ��κ���"> <!-- �������� �ϴ� ���� -->
	</form>
	</td>
</tr>

<!-- �������� ���ٰ� business logic ó���� �� �ٽ� ����� ������ �´� -->

<!-- output �κ�(��¸� �ϸ� ��) -->
<tr>
<td>���</td><td>�̸�</td><td>��ȭ</td><td>�Ի���</td>
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
<a href="SawonInsert.jsp">[�Է�]</a>
</body>
</html>