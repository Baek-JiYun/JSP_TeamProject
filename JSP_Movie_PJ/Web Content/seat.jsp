<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.MovieVO" %>
<%@ page import="dao.MovieDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 좌석 선택</title>
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
<h1 style="text-align:center">자리를 선택하세요.</h1>

<%
MovieDAO dao2 = new MovieDAO();
ArrayList<MovieVO> dtos2;
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
String time = request.getParameter("time");
dtos2= dao2.ViewMovie(title,time);
for(int i =0;i<dtos2.size();i++){
	MovieVO arr = dtos2.get(i);
	String Title = arr.getTitle();
	int age= arr.getAge_Limit();
	String Time =arr.getMovie_Time().substring(11,16);
	int seat = arr.getSeat();
%>
<div style="width:200px; height:150px; border:1px solid black;">
<%	
	out.println("제 목: "+Title+"<br>");
	out.println("시 간: "+Time+"<br>");
	out.println("나이제한: "+age+"<br>");
	out.println("자리번호: "+seat+"<br>");
%>
<form action="rsvComplete.jsp" method="post">
<input type="hidden" name="time" value="<%=time%>">
<input type="hidden" name="title" value="<%=title%>">
<input type="hidden" name="seat" value="<%=seat%>">
<input type="hidden" name="age" value="<%=age%>">
<br>
<input type="submit" value="이 자리로 예매하기">
</form>
<br>
</div>
<%
}
%>



</body>
</html>