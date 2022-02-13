<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dto.MovieMemberVO"%>
<%@ page import="dto.MovieVO"%>
<%@ page import="service.MovieService"%>
<%@ page import="service.MovieMemberService"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>내 정보</title>
</head>
<body>
<%ArrayList<MovieMemberVO> dtos;
ArrayList<MovieVO> dtos2;
	MovieMemberService service = new MovieMemberService(); 
	MovieService service2 = new MovieService(); 
	%>
	<%
	String userId = request.getParameter("userId");
	String pw="";
	int born=0;
	dtos = service.getAllMembers();
	
	for (int i = 0; i < dtos.size(); i++) {
		if (dtos.get(i).getID().equals(userId)) {
			pw=dtos.get(i).getPW();
			born=dtos.get(i).getBorn();
			break;
		}
	}
	
	%>
   <header class="bg-dark py-2">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 font-weight-bold">내 정보 보기</h1>                   
                </div>
            </div>
        </header>
<div class="container">
<div style="text-align:right; margin-right:10px;">
<br>
<button id="btn1" type="button" class="btn btn-outline-dark" onClick="document.location.href='MyinfoUpdate.jsp?userId=<%=userId%>'">정보 수정</button>
<button id="btn2" type="button" class="btn btn-outline-dark" onClick="document.location.href='index.jsp'"> 홈 </button>
</div>
<br>
<table class="table table-striped text-center" style=" border:1px solid black;">
  <tbody>
    <tr>
      <th scope="row">아이디</th>
      <td><%=userId %></td>
    </tr>
    <tr>
      <th scope="row">비밀번호</th>
      <td><%=pw %></td>
    </tr>
    <tr>
      <th scope="row">나이</th>
      <td><%=born %></td>
    </tr>
  </tbody>
</table>
</div>

<%
int chk=0; // 예매 내역 체크변수
dtos2=service2.getAllMovie();
for(int i=0;i<dtos2.size();i++){
if(dtos2.get(i).getId().equals(userId)){
	chk++; // 예매 내역이있다면 +1
	}
}
	if(chk>=1){%> 
		   <header class="bg-dark py-2">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 font-weight-bold">예매 내역</h1>                 
                </div>
            </div>
        </header>
	<% }%>
<div class="container">	
<br>
	<%for(int i=0;i<dtos2.size();i++){

		if(dtos2.get(i).getId().equals(userId)){
			String title=dtos2.get(i).getTitle();
			String time =dtos2.get(i).getMovie_Time().substring(11,16);
			int seat=dtos2.get(i).getSeat(); %>
			
			
	<table class="table table-striped text-center" style=" border:1px solid black;">
  <tbody>
    <tr>
      <th scope="row">영화제목</th>
      <td><%=title %></td>
    </tr>
    <tr>
      <th scope="row">시작시간</th>
      <td><%=time %></td>
    </tr>
    <tr>
      <th scope="row">좌석번호</th>
      <td><%=seat %></td>
    </tr>
  </tbody>
</table>					
	<%
		}
	}
	%>
	</div>
</body>
</html>