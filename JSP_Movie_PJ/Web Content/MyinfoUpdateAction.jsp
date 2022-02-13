<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="dto.MovieMemberVO,service.MovieMemberService,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<MovieMemberVO> dtos;
	MovieMemberService service = new MovieMemberService(); 
	String userId=request.getParameter("userId");
	String pw=request.getParameter("password");
	String age=request.getParameter("age");
	
	System.out.print(userId);
	int born = Integer.parseInt(age);
	
	dtos=service.updateMovieMembers(pw, born, userId);
	
	%>
	<script>


	alert("정보수정이 완료되었습니다.");
	location.href='./Myinfo.jsp?userId=<%=userId%>';
	</script>
</body>
</html>