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
    <link rel="stylesheet" href="/movie/view/css/set.css" />
    <!--메인 CSS-->
    <link rel="stylesheet" href="/movie/view/css/store-detail.css" />
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
    <div class="contents">
        <div class="item-wrap">
        <div class="item">
            <div class="item-img" id="fleft">
                <img src="/movie/view/img/패밀리패키지.PNG"/>
            </div>
            <div class="item-detail" id="fleft">
                <div class="top">
                    <p id="title">탄산패키지</p>
                    <p id="contents">2D일반관람권2매+러브콤보[팝콘(L)1+탄산음료(R)2</p>
                    <p id="price">30,000원</p>
                </div>
                <div class="middle">
                    <span id="mid-left">사용가능 영화관</span>
                    <span id="mid-right">전국 어디서든 사용 가능</span><br>
                    <span id="mid-left">유효기간</span>
                    <span id="mid-right">구매 후 24개월 이내</span><br>
                    <span id="mid-left">구매제한</span>
                    <span id="mid-right">제한 없음</span>
                </div>
                <div class="bottom">
                    <div class="quantity" id="btn">
                        <span>수량</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" onclick="quantity('d',this);">-</button>
                        <input type="text" name="pop_out" value="0" readonly="readonly" style="text-align: center;"/>
                        <button type="button" onclick="quantity('u',this);">+</button>
                    </div>
                    <div class="sum" id="btn">
                        <span id="total_title">총 상품금액</span>&nbsp;&nbsp;
                        <span id="total">30,000원</span>
                    </div>
                </div>
                <div class="item-button">
                    <button>결제하기</button>
                </div>
            </div>
        </div>
    </div>
    </div>
      <!-- content -->
      <!-- footer -->
      <jsp:include page="footer.jsp" ></jsp:include>
  </body>
</html>

