<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� �߰�</title>
</head>
<body>
<h1>��� �߰�</h1>
<%
	request.setCharacterEncoding("euc-kr");
	TelInfoDAO tidao=new TelInfoDAO(); //DAO��ü �����
	
	int id = Integer.parseInt(request.getParameter("id"));
	//insertform���� ���� �Ѱ� �ް�
	String name=request.getParameter("name");
	String tel=request.getParameter("tel");
	String sDate=request.getParameter("sDate");
	
	//dao�� ���ؼ� db�� insert�ϱ� (��¥ �Է½� 20210128 o / 20211517 x)
	boolean b1= tidao.insert_nametel(id,name,tel,sDate);
				//dao ��ü.�޼ҵ�()�� dao�� �ִ� �޼ҵ� ȣ��
				//insert into ....???�����ϰ�
				//db�� insert�� ����� true or false �� ����	
			String msg = null;			
 	if(b1)  //true�� insert�Ǿ����Ƿ�	
         response.sendRedirect("SawonAllView.jsp"); //insert ok
         //���δ� ��������!
      else
      { %>
         <a href = "SawonInsertForm.jsp">����Է� ���� - �Է�ȭ������</a>
      <% } %>


</body>
</html>