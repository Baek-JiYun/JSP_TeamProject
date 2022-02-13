<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.MovieMemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
</head>
<body>
<%
String userId=request.getParameter("userId");
String password=request.getParameter("password");
		MovieMemberDAO dao=new MovieMemberDAO();
		boolean result=dao.memberSelect(userId,password);
		
		if(result==true){
			System.out.println("로그인 성공!");
			session.setAttribute("userId", userId);
			response.sendRedirect("index.jsp");
		} else {
			System.out.println("로그인 실패!");
%>
	<script>
	alert("ID와 비밀번호를 다시 확인해 주세요.");
	history.back();
	</script>

<%
			//response.sendRedirect("./index.jsp");
		}
%>
</body>
</html>