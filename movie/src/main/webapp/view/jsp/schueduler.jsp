<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<!-- 2021-10-05 수정  -->
<html>

<head>
<meta charset='EUC-KR'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>영끌</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!--메인 CSS-->
<link rel="stylesheet" href="/movie/view/css/schuduler.css">
<!-- 영화별/극장별 클릭시 이미지 변경 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>


</head>

<body>

	<div class="wrapping">
		<!--gnb 시작-->
		<div class="gnb">
			<div class="wrapping">
				<div class="gnblogo" id="gnblogoid">
					<a href="/"> <img src="/movie/view/img/logo.png">
					</a>
					<ul>
						<li><img src="/movie/view/img/loginbutton.png"
							onclick="loginpopup()"></li>
						<li><a href=" ../html/join.html"><img
								src=" /movie/view/img/joinbutton.png"></a></li>
					</ul>
				</div>
				<div class="menu">
					<ul>
						<li>영화</li>
						<li>상영시간표</li>
						<li onclick="wow()"><img src=" /movie/view/img/gnbbutton.png"
							onmouseover="this.src='/movie/view/img/gnbbutton_hover.png'"
							onmouseout="this.src='/movie/view/img/gnbbutton.png'"></li>
						<li>스토어</li>
						<li>고객센터</li>
					</ul>
				</div>
			</div>
		</div>
		<!--gnb 끝-->

		<!--content 시작-->
		<div class="content">

			<!-- 메인 시작 -->

			<!-- 상단 부분 -->
			<div class="movie_theater_top">

				<!-- 영화별/극장별 시작 -->

				<!-- 영화별 -->

				<div class="movie_theater_list">

					<div class="listback_movie">
						<button type="button" class="btn_list">
							<img src="/movie/view/img/movie_list.png">
						</button>



					</div>
					<!-- 극장별 -->

					<div class="listback_theater">
						<button type="button" class="btn_list">
							<img src=" /movie/view/img/theater_list.png">
						</button>
					</div>

				</div>

				<!-- 영화별/극장별 끝 -->
				<!-- 전체 영화리스트 시작  -->

				<div class="booking_all_movie">
					<span class="selecter_name"></span>

					<!--영화리스트-->
					<div class="booking_movie_list">

						<div class="list">
							<ul>
								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/19.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>
								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/15.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>
								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/12.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>
								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>
								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>
								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>

								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>

								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>

								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>
								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>

								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>
								<li>
									<button type="button" class="btn">
										<span><img src="/movie/view/img/all.png">&nbsp;</span> <span
											id="moive_font">모가디슈</span>
									</button>
								</li>





							</ul>
						</div>


					</div>

					<!-- 전체 영화리스트 끝  -->

					<!-- 영화 포스터 -->
					<div style="float: left;" id="movie_list_image">
						<img class="movie_poster" src="/movie/view/img/voice.jpg">
					</div>
					<!-- 영화 포스터 끝 -->


				</div>
			</div>

			<!-- 중간 부분 ( 날짜 ) -->
			<div class="movie_theater_middle">
				<div class="movie_slide_list">
					<ul class="list_ul">
						<li id class="list_li"><a href=""> <span><img
									src="/movie/view/img/theater_scroll_back.png"
									class="list_button"></span>
						</a></li>
						<li class="list_li" id="timeMain_year_month">2021.09</li>
						<span class="list_li_day" id="list_li_day_prev">1
							<li class="list_li_block" id="list_li_day_prev">월</li>
						</span>
						<span class="list_li_day" id="list_li_day_prev">2
							<li class="list_li_block" id="list_li_day_prev">화</li>
						</span>
						<span class="list_li_day" id="list_li_day_prev">3
							<li class="list_li_block" id="list_li_day_prev">수</li>
						</span>
						<span class="list_li_day" id="list_li_day_prev">4
							<li class="list_li_block" id="list_li_day_prev">목</li>
						</span>
						<span class="list_li_day" id="list_li_day_prev">5
							<li class="list_li_block" id="list_li_day_prev">금</li>
						</span>
						<span class="list_li_day" id="list_li_day_weekend">6
							<li class="list_li_block" id="list_li_day_weekend">토</li>
						</span>
						<span class="list_li_day" id="list_li_day_weekend">7
							<li class="list_li_block" id="list_li_day_weekend">일</li>
						</span>
						<span class="list_li_day">8
							<li class="list_li_block">월</li>
						</span>
						<span class="list_li_day">9
							<li class="list_li_block">화</li>
						</span>
						<span class="list_li_day">10
							<li class="list_li_block">수</li>
						</span>
						<span class="list_li_day">11
							<li class="list_li_block">목</li>
						</span>
						<span class="list_li_day">12
							<li class="list_li_block">금</li>
						</span>
						<span class="list_li_day" id="list_li_day_weekend">13
							<li class="list_li_block" id="list_li_day_weekend">토</li>
						</span>
						<span class="list_li_day" id="list_li_day_weekend">14
							<li class="list_li_block" id="list_li_day_weekend">일</li>
						</span>
						<li class="list_li"><a href=""> <span><img
									src="/movie/view/img/theater_scroll_next.png"
									class="list_button"></span>
						</a></li>
					</ul>
				</div>

			</div>

			<!-- 마지막 부분 -->
			<div class="movie_theater_bottom">
				<div class="movie_theater_bottom_schedule">
					<div class="bottom_schedule_box">
						<img src="/movie/view/img/19.png" class="bottom_schedule_img"
							style="float: left;"> <span class="bottom_schedule_info"
							style="float: left;"> &nbsp; 모가디슈 </span> <span
							class="bottom_schedule_info" style="float: right;">/
							상영시간190분</span> <span class="bottom_schedule_info" style="float: right;"
							id="ssangyoung">상영중</span>
					</div>

				</div>
			</div>

			<div class="gwan" style="margin-top: 200px;">
				<div class="gwan_seok">
					<span id="gwan_seok_span">2관</span> <span
						class="gwan_list_li_block">총 103석</span>
				</div>

				<div class="gwan_ND">
					<span>2D</span>
				</div>

				<div class="gwan_time">
					<ul>
						<li class="gwan_time_li"><span>10:10</span> <span
							class="list_li_block" id="li_seok">66석</span></li>
						<li class="gwan_time_li"><span>17:00</span> <span
							class="list_li_block" id="li_seok">66석</span></li>
						<li class="gwan_time_li"><span>19:25</span> <span
							class="list_li_block" id="li_seok">23석</span></li>
					</ul>
				</div>

			</div>

			<div class="gwan" id="gwan_border">
				<div class="gwan_seok">
					<span id="gwan_seok_span">2관</span> <span
						class="gwan_list_li_block">총 103석</span>
				</div>

				<div class="gwan_ND">
					<span>2D</span>
				</div>

				<div class="gwan_time">
					<ul>
						<li class="gwan_time_li"><span>10:10</span> <span
							class="list_li_block" id="li_seok">66석</span></li>
						<li class="gwan_time_li"><span>17:00</span> <span
							class="list_li_block" id="li_seok">66석</span></li>
						<li class="gwan_time_li"><span>19:25</span> <span
							class="list_li_block" id="li_seok">23석</span></li>
					</ul>
				</div>

			</div>

			<div class="gwan" id="gwan_border" style="margin-top: -3px;">
				<div class="gwan_seok">
					<span id="gwan_seok_span">2관</span> <span
						class="gwan_list_li_block">총 103석</span>
				</div>

				<div class="gwan_ND">
					<span>2D</span>
				</div>

				<div class="gwan_time">
					<ul>
						<li class="gwan_time_li"><span>10:10</span> <span
							class="list_li_block" id="li_seok">66석</span></li>
						<li class="gwan_time_li"><span>17:00</span> <span
							class="list_li_block" id="li_seok">66석</span></li>
						<li class="gwan_time_li"><span>19:25</span> <span
							class="list_li_block" id="li_seok">23석</span></li>
						<li class="gwan_time_li"><span>20:25</span> <span
							class="list_li_block" id="li_seok">23석</span></li>
						<li class="gwan_time_li"><span>21:25</span> <span
							class="list_li_block" id="li_seok">23석</span></li>
					</ul>
				</div>

			</div>







		</div>
		<!--content 끝-->
		<!--footer 시작-->
		<div class="footer">
			<div class="wrapping">
				<span class="footercontent"><img src=" img/logo.png"></span>
				<p>COPYRIGHT YoungGgleJoongAng, Inc. All rights reserved</p>
				<p>서울특별시 노원구 월계동 ARS 0914-0924</p>
				<p>대표자명 박원우 · 개인정보보호책임자 박원우 · 사업자등록번호 919-09-090909 · 통신판매업신고번호
					제 88256호</p>
			</div>
		</div>
		<!--footer 끝-->
</body>
<script type="text/javascript" src="schudeuler_js.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(".btn_list").click(function() {
		$(".btn_list").removeClass("active");
		$(this).addClass("active");
	});

	$('input').click(function() {
		$('input').removeClass("active");
		$(this).addClass("active");
	});
</script>


</html>