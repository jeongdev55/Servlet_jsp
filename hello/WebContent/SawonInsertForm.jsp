<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>��� ���� �Է�</h1>
<form action="SawonInsertProcess.jsp" method="post">
<table border="2">
<tr> <td>���</td> <td><input type="text" name="id"></td>
<tr> <td>�̸�</td> <td><input type="text" name="name"></td>
<tr> <td>��ȭ��ȣ</td> <td><input type="text" name="tel"></td>
<tr> <td>�Ի���</td> <td><input type="text" name="sDate"></td>
<tr><td colspan="2"><input type="submit" value="�߰�����"></td>
</table>

<table border=0>
<tr>
<td><a href="SawonInsertForm.jsp">[�Է�]</a></td>
<td><a href="SawonAllforUpdate.jsp">[����]</a></td>
<td><a href="SawonAllforDelete.jsp">[����]</a></td>
<td><a href="SawonAllView.jsp">[��κ���]</a></td>
</tr>
</table>
</form>

</body>
</html>