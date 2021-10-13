<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible"
	content="width=device-width, initial-scale=1" />
<title>영끌</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--메인 CSS-->
<link rel="stylesheet" href="/movie/view/css/list-poster.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<!--gnb 시작-->
	<jsp:include page="gnb.jsp"></jsp:include>
	<!--gnb 끝-->
	<!--content 시작-->
	<div class="select">
		<div class="list_button" style="height: 60px; margin: auto">
			<button>박스오피스</button>
			<button>현재상영작</button>
			<button>상영예정작</button>
		</div>
		<div class="align-button">
			<img src="/movie/view/img/poster.PNG" />
		</div>
		<div class="movielist">
			<div class="movie_wrapping">
				<div class="movies">
					<div class="movie">
						<img src="/movie/view/img/Harry_Potter1.jpg" />
						<p id="title">HarryPotter1</p>
						<span id="release">2006.09.09</span> <span id="runningtime">152분</span>
						<span id="ratio">예매율 30%</span> <br>
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" class="like" id="like"
							onclick="like()" />
					</div>
					<div class="movie">
						<img src="/movie/view/img/Harry_Potter2.jpg" />
						<p id="title">HarryPotter2</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
					<div class="movie">
						<img src="/movie/view/img/Harry_Potter3.jpg" />
						<p id="title">HarryPotter3</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
					<div class="movie">
						<img src="/movie/view/img/Harry_Potter4.jpg" />
						<p id="title">HarryPotter4</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
				</div>
				<div class="movies">
					<div class="movie">
						<img src="/movie/view/img/Harry_Potter5.jpg" />
						<p id="title">HarryPotter5</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
					<div class="movie">
						<img src="/movie/view/img/Harry_Potter6.jpg" />
						<p id="title">HarryPotter6</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
					<div class="movie">
						<img src="/movie/view/img/월요일이사라졌다.jpeg" />
						<p id="title">월요일이 사라졌다</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
					<div class="movie">
						<img src="/movie/view/img/샹치.jpg" />
						<p id="title">샹치</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
				</div>
				<div class="movies">
					<div class="movie">
						<img src="/movie/view/img/알라딘.jpg" />
						<p id="title">알라딘</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
					<div class="movie">
						<img src="/movie/view/img/1917.png" />
						<p id="title">1917</p>
						<span id="release">2006.09.09</span> <span id="runningtime">80분</span>
						<span id="ratio">예매율 30%</span> <br />
						<button>예매하기</button>
						<img src="/movie/view/img/like.png" id="like" />
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--content 끝-->
	<!--footer 시작-->
	<jsp:include page="footer.jsp"></jsp:include>
	<!--footer 끝-->
</body>
</html>