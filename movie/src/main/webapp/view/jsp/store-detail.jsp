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
    <link rel="stylesheet" href="/movie/view/css/store-detail.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
	var cnt = 0;
	var price = $("input#priceval").val();
	var total_price;
	$("button[name='minus']").click(function(){
		if(cnt <= 0){
			cnt = 0;
			$("input[name='count']").val(cnt);
		}else{
			cnt--
			$("input[name='count']").val(cnt);
		}
		total_price = price*cnt;
		$("span#total").text(total_price);
		$("span#total").append("원");
		$("input[name='totalprice']").val(total_price);
		$("input[neme='count']").val(cnt);
	});
	$("button[name='plus']").click(function() {
		if(cnt >= 9){
			cnt = 9;
			$("input[name='count']").val(cnt);
		}else{
			cnt++
			$("input[name='count']").val(cnt);
		}
		total_price = price*cnt;
		$("span#total").text(total_price);
		$("span#total").append("원");
		$("input[name='totalprice']").val(total_price);
		$("input[neme='count']").val(cnt);
	});	  
	$("button#buybutton").click(function(){
		$("form").submit();
	});
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
                <img src="/movie/view/img/${detail.PIMG}"/>
            </div>
            <div class="item-detail" id="fleft">
                <div class="top">
                    <p id="title">${detail.PNAME}</p>
                    <p id="contents">${detail.PCONTENTS}</p>
                    <p id="price">${detail.PPRICE}원</p>
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
                        <button type="button" name="minus">-</button>
                        <input type="text" name="count" value="0" readonly="readonly" style="text-align: center;"/>
                        <button type="button" name="plus" >+</button>
                    </div>
                    <div class="sum" id="btn">
                        <span id="total_title">총 상품금액</span>&nbsp;&nbsp;
                        <span id="total" name="total">0</span>
                    </div>
                </div>
                <div class="item-button">
                    <button id="buybutton">결제하기</button>
                </div>
            </div>
        </div>
    </div>
    </div>
      <!-- content -->
      <!-- footer -->
      <jsp:include page="footer.jsp" ></jsp:include>
    <form action="/movie/store/buy.do" id="buybuy" method="post">
		<input type="hidden" name="pno" value="${detail.PNO}"> <!-- 물품넘버 -->       
        <input type="hidden" name="price" value="${detail.PPRICE}" id="priceval"> <!-- 1개당 금액 -->
		<input type="hidden" name="count"> <!-- 구매개수 -->       
    	<input type="hidden" name="totalprice"> <!-- 토탈금액 -->
    </form>
    
  </body>
</html>