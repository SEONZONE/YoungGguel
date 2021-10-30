<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset='EUC-KR'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>영끌</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <!--메인 CSS-->
    <link rel="stylesheet" href="/movie/view/css/schueduler.css">
    <!-- 영화별/극장별 클릭시 이미지 변경 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     
  });
</script>

</head>
<body>
    <!--gnb 시작-->
        <div class="gnb">
            <div class="wrapping">
                <div class="gnblogo" id="gnblogoid">
                    <a href="/">
                        <img src="/movie/view/img/logo.png">
                    </a>
                    <ul>
                        <li><img src="/movie/view/img/loginbutton.png" onclick="loginpopup()"></li>
                        <li><a href="/Front/html/join.html"><img src="/movie/view/img/joinbutton.png"></a></li>
                    </ul>
                </div>
                <div class="menu">
                    <ul>
                        <li>영화</li>
                        <li>상영시간표</li>
                        <li onclick="wow()" >
                            <img src="/movie/view/img/gnbbutton.png"
                            onmouseover="this.src='/movie/view/img/gnbbutton_hover.png'"
                            onmouseout="this.src='/movie/view/img/gnbbutton.png'">
                        </li>
                        <li>스토어</li>
                        <li>고객센터</li>
                    </ul>
                </div>
            </div>
        </div>
    <!--gnb 끝-->
    <!--content 시작-->
        <div class="content">
            <div class="wrapping">
                <div id="schuedulbox">
                    <div class="schuedulgroup">
                        <div class="schuedulmovie on">
                            <img src="/movie/view/img/영화별.png" class="btn_img">
                        </div>
                        <div class="schuedultheater off ">
                            <img src="/movie/view/img/극장별.png" class="btn_img">
                        </div>
                    </div>
                    <div class="schuedulnav">
                        <div class="choicer" id="choicer_top">
                            <div>전체영화</div>
                        </div>
                        <div class="choicer" id="choicer_con">
                            <div class="choicer_con_info">
                                <div class="con_name con_nameclick">영화이름</div>
                                <div class="con_name">영화이름조금긴거</div>
                                <div class="con_name">영화이름조금긴거보다</div>
                                <div class="con_name">영화이름조금긴거보다조금더</div>
                                <div class="con_name">영화이름조금긴거보다조금더긴거</div>
                                <div class="con_name">영화이름조금긴거보다조금더긴거보다</div>
                                <div class="con_name">이 위에가 글자수 제한입니다</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                                <div class="con_name">영화이름</div>
                            </div>
                        </div>
                    </div>
                    <div class="selectedposter">
                        <img src="/movie/view/img/pos1.png" id="selectedposterimg">
                    </div>
                </div>
                <div class="selectdate">
                    <div class="selectdateconright">
                    <span>2021.09</span>
                    <img src="/movie/view/img/좌측icon.png" id="controllicon">
                    </div>
                    <div class="date_info">
                        <div class="day day_nameclick">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day day_sun">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day day_sat">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day day_nonmovie">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                        <div class="day">
                            <span>17</span>
                            <span>목</span>
                        </div>
                    </div>
                    <div class="selectdateconrleft">
                        <img src="/movie/view/img/우측icon.png" id="controllicon">
                    </div>
                </div>
                <div class="city">
                    <div class="cityinfo cityinfoclick">서울</div>
                    <div class="cityinfo">경기</div>
                    <div class="cityinfo">인청</div>
                    <div class="cityinfo">대전/충청/세종</div>
                    <div class="cityinfo">부산/대구/경남</div>
                    <div class="cityinfo">광주/전라</div>
                    <div class="cityinfo">강원</div>
                </div>
                <img src="/movie/view/img/좌측icon.png" id="towncontrolliconright">
                <div class="town">
                    <div class="towninfo towninfoclick">강북</div>
                    <div class="towninfo">동대문</div>
                    <div class="towninfo">화곡</div>
                    <div class="towninfo">센트롤</div>
                    <div class="towninfo">마포구</div>
                    <div class="towninfo">송파</div>
                    <div class="towninfo">상암월드컵경기장</div>
                    <div class="towninfo">강북</div>
                </div>
                <img src="/movie/view/img/우측icon.png" id="towncontrolliconleft">
                <div class="schuedulinfo">
                    <div class="theaterbox">
                        <div class="theaternum">1관</div>
                        <div class="theaterseatcount">총 232석</div>
                    </div>
                    <div class="infobox">
                        <div class="scheduledtime">15시30분</div>
                        <div class="remainingseat">12석</div>
                    </div>
                    <div class="infobox">
                        <div class="scheduledtime">15시30분</div>
                        <div class="remainingseat">12석</div>
                    </div>
                    <div class="infobox">
                        <div class="scheduledtime">15시30분</div>
                        <div class="remainingseat">12석</div>
                    </div>
                </div>
                <div class="schuedulinfo">
                    <div class="theaterbox">
                        <div class="theaternum">1관</div>
                        <div class="theaterseatcount">총 232석</div>
                    </div>
                    <div class="infobox">
                        <div class="scheduledtime">15시30분</div>
                        <div class="remainingseat">12석</div>
                    </div>
                    <div class="infobox">
                        <div class="scheduledtime">15시30분</div>
                        <div class="remainingseat">12석</div>
                    </div>
                    <div class="infobox">
                        <div class="scheduledtime">15시30분</div>
                        <div class="remainingseat">12석</div>
                    </div>
                </div>
            </div>
        </div>
    <!--content 끝-->
    <!--footer 시작-->
        <div class="footer">
            <div class="wrapping">
                <span class="footercontent"><img src="/movie/view/img/logo.png"></span>
                <p>COPYRIGHT © YoungGgleJoongAng, Inc. All rights reserved</p>
                <p>서울특별시 노원구 월계동    ARS 0914-0924</p>
                <p>대표자명 박원우 · 개인정보보호책임자 박원우 · 사업자등록번호 919-09-090909 · 통신판매업신고번호 제 88256호</p>
            </div>
        </div> 
    <!--footer 끝-->
</body>
</html>