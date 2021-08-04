<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사원 추가</title>
</head>
<body>
<h1>사원 추가</h1>
<%
	request.setCharacterEncoding("euc-kr");
	TelInfoDAO tidao=new TelInfoDAO(); //DAO객체 만들고
	
	int id = Integer.parseInt(request.getParameter("id"));
	//insertform으로 부터 넘겨 받고
	String name=request.getParameter("name");
	String tel=request.getParameter("tel");
	String sDate=request.getParameter("sDate");
	
	//dao를 통해서 db에 insert하기 (날짜 입력시 20210128 o / 20211517 x)
	boolean b1= tidao.insert_nametel(id,name,tel,sDate);
				//dao 객체.메소드()로 dao에 있는 메소드 호출
				//insert into ....???진행하고
				//db에 insert한 결과를 true or false 로 리턴	
			String msg = null;			
 	if(b1)  //true면 insert되었으므로	
         response.sendRedirect("SawonAllView.jsp"); //insert ok
         //전부다 보러가자!
      else
      { %>
         <a href = "SawonInsertForm.jsp">사원입력 에러 - 입력화면으로</a>
      <% } %>


</body>
</html>