<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<link rel="stylesheet" href="/movie/view/css/adminpageTest.css">
<title>관리자 페이지</title>
 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("button#hot").click(function(){
		      var key="hot";
		      $("button").removeClass("store_click_on");
		      $("button#hot").addClass("store_click_on");
		      ajaxRequest('/movie/store/main.do',{Kategorie:key},'json');
		   });
		     
		     $("button#ticket").click(function(){
		      var key="ticket";
		      $("button").removeClass("store_click_on");
		      $("button#ticket").addClass("store_click_on");
		      ajaxRequest('/movie/store/main.do',{Kategorie:key},'json');
		   });
		     
		     $("button#goods").click(function(){
		      var key="goods";
		      $("button").removeClass("store_click_on");
		      $("button#goods").addClass("store_click_on");
		      ajaxRequest('/movie/store/main.do',{Kategorie:key},'json');
		   });		
	});

</script>
</head>
<body>
<jsp:include page="../gnb.jsp" ></jsp:include>
   <div id="wrap">
        <div class="side">
        	<button>마이페이지 관리</button><br>
        	<button>영화 관리</button><br>
        	<button>스토어 관리</button><br>
       
		</div>
        <div class="contents_header"><h1>관리자페이지입니다</h1></div>
        <div class="contents_main">
		<h1>영화테이블넣기</h1>
      
<form action="/movie/insert_movie.do"method="GET" id="movie_form">
<span><!-- <input type="hidden" placeholder="영화번호를 입력하시오" name="movie_no"> --></span>
<!-- <span><input type="text" placeholder="제목을 입력하시오" name="movie_no"></span>
 --><span><input type="text" placeholder="제목을 입력하시오" name="movie_title"></span>
<span><input type="text" placeholder="포스터를 고르세요" name="movie_poster"></span>
<span><input type="date" placeholder="개봉일을 입력하시오" name="movie_release"></span>
<button id="insert_movie" class="form_btn">영화 넣기</button>
</form>

<div class="movie">
<!--  form1 끝 -->


<!--  form2 시작 -->
<h1>영화배우넣기</h1>
<form action="/movie/insert_actor.do"method="GET" id="actor_form">

<span><input type="text" placeholder="배우이름을 입력하시오" name="actor_name"></span>
<button id="insert_actor" class="form_btn">insert_actor</button>
</form>

<!--  form2 끝 -->


</div>
  <!-- form6시작 -->
<div>영화삭제</div>
<a href="/movie/view/jsp/selectMovie.jsp">영화삭제페이지로가기</a>
 <!-- form6 끝 -->
  <!-- form7 시작 -->
<div>영화정보 변경</div>
 <form action="/movie/updateMovie.do" method="post" id="userdelete_form">
 <input type="text" name="id" value="${id}">
 <button id="update_movie" class="form_btn">제출
  </form>	
  <br>
 <!-- form7 끝 -->
<!-- 영화 관련 끝 -->
  <div class="reserve">
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
 --><button id="insert_booking" class="form_btn">예매 넣기</button>
</form>

</span>
<!--  form4끝 -->
</div>
  <div class="user">
<!-- form5시작 -->
<div>회원삭제</div>
 <form action="/movie/deleteUser.do" method="post" id="userdelete_form">
 <input type="text" name="id" value="${id} }">
 <button id="delete_user" class="form_btn">제출
 </form>	
 <!-- form5 끝 -->
 </div>
 


	</div>
	</div>
	<jsp:include page="../footer.jsp" ></jsp:include>
</body>
</html>