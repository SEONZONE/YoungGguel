<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <!--메인 CSS-->
    <link rel="stylesheet" href="/movie/view/css/store.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     
  });
</script>
  </head>
  <body>
    <!-- gnb 시작-->
   <jsp:include page="gnb.jsp" ></jsp:include>
    <!-- gnb 끝 -->
    <!-- content -->
    <div class="select">
      <div class="list_button" style="height: 60px; margin: auto">
        <button id="hot">인기상품</button>
        <button id="ticket">티켓</button>
        <button id="goods">팝콘 음료 굿즈</button>
      </div>
    <div class="store-wrap">
      <div class="store-list">
        <div class="store-menu">
          <img src="/movie/view/img/러브콤보패키지.PNG" />
          <p id="title">러브콤보패키지</p>
          <p id="contents">2D일반관람권2매+러브콤보[팝콘(L)1+탄산음료(R)2]</p>
          <p id="price">30,000원</p>
        </div>
        <div class="store-menu">
          <img src="/movie/view/img/싱글패키지.PNG" />
          <p id="title">싱글패키지</p>
          <p id="contents">2D일반관람권1매+팝콘(R)1+탄산음료(R)1</p>
          <p id="price">15,000원</p>
        </div>
        <div class="store-menu">
          <img src="/movie/view/img/아메리카노패키지.PNG" />
          <p id="title">아메리카노패키지</p>
          <p id="contents">2D일반관람권1매+아메리카노 1잔(HOT/ICE 택1)</p>
          <p id="price">30,000원</p>
        </div>
        <div class="store-menu">
          <img src="/movie/view/img/패밀리패키지.PNG" />
          <p id="title">패밀리패키지</p>
          <p id="contents">2D일반관람권3매+팝콘(R)2+탄산음료(R)2</p>
          <p id="price">43,000원</p>
        </div>
        <div class="store-menu">
          <img src="/movie/view/img/일반관람권.PNG" />
          <p id="title">일반관람권</p>
          <p id="contents">일반영화관람권(2D)</p>
          <p id="price">20,000원</p>
        </div>
        <div class="store-menu">
          <img src="/movie/view/img/매직패키지.PNG" />
          <p id="title">매직패키지</p>
          <p id="contents">프리패스 관람권 2매(일반, 컴포트, MAX, 더부티크 가능)</p>
          <p id="price">30,000원</p>
        </div>
        <div class="store-menu">
          <img src="/movie/view/img/탄산패키지.PNG" />
          <p id="title">탄산패키지</p>
          <p id="contents">2D일반관람권2매+러브콤보[팝콘(L)1+탄산음료(R)2</p>
          <p id="price">30,000원</p>
        </div>
        <div class="store-menu">
          <img src="/movie/view/img/효도패키지.PNG" />
          <p id="title">효도패키지</p>
          <p id="contents">더부티크 스위트 2매+탄산음료L 2개</p>
          <p id="price">30,000원</p>
    
  </div>
           </div>
            </div>
        </div>
      <!-- content -->
      <!-- footer -->
      <jsp:include page="footer.jsp" ></jsp:include>
          
     

  </body>
</html>