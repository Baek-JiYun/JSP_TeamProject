# π¬ JSP μνμλ§€ νλ‘μ νΈ
- <b>Language</b> : <img alt="JAVA" src="https://img.shields.io/badge/JAVA-007396?style=flat-square&logo=java&logoColor=white"/> <img alt="HTML5" src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/> <img alt="CSS3" src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white"/>
- <b>Database</b> : <img alt="Oracle" src ="https://img.shields.io/badge/Oracle-%23F00000.svg?style=flat-square&logo=oracle&logoColor=white" />
- <b>Tool</b> : <img alt="Eclipse IDE" src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat-square&logo=Eclipse IDE&logoColor=white"/>
- <b>ETC</b> : <img alt="Bootstrap" src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=Bootstrap&logoColor=white"/>


<br>

## π μκ°
- κΈ°μ‘΄μ Java+DBνλ‘μ νΈμλ μνμλ§€ νλ‘κ·Έλ¨μ JSPλ‘ μκ·Έλ μ΄λ κ΅¬νν νλ‘μ νΈμλλ€.
- MVCν¨ν΄μ κΈ°λ°μΌλ‘ κ°λ°λμμ΅λλ€.

<br>

## π μ μκΈ°κ° λ° κ°λ°μΈμ
- κΈ°κ° : 2021.11 ~ 2021.11 (μ½ 1μ£Ό)
- μΈμ : 3λͺ
<br>

## π μ£ΌμκΈ°λ₯

#### πΈ λ©μΈνλ©΄

<img src="img/Main.png" width="600" height="360">

- μμμ€μΈ μνμ μΆμ² μνκ° νμλ©λλ€.
- λ‘κ·ΈμΈ νμ§μμΌλ©΄ μλ§€ν  μ μμΌλ©°, κ²μλ§ κ°λ₯ν©λλ€.

#### πΈ μνκ²μ

<img src="img/searchMain.png" width="540" height="330">

<img src="img/movieSearch.png" width="540" height="330">

- κ²μλ λ¨μ΄μ DBμ Titleμ λΉκ΅ν΄ μΌμΉν κ°μ μ½μ΄μ νλ©΄μ λ³΄μ¬μ€λλ€.

<details>
<summary>μ½λλ³΄κΈ°</summary>
<div markdown="1">

```jsp
/// search.jsp
dtos2= service2.getAllMovieSearch();
	
	for (int i = 0; i < dtos2.size(); i++) {%>
	<div class="col mb-5">
    <div class="card h-100">
        <!-- κ΄λ λμ΄ νκΈ°-->
        
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
		
## π· λ΄λΉ κΈ°λ₯
		    
#### πΈ νμκ°μ λ° μ λ³΄ μμ 

- IDλ PKμ§μ μΌλ‘ λ³κ²½μ΄ λΆκ°λ₯νλ©°, λΉλ°λ²νΈμ λμ΄λ§ λ³κ²½μ΄ κ°λ₯ν©λλ€.

<img src="img/signUp.png" width="360" height="280">

<img src="img/memberUpdate.png" width="360" height="280">

#### πΈ νμμ λ³΄ λ° μλ§€ λ΄μ­ μ‘°ν

- DBμ μ μ₯λ νμμ λ³΄μ μλ§€ λ΄μ­μ μ‘°νν©λλ€.
- μ λ³΄μμ μ λλ₯΄λ©΄ μμ  νμ΄μ§λ‘ μ΄λν©λλ€.
- μλ§€λ΄μ­μ΄ μμ κ²½μ° μλ§€ λ΄μ­λ§νΌ chkκ°μ΄ μ¦κ°νκ³  μΆλ ₯λ©λλ€.

<img src="img/memberInfo.png" width="400" height="460">

```jsp
<%
int chk=0; // μλ§€ λ΄μ­ μ²΄ν¬λ³μ
dtos2=service2.getAllMovie();
for(int i=0;i<dtos2.size();i++){
if(dtos2.get(i).getId().equals(userId)){
	chk++; // μλ§€ λ΄μ­μ΄μλ€λ©΄ +1
	}
}
	if(chk>=1){%> 
		   <header class="bg-dark py-2">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 font-weight-bold">μλ§€ λ΄μ­</h1>                 
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
      <th scope="row">μνμ λͺ©</th>
      <td><%=title %></td>
    </tr>
    <tr>
      <th scope="row">μμμκ°</th>
      <td><%=time %></td>
    </tr>
    <tr>
      <th scope="row">μ’μλ²νΈ</th>
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

# π κ°μ¬ν©λλ€.
