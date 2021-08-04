<%@page import="java.util.ArrayList" %>
<%@page import="telinfoDAO.TelInfoDAO" %>
<%@page import="telinfoVO.TelInfoVO" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원 전체 명단</title>
</head>
<body>
<h1>삭제할 이름 선택</h1>

<!-- SawonAllforDelete.jsp 화면에 나오는 여러 이름중에 + 마우스로 퇴사한 홍길동 사원을 클릭하면 (a tag)
	SawonDeleteForm.jsp 홍길동 정보를 db에서 꺼내서 모두 보여준 후 + [삭제하자]가 + 이버튼을 누르면
	SawonDeleteProcess.jsp 여기서 삭제를 처리한후 삭제가 된 자료 빼고 다른 전체 모든 사원을 출력함 -->


<%
	request.setCharacterEncoding("euc-kr");
	TelInfoDAO tidao=new TelInfoDAO();
	ArrayList<TelInfoVO> tiArray = tidao.getAllInfo();
%>

<table border="2">
<tr>
<th>사번</th><th>이름</th><th>전화번호</th><th>입사일</th>
</tr>

<% //SawonAllforDelete.jsp
	for(TelInfoVO imsi : tiArray){%>
	<tr>
	<td> <%=imsi.getId() %></td>   <!-- blue색, 밑줄 , 손가락나오는 모양 -->
	<td><a href="SawonDeleteForm.jsp?name=<%=imsi.getName()%>">
								<%=imsi.getName()%></a></td>
	<td><%=imsi.getTel() %></td>
	<td><%=imsi.getD() %></td>
<% } %>
</tr>
</table>

<table border=0>
<tr>
	<td><a href="SawonInsertForm.jsp">[입력]</a></td>
	<td><a href="SawonAllforUpdate.jsp">[수정]</a></td>
	<td><a href="SawonAllView.jsp">[모두보기]</a></td>
</tr></table>

</body>
</html>