<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		$('button#to_myPage').click(function() {
			document.location.href = '/movie/insert_movie.do';

		}),
		//영화넣기
		$('button#insert_movie').click(function() {
			document.location.href = '/movie/insert_movie.do';

		}),
		//배우넣기
		$('button#insert_actor').click(function() {
			document.location.href = '/movie/insert_actor.do';

		}),
		//에매내역넣기
		$('button#insert_booking').click(function() {
			//document.location.href='/movie/insertBooking.do';
			form.submit();

		});

	});
</script>
</head>
<body>

	<jsp:include page="../gnb.jsp"></jsp:include>
	<!-- 어드민에는 
영화관리 CRUD
유저관리	CRUD
스토어관리	CRUD
그러면 3가지 탭을 만들기

  -->
	<div class="wrapper">
		<div class="one"></div>
		<div class="two">

			<!--  form2 시작 -->
			<h1>영화배우넣기</h1>
			<form action="/movie/insert_actor.do" method="GET" id="actor_form">

				<span><input type="text" placeholder="배우이름을 입력하시오" name="actor_name"></span>
				<button id="insert_actor">insert_actor</button>
			</form>

			<!--  form2 끝 -->

		</div>
		<div class="three">

			<!--  form3시작 -->
			<h1>관리자 페이지</h1>
			<form action="/movie/insert_actor.do" method="GET" id="user_form">

				<span><input type="text" placeholder="배우이름을 입력하시오" name="actor_name"></span>
				<button id="insert_actor">insert_actor</button>
			</form>



			<!--  form3끝 -->
		</div>
		<div class="four">
			<!--  form4시작 -->
			<h1>예약넣기</h1>
			<br />
			<form action="/movie/insertBooking.do" method="GET" id="booking_form">
				<span><input type="text" placeholder="영화번호를 입력하시오" name="booking_no"></span> <span><input type="text" placeholder="결제번호을 입력하시오" name="payment_no"></span> <span><input
					type="text" placeholder="영화번호을 입력하시오" name="movie_no"
				></span> <span><input type="text" placeholder="극장번호을 입력하시오" name="theater_no"></span> <span><input type="text" placeholder="아이디을 입력하시오" name="user_id"></span>
				<div>
					<input type="radio" placeholder="쿠폰을 입력하시오" name="bk_usecoupon" id="butn">
				</div>
				-->
				<button id="insert_booking">예매 넣기</button>
			</form>

			</span>
			<!--  form4끝 -->
		</div>
		<div class="five">
			<!-- form5시작 -->
			<div>회원삭제</div>
			<form action="/movie/deleteUser.do" method="post" id="userdelete_form">
				<input type="text" name="id" value="${id} }"> <input type="submit">제출
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
				<input type="text" name="id" value="${id}"> <input type="submit">제출
			</form>
			<!-- form7 끝 -->
		</div>
	</div>
	<button id="selectUser">
		<a href="/movie/selectUser.do">유저 테이블 가져오기</a>
	</button>


	<table class="nostyle">

		<tr>
			<th>번호</th>
			<th>체크</th>
			<th>유저 ID</th>
			<th>유저 비밀번호</th>
			<th>이름</th>
			<th>핸드폰 번호</th>
			<th>유저 생일</th>
			<th>유저 이메일</th>
			<th>성별</th>
			<th>수정</th>
			<th>삭제
			<th>
		</tr>
		<c:forEach var="i" items="${AllUserList}" varStatus="cnt">
			<tr>
				<td><c:out value="${cnt.count }" /></td>
				<td><input type="radio" VALUE="${i.USERID }"></td>
				<td>${i. USERID}</td>
				<td>${i. USERPW}</td>
				<td>${i. USERNAME}</td>
				<td>${i. USERTEL}</td>
				<td>${i. USERBIRTH}</td>
				<td>${i. USEREMAIL}</td>
				<td>${i. USERGENDER}</td>
				<td><input type="button" value="수정"></td>
				<td><input type="button" value="삭제"></td>

			</tr>
		</c:forEach>
	</table>


	<button id="selectStore">
		<a href="/movie/SelectAllProduct.do">상품 테이블 가져오기</a>
	</button>
	<table class="nostyle">

		<tr>
			<th>번호</th>
			<th>체크</th>
			<th>상품코드</th>
			<th>제품명</th>
			<th>제품 구성품</th>
			<th>가격</th>
			<th>카테고리</th>
			<th>이미지</th>
			<th>판매율</th>
			<th>수정
			<th>
			<th>삭제
			<th>
		</tr>

		<c:forEach var="i" items="${AllProductList }" varStatus="cnt">
			<tr>
				<td><c:out value="${cnt.count }" /></td>
				<td><input type="radio" VALUE="${i.PNO}"></td>
				<td>${i. PNO}</td>
				<td>${i. PNAME}</td>
				<td>${i. PCONTENTS}</td>
				<td>${i. PPRICE}</td>
				<td>${i. PCATEGORY}</td>
				<td>${i. PIMG}</td>
				<td>${i. PSALESRATE}</td>

				<td><input type="button" value="수정"></td>
				<td><input type="button" value="삭제"></td>

			</tr>
		</c:forEach>
	</table>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>