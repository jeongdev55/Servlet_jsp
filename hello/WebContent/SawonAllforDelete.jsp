<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ��ü ���</title>
</head>
<body>
<h1>������ �̸� ����</h1>

<!-- SawonAllforDelete.jsp ȭ�鿡 ������ ���� �̸��߿� + ���콺�� ����� ȫ�浿 ����� Ŭ���ϸ� (a tag)
	SawonDeleteForm.jsp ȫ�浿 ������ db���� ������ ��� ������ �� + [��������]�� + �̹�ư�� ������
	SawonDeleteProcess.jsp ���⼭ ������ ó������ ������ �� �ڷ� ���� �ٸ� ��ü ��� ����� ����� -->


<%
	request.setCharacterEncoding("euc-kr");
	TelInfoDAO tidao=new TelInfoDAO();
	ArrayList<TelInfoVO> tiArray = tidao.getAllInfo();
%>

<table border="2">
<tr>
<th>���</th><th>�̸�</th><th>��ȭ��ȣ</th><th>�Ի���</th>
</tr>

<% //SawonAllforDelete.jsp
	for(TelInfoVO imsi : tiArray){%>
	<tr>
	<td> <%=imsi.getId() %></td>   <!-- blue��, ���� , �հ��������� ��� -->
	<td><a href="SawonDeleteForm.jsp?name=<%=imsi.getName()%>">
								<%=imsi.getName()%></a></td>
	<td><%=imsi.getTel() %></td>
	<td><%=imsi.getD() %></td>
<% } %>
</tr>
</table>

<table border=0>
<tr>
	<td><a href="SawonInsertForm.jsp">[�Է�]</a></td>
	<td><a href="SawonAllforUpdate.jsp">[����]</a></td>
	<td><a href="SawonAllView.jsp">[��κ���]</a></td>
</tr></table>

</body>
</html>