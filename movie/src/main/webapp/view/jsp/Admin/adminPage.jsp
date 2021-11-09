<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/movie/view/css/adminPage.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		//마이페이지로
		$('button#to_myPage').click(function(){
			document.location.href='/movie/insert_movie.do';
			
			}),
			//영화넣기
		$('button#insert_movie').click(function(){  
			document.location.href='/movie/insert_movie.do';
			
			}),
			//배우넣기
		$('button#insert_actor').click(function(){
			document.location.href='/movie/insert_actor.do';
			
			}),
			//에매내역넣기
		$('button#insert_booking').click(function(){
			//document.location.href='/movie/insertBooking.do';
			form.submit();
			
			});
			
	});

</script>
</head>
<body>

<jsp:include page="../gnb.jsp" ></jsp:include>
<!-- 어드민에는 
영화관리 CRUD
유저관리	CRUD
스토어관리	CRUD
그러면 3가지 탭을 만들기

  --> 
<div class="wrapper">
  <div class="one">
<h1>영화테이블넣기</h1>
<form action="/movie/insert_movie.do"method="GET" id="movie_form">
<span><!-- <input type="hidden" placeholder="영화번호를 입력하시오" name="movie_no"> --></span>
<!-- <span><input type="text" placeholder="제목을 입력하시오" name="movie_no"></span>
 --><div><input type="text" placeholder="제목을 입력하시오" name="moviecd"></div>
<div><input type="text" placeholder="제목를 고르세요" name="movieNm"></div>
<div><input type="text" placeholder="영어제목을 입력하시오" name="movieNmEn"></div>
<div><input type="text" placeholder="러닝타임을 입력하시오" name="showTm"></div>
<div><input type="date" placeholder="개봉일을 입력하시오" name="openDt"></div>

<div><input type="text" placeholder="줄거리을 입력하시오" name="contents"></div>
<div><input type="text" placeholder="개봉상태을 입력하시오" name="prdtStatNm"></div>
<div><input type="text" placeholder="국가을 입력하시오" name="nations"></div>
<div><input type="text" placeholder="장르를 입력하시오" name="genre"></div>
<div><input type="text" placeholder="감독명을 입력하시오" name="directors"></div>

<div><input type="text" placeholder="배우을 입력하시오" name="actors"></div>
<div><input type="text" placeholder="제한연령을 입력하시오" name="watchGradeNm"></div>
<div><input type="text" placeholder="회사를 입력하시오" name="companys"></div>

<button id="insert_movie">영화 넣기</button>
</form>

<div> </div>
<!--  form1 끝 -->
</div>
  <div class="two">

<!--  form2 시작 -->
<h1>영화배우넣기</h1>
<form action="/movie/insert_actor.do"method="GET" id="actor_form">

<span><input type="text" placeholder="배우이름을 입력하시오" name="actor_name"></span>
<button id="insert_actor">insert_actor</button>
</form>

<!--  form2 끝 -->

</div>
  <div class="three">

<!--  form3시작 -->
<h1>관리자 페이지</h1>
<form action="/movie/insert_actor.do"method="GET" id="user_form">

<span><input type="text" placeholder="배우이름을 입력하시오" name="actor_name"></span>
<button id="insert_actor">insert_actor</button>
</form>
	


<!--  form3끝 -->
</div>
  <div class="four">
<!--  form4시작 -->
<h1>예약넣기</h1>
<br/>
<form action="/movie/insertBooking.do" method="GET" id="booking_form">
<span><input type="text" placeholder="영화번호를 입력하시오" name="booking_no"></span>
<span><input type="text" placeholder="결제번호을 입력하시오" name="payment_no"></span>
<span><input type="text" placeholder="영화번호을 입력하시오" name="movie_no"></span>
<span><input type="text" placeholder="극장번호을 입력하시오" name="theater_no"></span>
<span><input type="text" placeholder="아이디을 입력하시오" name="user_id"></span>
<div><input type="radio" placeholder="쿠폰을 입력하시오" name="bk_usecoupon" id="butn"></div>
 --><button id="insert_booking">예매 넣기</button>
</form>

</span>
<!--  form4끝 -->
</div>
  <div class="five">
<!-- form5시작 -->
<div>회원삭제</div>
 <form action="/movie/deleteUser.do" method="post" id="userdelete_form">
 <input type="text" name="id" value="${id} }">
 <input type="submit">제출
 </form>	
 <!-- form5 끝 -->
 </div>
  <div class="six">
  <!-- form6시작 -->
<div>영화삭제</div>
<a href="/movie/view/jsp/selectMovie.jsp">영화삭제페이지로가기</a>
<div>영화삭제</div>
 <!-- form6 끝 -->
  <!-- form7 시작 -->
<div>영화정보 변경</div>
 <form action="/movie/updateMovie.do" method="post" id="userdelete_form">
 <input type="text" name="id" value="${id}">
 <input type="submit">제출
 </form>	
 <!-- form7 끝 --></div>
</div>



 
<jsp:include page="../footer.jsp" ></jsp:include> -
</body>
</html>