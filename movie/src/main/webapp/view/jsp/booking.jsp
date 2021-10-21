<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset='utf-8'>
        <title>Page Title</title>
        <link rel="stylesheet" href="/movie/view/css/booking.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     
  });
</script>
    </head>
    <body>
        <!-- 상단 선택되면 불들어오는곳 -->
        <div class="select_check">
                <span class="click">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                    	날짜선택
                </span>
                <span class="">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                    	영화선택
                </span>
                <span class="click">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                  	  극장선택
                </span>
                <span class="">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                    	시간선택
                </span>
                <span class="click">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                   	 좌석선택
                </span>
                <span class="click">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                    결제
                </span>
            </div>
        <!-- 상단 선택되면 불들어오는곳 끝 -->
        <!-- 메인 시작 -->
        <div class="booking_main">
            <!-- 상단 현재시각 -->
            <div class="booking_current_time">
                <div>현재시각</div>
                <b>2021.01.01 PM 10:23</b>
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
                                    <button type="button" class="btn">
                                        <span>8월&nbsp;</span>
                                        <span>23일&nbsp;</span>
                                        <span>일</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn_on">
                                        <span>8월&nbsp;</span>
                                        <span>23일&nbsp;</span>
                                        <span>일</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn">
                                        <span>8월&nbsp;</span>
                                        <span>23일&nbsp;</span>
                                        <span>일</span>
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
                            <ul>
                                <li>
                                    <button type="button" class="btn">
                                        <span><img src="/movie/view/img/19.png">&nbsp;</span>
                                        <span>모가디슈</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn">
                                        <span><img src="/movie/view/img/15.png">&nbsp;</span>
                                        <span>모가디슈</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn">
                                        <span><img src="/movie/view/img/12.png">&nbsp;</span>
                                        <span>모가디슈</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn">
                                        <span><img src="/movie/view/img/all.png">&nbsp;</span>
                                        <span>모가디슈</span>
                                    </button>
                                </li>
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
                            <ul>
                                <li>
                                    <button type="button" class="btn">
                                        <span>서울(30)&nbsp;</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn_on2">
                                        <span>경기(10)&nbsp;</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn">
                                    <span>강원(6)&nbsp;</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn">
                                    <span>강원(6)&nbsp;</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn">
                                    <span>강원(6)&nbsp;</span>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="booking_theater">
                    <div class="middle_field_2_2">
                        <span class="selecter_name">&nbsp;</span>
                        <div class="list">
                            <ul>
                                <li>
                                    <button type="button" class="btn">
                                        <span>강남&nbsp;</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="btn_on">
                                        <span>동대문&nbsp;</span>
                                    </button>
                                </li>
                                </li>
                                    <button type="button" class="btn">
                                    <span>상암월드컵경기장&nbsp;</span>
                                    </button>
                                </li>
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
                            <ul>
                                <li>
                                    <button type="button" class="time_btn">
                                        <span class="time">09:10</span>
                                        <span class="theater">역삼쌍용용죽겠지점</span>
                                        <span class="possible_now">10</span>
                                        <span class="all">/ 150</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="time_btn on">
                                        <span class="time">09:10</span>
                                        <span class="theater">강남대로변두리점</span>
                                        <span class="possible_now">10</span>
                                        <span class="all">/ 150</span>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 예약시간끝 -->
            </div>
            <!-- 예약 1번끝-->
            <!-- 예약 2번 시작-->
            <div class="seat_selecter ">
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
                            <button type="button" class="seat_row" style="position:absolute; top:360px; left: 150px;">A</button>
                            <button type="button" class="seat_number common" style="position:absolute; top:360px; left: 200px;">1</button>
                            <button type="button" class="seat_number choice" style="position:absolute; top:360px; left: 230px;">2</button>
                            <button type="button" class="seat_number finish" style="position:absolute; top:360px; left: 260px;">x</button>
                        </div>
                        <div class="seat_row_wrapping">
                            <button type="button" class="seat_row" style="position:absolute; top:390px; left: 150px;">B</button>
                            <button type="button" class="seat_number common" style="position:absolute; top:390px; left: 200px;">1</button>
                            <button type="button" class="seat_number choice" style="position:absolute; top:390px; left: 230px;">2</button>
                            <button type="button" class="seat_number finish" style="position:absolute; top:390px; left: 260px;">x</button>
                        </div>
                    </div>
                </div>
                <!-- 2번 좌측끝-->
                <!-- 2번 우측-->
                <span class="seat_info" style="margin-left: 20px;">정보</span>
                <div class="show_box">
                    <div class="show_box_left">
                        <img src="/movie/view/img/pos1.png" style="width:170px; margin-left: 20px; margin-top: 20px; ">
                    </div>
                    <div class="show_box_right">
                        <div style="border-bottom: 0.1mm solid #d0d0d0; padding: 10px 10px 20px 0px ; color: #ffffff; font-size: 15pt;"><img src="/movie/view/img/19.png" style="width: 15px; margin-right: 5px;">모가디슈</div>
                        <div style="padding-top: 20px; color: #bdbec4; font-size: 13pt; ">2021.08.23(금)</div>
                        <div style="color: #bdbec4; font-size: 13pt; ">10:20~11:50</div>
                        <div style="color: #bdbec4; font-size: 13pt; ">월계 3관 / C1,C2</div>
                        <div style="padding-bottom: 30px;color: #bdbec4; font-size: 13pt;">성인 2인</div>
                        <span style=" color: #bdbec4; font-size: 13pt; ">최종결제금액</span>
                        <span style=" color: #49addc; font-size: 13pt; font-weight: bold;"> 20000원</span>
                    </div>
                    <div id="pay_btn">결제하기</div>
                    <div id="rollback_btn">이전</div>
                </div>
                
            </div>
        </div>
    </body>
</html>