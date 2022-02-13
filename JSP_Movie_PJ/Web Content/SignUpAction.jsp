<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.MovieMemberDAO"%>
<%@ page import="dto.MovieMemberVO"%>
<%@ page import="service.MovieMemberService"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%ArrayList<MovieMemberVO> dtos;
	MovieMemberService service = new MovieMemberService(); 
	%>
	<%
	String id=request.getParameter("id");
	String pw=request.getParameter("password");
	String age=request.getParameter("age");
	
	int born = Integer.parseInt(age);
	boolean check=false;
	
	dtos = service.getAllMembers();
	
	for (int i = 0; i < dtos.size(); i++) {
		if (dtos.get(i).getID().equals(id)) {
			check = true; 
			break;
		}
	}

%>
	
	<%
	try{
		if(check==false){
	dtos=service.insertMovieMembers(id, pw, born);
	session.setAttribute("userId", id);
	response.sendRedirect("./index.jsp");
	}else{%>
		<script>
		alert("이미 사용중인 아이디입니다. 다시 시도해주세요.");
		history.back();
		</script>
	<%}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
	
</body>
</html>