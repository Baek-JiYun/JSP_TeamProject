<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList, java.util.Scanner,
dto.MovieMemberVO,
 dto.MovieVO,
 service.MovieMemberService,
 service.MovieService,
 java.util.Enumeration" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>영화 검색 페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="#" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand">영화 검색</a>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="영화제목 입력" aria-label="Search" name="smv">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">영화 검색</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Movie Search</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">



<%
 
// 사용자의 브라우저 확인
String userAgent = request.getHeader("User-Agent") ;
if(userAgent.indexOf("Trident") > -1) {												// IE
%>
	<script>
	alert("인터넷 익스프로러는 지원하지 않습니다. 크롬, 웨일, 엣지 등 다른 브라우저를 이용해 주세요.");
	</script>
	<%
} 
	
%>

<% 
ArrayList<MovieVO> dtos2; // 영화정보용
MovieService service2 = new MovieService();
String smv="";
request.setCharacterEncoding("euc-kr");
smv = request.getParameter("smv");
if (smv!=null&&smv!=""){
	dtos2= service2.getMovieSearch(smv);	
	for (int i = 0; i < dtos2.size(); i++) {%>
		<div class="col mb-5">
        <div class="card h-100">
            <!-- Sale badge-->
            
            <%if(dtos2.get(i).getAge_Limit()==19) {%>
            	<div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">19+</div>
            <% }else if(dtos2.get(i).getAge_Limit()==15){ %>
            			<div class="badge bg-warning text-white position-absolute" style="top: 0.5rem; right: 0.5rem">15+</div>
            <% }else if(dtos2.get(i).getAge_Limit()==12){ %>
            			<div class="badge bg-primary text-white position-absolute" style="top: 0.5rem; right: 0.5rem">12+</div>
            <% }else if(dtos2.get(i).getAge_Limit()==0){ %>
            			<div class="badge bg-success text-white position-absolute" style="top: 0.5rem; right: 0.5rem">All</div>
            <%}%>
            
            <!-- Product image-->
            <img class="card-img-top" src="<%=dtos2.get(i).getPoster()%>" alt="..." />
            <!-- Product details-->
            <div class="card-body p-4">
                <div class="text-center">
                    <!-- Product name-->
                    <h5 class="fw-bolder"><%=dtos2.get(i).getTitle()%></h5>
                    <!-- Product reviews-->
                    <div class="d-flex justify-content-center small text-warning mb-2">
                  <%int ramdomNum=(int)((Math.random()*10000)%5);
                    for (int j=0; j<=ramdomNum;j++){ %>
                        <div class="bi-star-fill"></div>
					<%} %>
                    
                    </div>
                    <!-- Product price-->
                    상영 시간<br>
                    12시, 15시, 18시                   
                </div>
            </div>
            <!-- Product actions-->
            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="movie.jsp">예매하기</a></div>
            </div>
        </div>
    </div>
	
	
<%	}
	
	if (dtos2.size()==0){
		%>
		<h1>검색 결과가 <br>없습니다.</h1>
		<%
	}
}
else{
	dtos2= service2.getAllMovieSearch();
	
	for (int i = 0; i < dtos2.size(); i++) {%>
	<div class="col mb-5">
    <div class="card h-100">
        <!-- Sale badge-->
        
        <%if(dtos2.get(i).getAge_Limit()==19) {%>
        	<div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">19+</div>
        <% }else if(dtos2.get(i).getAge_Limit()==15){ %>
        			<div class="badge bg-warning text-white position-absolute" style="top: 0.5rem; right: 0.5rem">15+</div>
        <% }else if(dtos2.get(i).getAge_Limit()==12){ %>
        			<div class="badge bg-primary text-white position-absolute" style="top: 0.5rem; right: 0.5rem">12+</div>
        <% }else if(dtos2.get(i).getAge_Limit()==0){ %>
        			<div class="badge bg-success text-white position-absolute" style="top: 0.5rem; right: 0.5rem">All</div>
        <%}%>
        
        <!-- Product image-->
        <img class="card-img-top" src="<%=dtos2.get(i).getPoster()%>" alt="..." />
        <!-- Product details-->
        <div class="card-body p-4">
            <div class="text-center">
                <!-- Product name-->
                <h5 class="fw-bolder"><%=dtos2.get(i).getTitle()%></h5>
                <!-- Product reviews-->
                <div class="d-flex justify-content-center small text-warning mb-2">
              <%int ramdomNum=(int)((Math.random()*10000)%5);
                for (int j=0; j<=ramdomNum;j++){ %>
                    <div class="bi-star-fill"></div>
				<%} %>
                
                </div>
                <!-- Product price-->
                상영 시간<br>
                12시, 15시, 18시                   
            </div>
        </div>
        <!-- Product actions-->
        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
        <%Object userId = session.getAttribute("userId");%>
	<%if(userId==null){%><!-- 로그인이 안돼잇으면 로그인하기 -->
		<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="login.jsp">예매하기</a></div>
		<br>
	<%} else {%><!-- 로그인이 돼잇으면 예매 -->
		<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="movie.jsp">예매하기</a></div>
	<%}%>
            
        </div>
    </div>
</div>


<%}
}%>

                  
                  
                  
                  
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">검색된 영화 목록</p> <br> </div>
            <div class="container  text-center "><a class="btn btn-outline-light mt-auto" href="index.jsp">Home</a></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>