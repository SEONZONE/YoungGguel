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
    <link rel='stylesheet' href='/movie/view/css/movie_info.css'> <!--무비인포 CSS-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     
  });
</script>
</head>
<body>
    <!--gnb 시작-->

         <jsp:include page="gnb.jsp" ></jsp:include>
    <!--gnb 끝-->
    <!--content 시작-->
        <div class="content">
            <div class="black_bar">
                <div class="wrapping">
                    <div id="blur_back_img"  style="background-image: url(/movie/view/img/sp.jpg); "></div>
                    <div id="on_img">
                        <div id="main_title">보이스</div>
                        <div id="sub_title">영어제목입니다 또는 부제입니다</div>
                        <div id="right_poster"><img src="/movie/view/img/pos2.png" style="width: 85%;"></div>
                        <div id="right_button">예매하기</div>
                        <div>
                            <ul>
                                <li class="movie_rank_info">실관람평점
                                    <br><span style="color: #73eaff;">8.9</span>
                                </li>
                                <li class="movie_rank_info">예매율
                                    <br><span >1위</span>
                                </li>
                                <li class="movie_rank_info">누적관객수
                                    <br><span>111,111</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrapping">
                <div class="summary">
                    <div>
                        /n을 br로 치환해서 ${content} 로 부르면<br>
                        줄바꿈 줄거리로 만들수있대요<br>
                        이건 로직을 넣어야할거같아요<br><br>
                        자바스크립트말고<br>
                        자바단에서 치환시켜서 던져주면 된다고하네요<br>
                        리플레이스올 포문돌려서 뭐시기... 네 우리모두 화이팅<br>
                    </div>
                </div>
                <div class="review">
                    <span>리뷰 모아보기</span>
                    <div class="review_lnput">
                        <div style="width: 130px; height: 50px; text-align: center;"> 
                            <span><img src="/movie/view/img/usericon.png"></span><br>
                            <span>로그인된 아이디</span>
                        </div>
                        <input type="text" placeholder="... 별모양은 빼자^^">
                        <div id="review_button">관람평 쓰기</div>
                    </div>
                    <div class="review_list">
                        <div style="width: 130px; height: 50px; text-align: center;"> 
                            <span><img src="/movie/view/img/usericon.png"></span><br>
                            <span>작성자아이디</span>
                        </div>
                        <div id="review_text">글자수 제한 필요합니다</div>
                    </div>
                    <div class="review_list">
                        <div style="width: 130px; height: 50px; text-align: center;"> 
                            <span><img src="/movie/view/img/usericon.png"></span><br>
                            <span>작성자아이디</span>
                        </div>
                        <div id="review_text">글자수 제한 필요합니다</div>
                    </div>
                    <div class="review_list">
                        <div style="width: 130px; height: 50px; text-align: center;"> 
                            <span><img src="/movie/view/img/usericon.png"></span><br>
                            <span>작성자아이디</span>
                        </div>
                        <div id="review_text">글자수 제한 필요합니다</div>
                    </div>
                </div>
            </div>
        </div>
    <!--content 끝-->
    <!--footer 시작-->
        <jsp:include page="footer.jsp" ></jsp:include>
    <!--footer 끝-->
</body>
</html>





















