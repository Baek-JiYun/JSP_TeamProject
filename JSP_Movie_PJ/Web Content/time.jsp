<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 시간 선택</title>
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
<div>
<%
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
%>

	<h1 style="text-align:center">시간을 선택하세요.</h1>

<form action="seat.jsp" method="post">
<input type="hidden" name="time" value="12">
<input type="hidden" name="title" value="<%=title%>">
<input type="submit" value="12시타임">
</form>
<br>
<form action="seat.jsp" method="post">
<input type="hidden" name="time" value="15">
<input type="hidden" name="title" value="<%=title%>">
<input type="submit" value="15시타임">
</form>
<br>
<form action="seat.jsp" method="post">
<input type="hidden" name="time" value="18">
<input type="hidden" name="title" value="<%=title%>">
<input type="submit" value="18시타임">
</form>
	
</div>
</body>
</html>