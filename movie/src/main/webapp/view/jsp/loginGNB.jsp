<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
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
                        <li><img src="/movie/view/img/usericon.png"></li>
                        <li><span>qkrdnjsdn77</span></li>
                        &nbsp;<li><img src="/movie/view/img/logoutbutton.png"></li>
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
</body>
</html>

<!-- 미디어쿼리 // 반응형 -->


























