<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ��ü ���</title>
</head>
<body>
<h1>��� ��ü ���</h1>

<% request.setCharacterEncoding("EUC-KR"); %>
<%
	TelInfoDAO tidao=new TelInfoDAO(); //��ü ����  (why? �ٸ����� �ִ� .java�� ����Ϸ���)
	ArrayList <TelInfoVO> tiArray=tidao.getAllInfo(); //dao ��ü ����� ����
									//��ü.�޼ҵ�								
%>

<!-- ��ü �ο��� ���� ��ü����ŭ �ݺ��Ͽ� ����غ��� -->
<table border=1>
<tr>
<th>���</th><th>�̸�</th><th>��ȭ��ȣ</th><th>�Ի���</th>
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
	<td><a href="SawonInsertForm.jsp">[�Է�]</a></td>
	<td><a href="SawonAllforUpdate.jsp">[����]</a></td>
	<td><a href="SawonAllforDelete.jsp">[����]</a></td>
</tr></table>

</body>
</html>

</body>
</html>