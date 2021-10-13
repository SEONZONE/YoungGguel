
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
	<!-- 성종테스트 -->
	<!-- 원우테스트 -->
	
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>영끌</title>
    
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='/movie/view/css/main.css'> <!--메인 CSS-->
    <link rel='stylesheet' href='/movie/view/css/loginpopup.css'> <!--로그인 레이어팝업 CSS-->
    <link rel='stylesheet' href='/movie/view/css/joinpopup.css'> <!--로그인 레이어팝업 CSS-->

    <!-- icon -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <!-- font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet">
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
                        <li><img src="/movie/view/img/loginbutton.png"></li>
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
                <div class="search-box">
                    <form>
                        <input type="text" id="textbox" placeholder="오늘의 영끌은?">
                        <i class="glyphicon glyphicon-search"></i>
                    </form>
                </div>
                <div class="category">
                    <ul>
                        <li><span class="category_off">인기순위</span></li>
                        <li><span class="category_on">현재상영작</span></li>
                        <li><span class="category_off">개봉예정작</span></li>
                    </ul>
                </div>
                <span id="more_view">MORE VIEW&nbsp;&nbsp;&nbsp;></span>
                <div class="movie-list">
                    <ul>
                        <li><a><img src="/movie/view/img/pos1.png"></a></li>
                        <li><a><img src="/movie/view/img/pos2.png"></a></li>
                        <li><a><img src="/movie/view/img/pos3.png"></a></li>
                        <li><a><img src="/movie/view/img/pos4.png"></a></li>
                    </ul>           
                    <ul style="display: none;">
                        <li><a><img src="/movie/view/img/pos1.png"></a></li>
                        <li><a><img src="/movie/view/img/pos2.png"></a></li>
                        <li><a><img src="/movie/view/img/pos3.png"></a></li>
                        <li><a><img src="/movie/view/img/pos4.png"></a></li>
                    </ul>           
                    <ul style="display: none;">
                        <li><a><img src="/movie/view/img/pos1.png"></a></li>
                        <li><a><img src="/movie/view/img/pos2.png"></a></li>
                        <li><a><img src="/movie/view/img/pos3.png"></a></li>
                        <li><a><img src="/movie/view/img/pos4.png"></a></li>
                    </ul>
                </div>
                <!-- 호버 컨텐츠 -->
                <div class="main_hover_con">
                    <div class="hover_back"></div>
                    <div class="hover_txt" style="font-size: 25px; font-weight: bold;">영화제목</div>
                    <div class="hover_txt" style="font-size: 17px;">예매율<span>79%</span></div>
                    <div class="hover_txt" style="font-size: 17px;">장르<span>·</span><span>127분</span></div><br><br>
                    <div class="main_hover_btn">예매하기</div>
                    <div class="main_hover_like">🤍</div>
                    <div class="main_hover_like_on hidden">🧡</div>
                </div>      
                <!-- 호버 컨텐츠끝 -->
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

<!-- 미디어쿼리 // 반응형 -->


























