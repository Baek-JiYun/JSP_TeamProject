# 🎬 JSP 영화예매 프로젝트
- <b>Language</b> : <img alt="JAVA" src="https://img.shields.io/badge/JAVA-007396?style=flat-square&logo=java&logoColor=white"/> <img alt="HTML5" src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/> <img alt="CSS3" src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white"/>
- <b>Database</b> : <img alt="Oracle" src ="https://img.shields.io/badge/Oracle-%23F00000.svg?style=flat-square&logo=oracle&logoColor=white" />
- <b>Tool</b> : <img alt="Eclipse IDE" src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat-square&logo=Eclipse IDE&logoColor=white"/>
- <b>ETC</b> : <img alt="Bootstrap" src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=Bootstrap&logoColor=white"/>


<br>

## 🔖 소개
- 기존의 Java+DB프로젝트였던 영화예매 프로그램을 JSP로 업그레이드 구현한 프로젝트입니다.
- MVC패턴을 기반으로 개발되었습니다.

<br>

## 🔖 제작기간 및 개발인원
- 기간 : 2021.11 ~ 2021.11 (약 1주)
- 인원 : 3명
<br>

## 🔖 주요기능

#### 🔸 메인화면

<img src="img/Main.png" width="600" height="360">

- 상영중인 영화와 추천 영화가 표시됩니다.
- 로그인 하지않으면 예매할 수 없으며, 검색만 가능합니다.

#### 🔸 영화검색

<img src="img/searchMain.png" width="540" height="330">

<img src="img/movieSearch.png" width="540" height="330">

- 검색된 단어와 DB의 Title을 비교해 일치한 값을 읽어와 화면에 보여줍니다.

<details>
<summary>코드보기</summary>
<div markdown="1">

```jsp
/// search.jsp
dtos2= service2.getAllMovieSearch();
	
	for (int i = 0; i < dtos2.size(); i++) {%>
	<div class="col mb-5">
    <div class="card h-100">
        <!-- 관람 나이 표기-->
        
        <%if(dtos2.get(i).getAge_Limit()==19) {%>
        	<div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">19+</div>
        <% }else if(dtos2.get(i).getAge_Limit()==15){ %>
        			<div class="badge bg-warning text-white position-absolute" style="top: 0.5rem; right: 0.5rem">15+</div>
        <% }else if(dtos2.get(i).getAge_Limit()==12){ %>
        			<div class="badge bg-primary text-white position-absolute" style="top: 0.5rem; right: 0.5rem">12+</div>
        <% }else if(dtos2.get(i).getAge_Limit()==0){ %>
        			<div class="badge bg-success text-white position-absolute" style="top: 0.5rem; right: 0.5rem">All</div>
        <%}%>
        
        <!-- image-->
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
            </div>
        </div>
```

</div>
</details>
		
## 🔷 담당 기능
		    
#### 🔸 회원가입 및 정보 수정

- ID는 PK지정으로 변경이 불가능하며, 비밀번호와 나이만 변경이 가능합니다.

<img src="img/signUp.png" width="360" height="280">

<img src="img/memberUpdate.png" width="360" height="280">

#### 🔸 회원정보 및 예매 내역 조회

- DB에 저장된 회원정보와 예매 내역을 조회합니다.
- 정보수정을 누르면 수정 페이지로 이동합니다.
- 예매내역이 있을 경우 예매 내역만큼 chk값이 증가하고 출력됩니다.

<img src="img/memberInfo.png" width="400" height="460">

```jsp
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
```

# 😘 감사합니다.
