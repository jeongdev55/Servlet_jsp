<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ���� ��</title>
</head>
<body>
<% request.setCharacterEncoding("EUC-KR"); %>

<% 
	TelInfoDAO tidao=new TelInfoDAO();
	String oriName=request.getParameter("name");
	//out.print(oriNmae);
	TelInfoVO tv2= tidao.search_nametel(oriName);
	//ȫ�浿 ����(id,name,tel,d�Ի��ϱ���)�� db���� ������ ��ü ���·� tv2�� �־��
	//out.println(tv2.getId());
%>
<form action="SawonDeleteProcess.jsp" method="post">
<table border=2>
<tr>
<th>���</th><th>�̸�</th><th>��ȭ��ȣ</th><th>�Ի���</th></tr>
<tr>
	<td><%=tv2.getId() %></td>
	<td><%=tv2.getName() %></td>
	<td><%=tv2.getTel() %></td>
	<td><%=tv2.getD() %></td>
	<input type="hidden" name="name" value="<%=tv2.getName() %>">
	<!-- �̷��� �ϸ� �̸��� ��ȭ��ȣ��  -->
</tr>
<tr>
<td colspan=4><input type="submit" value="��������"></td>
</tr>
</table>

<table border=0>
<tr>
	<td><a href="SawonInsertForm.jsp">[�Է�]</a></td>
	<td><a href="SawonAllforUpdate.jsp">[����]</a></td>
	<td><a href="SawonAllView.jsp">[��κ���]</a></td>
</tr></table>

</form>


</body>
</html>