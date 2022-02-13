<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.Scanner,
dto.MovieMemberVO,
 dto.MovieVO,
 service.MovieMemberService,
 service.MovieService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
<style>
body {
        height: 100vh;
        background-image: url('beach-g5d22e39b7_1920.jpg');
        background-repeat : no-repeat;
        background-size : cover;
      }
</style>
</head>
<body>
<%
ArrayList<MovieMemberVO> dtos;
ArrayList<MovieVO> dtos2;
ArrayList<MovieVO> dtos3;
MovieMemberService service = new MovieMemberService();
MovieService service2 = new MovieService();
MovieService service3 = new MovieService();
dtos= service.getAllMembers();
dtos2= service2.getAllMoviePoster();
dtos3= service3.getAllMovieSearch();
String id = (String)session.getAttribute("userId");
String title="";
int ageLimit=0;
int age=0;
for(int i=0;i<dtos.size();i++){
	if(dtos.get(i).getID().equals(id))
		age=dtos.get(i).getBorn();
}
for(int i=0;i<4;i++){
	title = dtos3.get(i).getTitle();
	ageLimit = dtos3.get(i).getAge_Limit();
	
	if(age>=ageLimit){
%>
<div>
<%if(ageLimit!=0) {%>
	<b><%=title %>&nbsp;<%=ageLimit %>세 이용가</b><br>
<%}else{ %>
	<b><%=title %>&nbsp;모든 연령 시청가능</b><br>
<%} %>
	<img src="<%=dtos2.get(i).getPoster()%>" width="169" height="242">
	<form action="time.jsp" method="post">
	<input type="hidden" name="title" value="<%=title%>">
	<input type="submit" value="시간보기">
	</form>
</div>
<%}}
%>
</body>
</html>