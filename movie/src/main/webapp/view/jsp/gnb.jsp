<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
   <link rel='stylesheet' href='/movie/view/css/gnb.css'> <!--gnb CSS-->
    <link rel='stylesheet' href='/movie/view/css/loginpopup.css'> <!--로그인 레이어팝업 CSS-->
    <link rel='stylesheet' href='/movie/view/css/joinpopup.css'> <!--로그인 레이어팝업 CSS-->
  <!--   <script src="../js/main.js"></script> 메인 스크립트 -->
    <script src="../js/loginpopup.js"></script> <!--로그인 레이어팝업 스크립트-->
    <script src="../js/join.js"></script> <!--로그인 레이어팝업 스크립트-->
<title>Insert title here</title>
</head>
<body>
  <div class="gnb">
            <div class="wrapping">
                <div class="gnblogo" id="gnblogoid">
                    <a href="/">
                        <img src="/movie/view/img/logo.png">
                    </a>
                    <ul>
                        <li><img src="/movie/view/img/loginbutton.png" onclick="loginpopup()"></li>
                        <li><a href="../html/join.html"><img src="/movie/view/img/joinbutton.png"></a></li>
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
</body>
</html>