<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
		<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!DOCTYPE html>
			<html>
			<head>

				<meta charset='utf-8'>
				<title>Page Title</title>
				<link rel="stylesheet" href="/movie/view/css/booking.css">
				<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
				<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script type="text/javascript" src="/movie/resources/js/MovieJs.js"></script>

				<script type="text/javascript">

					var clickDate = "";
					var clickTown = "";
					var clickMovie = "";
					var clickTime = "";

					var selectSeNo = "";
					
					//좌석 선택 후 오른쪽 정보 
					var summaryName ="";
					var summaryPoster = "";
					var summaryDate = "";
					var summaryTheater ="";
					var summaryTotalPrice ="";
					
					//선택된 좌석의 갯수를 저장하고 있는 변수
					var choiceSeNo = (document.getElementsByClassName('choice'));

					//시계

					function printTime() {

						var clock = document.getElementById("clock2");

						var now = new Date();

						clock.innerHTML = now.getFullYear() + "년  " + (now.getMonth() + 1)
							+ "월  " + now.getDate() + "일  " + now.getHours() + "시  "

							+ now.getMinutes() + "분  " + now.getSeconds() + "초  ";

						// setTimeout함수를 통해 원하는 함수를 1초간격으로 출력해줌

						setTimeout("printTime()", 1000);

					}

					window.onload = printTime;

					//시계

					// 요일, 영화 눌리면 값 저장 
					$(function () {
						listMethod('/movie/nameList.do', {select: 'movieList'}, 'json', 'moiveName');
						listMethod('/movie/nameList.do', {select: 'cityList'}, 'json', 'cityName');
						listMethod('/movie/nameList.do', {select: 'townList'}, 'json', 'townName');
						function listMethod(url, data, datatype, methodName) {
							$.ajax({
								url: url,
								type: 'POST',
								data: data,
								dataType: datatype,

								success: function (v) {
									if (methodName == "moiveName") {
										movieNameList(v);
									} else if (methodName == "cityName") {
										cityNameList(v);
									} else if (methodName == "townName") {

										townNameList(v);
									} else if (methodName == "selectName") {

										timeNameList(v);
									}
									//좌석 선택부분
									else if (methodName == "selectTime") {
										for (var i = 1; i <= 10; i++) {
											seatNameList(v, i);
										}
											seatMovieList(v);

									}

									else if (methodName == "insertBook") {
										alert("예매가 성공되었습니다!!");
										alert(v);
									}

								},
								error: function (e) {
									console.log("실패");
									console.log("error" + e);
								}
							});
						}

						/* 영화 이름 불러오기 */
						function movieNameList(v) {
							var temp = "";

							$.each(v,function (index, dom) {
										temp += "<li>";
										temp += "<button type=\"button\" class=\"btn\" >";
										temp += "<span ><img src=\"/movie/view/img/" + dom.watchGradeNm + ".png\"></span> <span id=\"movieNameList\">"
											+ dom.movieNm + "</span>";
										temp += "</button>";
										temp += "</li>";
									});
							$(".mList").html(temp);
							evtbind();
						}

						/* 지역 이름 불러오기 */
						var tempCity = "";

						function cityNameList(v) {
							$.each(v, function (index, dom) {
								tempCity += "<li>";
								tempCity += "<button type=\"button\" class=\"btn\">";
								tempCity += "<span id=\"cityNameList\" >" + dom.theaterCity
									+ "</span>";
								tempCity += "</button>";
								tempCity += "</li>";

							});
							$(".theaterCityList").html(tempCity);

						}

						/* 도시 이름 불러오기 */
						function townNameList(v) {
							var tempTown = "";
							$.each(v, function (index, dom) {
								tempTown += "<li>";
								tempTown += "<button type=\"button\" class=\"btn\">";
								tempTown += "<span id=\"townNameList\">" + dom.theaterTown
									+ "</span>";
								tempTown += "</button>";
								tempTown += "</li>";
							});
							$(".theaterTownList").html(tempTown);

							evtbind();
						}


						/*  시간표 불러오기 */
						function timeNameList(v) {

							var tempTime = "";
							$.each(v, function (index, dom) {
								tempTime += "<li >";
								tempTime += "<button type=\"button\" class=\"time_btn\">";
								tempTime += "<span id=\"bookingTimeNo\" hidden>"+ dom.bookingTimeNo + "</span>";
								tempTime += "<span class=\"time\">" + dom.bookingTimeStart	+ "</span> <span class=\"theater\">" + dom.bookingGwan
								+ "</span> <span class=\"possible_now\">"
									+ dom.bookingTheaterroomseat
									+ "</span> <span class=\"all\">/ 20</span>";
								tempTime += "</button>";
								tempTime += "</li>";
							

							});
							$("ul#selectTime").html(tempTime);
							evtbind();

						}

						var i = 1;
						var tempSeat = "";
						var k = 350;
						/* 좌석 불러오기 */
						function seatNameList(v, i) {

							$.each(v,function (index, dom) {
										console.log(dom["bookingSeatNo" + i]);
										var seatSelect = "";
										if (dom["bookingSeatNo" + i] == "t") {
											//선택된 좌석은 검정색으로 class추가
											var seatSelect = "finish";
										}
										//선택 안된 좌석은 선택가능한 모습으로 
										else if (dom["bookingSeatNo" + i] == "f") {
											var seatSelect = "common";
										}
										tempSeat += "<button type=\"button\" class=\"seat_number " + seatSelect + "\"  id =\"" + i + "\"style=\"position: absolute; top: 360px; left: " + k + "px;  \"> "
											+ i + "</button>";
										k += 30;
									});
							$(".seat_row_wrapping").html(tempSeat);
							evtbind();

						}

						var i = 1;
						var tempSeat = "";
						var k = 350;
						/* 좌석 불러오기 (뿌려지는것)*/
						function seatNameList(v, i) {

							$.each(v,function (index, dom) {
										console.log(dom["bookingSeatNo" + i]);
										var seatSelect = "";

										if (dom["bookingSeatNo" + i] == "t") {
											var seatSelect = "finish";
										} else if (dom["bookingSeatNo" + i] == "f") {
											var seatSelect = "common";
										}
										tempSeat += "<button type=\"button\" class=\"seat_number " + seatSelect + "\"  id =\""+i+"\" style=\"position: absolute; top: 360px; left: " + k + "px;  \"> "
											+ i + "</button>";
										k += 30;
									});
							$(".seat_row_wrapping").html(tempSeat);
							evtbind();
						}
						
						// 좌석에서 영화정보 불러오기
						function seatMovieList(v) { 
						    var sideInfoTemp = "";
						    var sidePoster ="";
							$.each(v,function(index, dom) {   
								sidePoster += "<img src=\"/movie/view/img/"+ dom.bookingMovieNo+".jpg\" style=\"width: 170px; margin-left: 20px; margin-top: 20px;\">";
								sideInfoTemp += "<div style=\"border-bottom: 0.1mm solid #d0d0d0; padding: 10px 10px 20px 0px; color: #ffffff; font-size: 15pt;\">";
								sideInfoTemp += "<img src=\"/movie/view/img/"+ dom.bookingWatchgradenm+".png\" style=\"width: 15px; margin-right: 5px;\">" + dom.bookingMovieName + " </div>";
								sideInfoTemp += "<div style=\"padding-top: 20px; color: #bdbec4; font-size: 13pt;\">상영일시: " + dom.bookingDate+ "</div>";
								sideInfoTemp += "<div style=\"color: #bdbec4; font-size: 13pt;\">시작시간: "+ dom.bookingTimeStart+"</div>";
								sideInfoTemp += "<div style=\"color: #bdbec4; font-size: 13pt;\"> 상영관: "+dom.bookingTown +" </div>";
								sideInfoTemp += "<div style=\"padding-bottom: 30px; color: #bdbec4; font-size: 13pt;\">성인</div>";
								sideInfoTemp += "<span style=\"color: #bdbec4; font-size: 13pt\">최종결제금액</span> ";
								sideInfoTemp += "<span style=\"color: #49addc; font-size: 13pt; font-weight: bold;\"> 20000원</span>"; 
							});
							$(".show_box_right").html(sideInfoTemp);
							$(".show_box_left").html(sidePoster);
						
						}

						/* 클릭시 값 저장 */
						/* bind function */
						function evtbind() {

							$("span#movieNameList").click(function () {
								clickMovie = $(this).text();
								
								$("#movieClick").addClass("barclick");
								console.log(clickMovie);

							});

							$("span#dayList").click(function () {
								clickDate = $(this).text();	
								$("#dayClick").addClass("barclick");
								console.log(clickDate);

							});

							$("span#townNameList").click(function () {
								clickTown = $(this).text();
								console.log(clickTown);
								
								$("#teatherClick").addClass("barclick");
								allClickEvent();
							});
							
							$(".time_btn").click(function () {
								clickTime = $(this).find("#bookingTimeNo").text();
								//clickTown = $(this).text();
								console.log(clickTime);
								$(".booking_selecter").addClass("hidden");
								$(".seat_selecter").removeClass("hidden");
								
								
								$("#timeClick").addClass("barclick");

								allClickEvent();
							});

							/*좌석 선택은 3가지 상태가 존쟈
							  선택 전(common) 선택 중(choice) 선택 끝  */
							$("button.seat_number").click(function () {
								
								
								$("#seatClick").addClass("barclick");

								//hasClass는 현재 클래스가 뭐있는지 알려주는 클래스
								console.log(choiceSeNo);
								if ($(this).hasClass("common")) {
									$(this).removeClass("common");
									$(this).addClass("choice");

								} else if ($(this).hasClass("choice")) {
									$(this).removeClass("choice");
									$(this).addClass("common");
								}
								if (choiceSeNo.length > 2) {
									alert("2명까지만 가능합니다.");
									$(this).removeClass("choice");
									$(this).addClass("common");

								}

							});


						}
						/* 결제하기 눌렀을 때 */
						$("div#pay_btn").click(function () {

							var selectSeNo1 = choiceSeNo[0];
							var selectSeNo2 = choiceSeNo[1];
							var selectSeNo1Name = "";
							var selectSeNo2Name = "";

							console.log(selectSeNo1);
							console.log(selectSeNo2);


							if (selectSeNo2 != undefined) {
								selectSeNo1Name = "bookingSeatNo" + selectSeNo1.id;
								selectSeNo2Name = "bookingSeatNo" + selectSeNo2.id;

								console.log("id값" + selectSeNo1.id);
								console.log("id2값" + selectSeNo2.id);
								console.log(selectSeNo1Name);
								console.log(selectSeNo2Name);
								insertBooking("two", selectSeNo1Name, selectSeNo2Name);
							}
							//하나 선택하면 2번째꺼가 언디파인드
							else if (selectSeNo2 == undefined) {
								selectSeNo1Name = "bookingSeatNo" + selectSeNo1.id;
								console.log("좌석이 하나만 일때: " + selectSeNo1Name);
								insertBooking("one", selectSeNo1Name);
							}

							/* var selectSeNo1 = "bookingSeatNo"+choiceSeNo[0].id;
							var selectSeNo2 = "bookingSeatNo"+choiceSeNo[1].id; */

							console.log("id값: " + id);
							console.log(clickMovie + " " + clickDate + " " + clickTown + " " + clickTime);

						});
						// 선택된 좌석 수에 따른 예매 진행	
						function insertBooking(seatCount, selectSeNo1Name, selectSeNo2Name) {
							var userId = "${id}";
							console.log("insertBooking ::::" + seatCount);
							console.log(selectSeNo1Name);
							console.log(selectSeNo2Name);

							if (seatCount == "one") {
								listMethod('/movie/insertBooking.do', { time: clickTime, seat1: selectSeNo1Name, userId: userId }, 'json', 'insertBook');
							}
							else if (seatCount == "two") {
								listMethod('/movie/insertBooking.do', { time: clickTime, seat1: selectSeNo1Name, seat2: selectSeNo2Name, userId: userId }, 'json', 'insertBook');
							}
						}

						$("span#dayList").click(function () {
							clickDate = $(this).text();
							
							console.log(clickDate);

						});

						$("span#townNameList").click(function () {
							clickTown = $(this).text();
							console.log(clickTown);
							
							allClickEvent();
						});

						$(".time_btn").click(function () {
							clickTime = $(this).find("#bookingTimeNo").text();
							//clickTown = $(this).text();
							console.log(clickTime);
							$(".booking_selecter").addClass("hidden");
							$(".seat_selecter").removeClass("hidden");

							allClickEvent();
						});

						$(".seat_number choice").click(function () {
							console.log("button.seat_number choice");
							$(".seat_number choice").removeClass("choice");
							$(".seat_number ").addClass("finish");

						});

						/*시간표 앞3가지 요소들이 선택이 되었는지확인하는 함수*/
						function allClickEvent() {
							if (clickMovie != null && clickDate != null && clickTown != null && clickTime == "") {

								listMethod('/movie/selectBookList.do', {
									day: clickDate,
									town: clickTown,
									movie: clickMovie
								}, 'json', 'selectName');

							} else if (clickMovie != null && clickDate != null && clickTown != null && clickTime != "") {
								console.log("clickTime = Notnull");
								listMethod('/movie/selectSeatList.do', {
									day: clickDate,
									town: clickTown,
									movie: clickMovie,
									time: clickTime
								}, 'json', 'selectTime');

							}

						}

					});
				</script>


			</head>

			<body>

				<div id="my_Bookmodal">
					<!-- 상단 선택되면 불들어오는곳 -->
					<div class="select_check">
						<span id="dayClick"class=""> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
								<path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
							</svg> 날짜선택
						</span> <span id="movieClick" class=""> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
								<path
									d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
							</svg> 영화선택
						</span> <span id ="teatherClick" class=""> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
								<path
									d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
							</svg> 극장선택
						</span> <span id="timeClick" class=""> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
								<path
									d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
							</svg> 시간선택
						</span> <span id ="seatClick" class=""> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
								<path
									d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
							</svg> 좌석선택
						</span> <span class=""> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
								<path
									d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
							</svg> 결제
						</span>
					</div>
					<!-- 상단 선택되면 불들어오는곳 끝 -->
					<!-- 메인 시작 -->
					<div class="booking_main">
						<!-- 상단 현재시각 -->
						<div class="booking_current_time">
							<div>현재시각</div>
							<b id="clock2" name="currenttime">2021.01.01 PM 10:23</b>
							<img src="/movie/view/img/popupx.png" class="modal_close_btn " id="close_pop">
						</div>
						<!-- 상단 현재시각끝 -->
						<!-- 예약시작 -->
						<div class="booking_selecter ">

							<!-- 예약날짜 -->
							<div class="booking_date">
								<div class="middle_field">
									<span class="selecter_name">날짜</span>
									<div class="list">
										<ul>
											<li>
												<button type="button" class="btn" id="dayButton1">

													<span id="dayList" lang="21/11/03">21/11/03</span>
												</button>
											</li>

										</ul>
									</div>
								</div>
							</div>
							<!-- 예약날짜끝 -->
							<!-- 예약영화 -->
							<div class="booking_movie">
								<div class="middle_field">
									<span class="selecter_name">영화</span>
									<div class="list">

										<ul class="mList">

										</ul>

									</div>
								</div>
							</div>
							<!-- 예약영화끝 -->
							<!-- 예약극장 -->
							<div class="booking_theater">
								<div class="middle_field_2_1">
									<div class="selecter_name">극장</div>
									<div class="list">
										<ul class="theaterCityList">


										</ul>
									</div>
								</div>
							</div>
							<div class="booking_theater">
								<div class="middle_field_2_2">
									<span class="selecter_name">&nbsp;</span>
									<div class="list">
										<ul class="theaterTownList">


										</ul>
									</div>
								</div>
							</div>
							<!-- 예약극장끝 -->
							<!-- 예약시간 -->
							<div class="booking_time">
								<div class="middle_field">
									<span class="selecter_name">시간</span>
									<div class="list">
										<ul id="selectTime">



										</ul>
									</div>
								</div>
							</div>
							<!-- 예약시간끝 -->
						</div>
						<!-- 예약 1번끝-->

						<!-- 예약 2번 시작-->
						<div class="seat_selecter hidden">
							<div class="ghost_box"></div>
							<!-- 2번 좌측 -->
							<span class="seat_info">좌석선택</span>
							<div class="choice_box">
								<div class="choice_person">
									<div class="choice_old">성인</div>
									<div class="count">
										<button type="button" class="down">-</button>
										<button type="button" class="now">0</button>
										<button type="button" class="up">+</button>
									</div>
									<div class="choice_old">청소년</div>
									<div class="count">
										<button type="button" class="down">-</button>
										<button type="button" class="now">0</button>
										<button type="button" class="up">+</button>
									</div>
									<div class="choice_old">우대</div>
									<div class="count">
										<button type="button" class="down">-</button>
										<button type="button" class="now">0</button>
										<button type="button" class="up">+</button>
									</div>
								</div>
								<div class="choice_seat">
									<div id="screen">SCREEN</div>
									<div class="seat_row_wrapping">
										<!-- <button type="button" class="seat_row" style="position: absolute; top: 360px; left: 150px;">A</button> -->
										<!-- 	<button type="button" class="seat_number common" style="position: absolute; top: 360px; left: 200px;">1</button>
						<button type="button" class="seat_number choice" style="position: absolute; top: 360px; left: 230px;">2</button>
						<button type="button" class="seat_number finish" style="position: absolute; top: 360px; left: 260px;">x</button> -->
									</div>

								</div>
							</div>
							<!-- 2번 좌측끝-->
							<!-- 2번 우측-->
							<span class="seat_info" style="margin-left: 20px;">정보</span>
							<div class="show_box">
								<div class="show_box_left">
									
								</div>
								<div class="show_box_right">
									<%-- <div
										style="border-bottom: 0.1mm solid #d0d0d0; padding: 10px 10px 20px 0px; color: #ffffff; font-size: 15pt;">
										<img src="/movie/view/img/19.png" style="width: 15px; margin-right: 5px;">${clickMovie}
									</div>
									<div style="padding-top: 20px; color: #bdbec4; font-size: 13pt;">2021.08.23(금)${clickDate }</div>
									<div style="color: #bdbec4; font-size: 13pt;">${clickTime}</div>
									<div style="color: #bdbec4; font-size: 13pt;">${clickTown } / C1,C2</div>
									<div style="padding-bottom: 30px; color: #bdbec4; font-size: 13pt;">성인 2인</div>
									<span style="color: #bdbec4; font-size: 13pt;">최종결제금액</span> <span
										style="color: #49addc; font-size: 13pt; font-weight: bold;"> 20000원</span> --%>
								</div>
								<div id="pay_btn">결제하기</div>
								<div id="rollback_btn">이전</div>
							</div>
						</div>
						
					
					</div>
				</div>
			</body>

			</html>