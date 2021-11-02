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
    <!--메인 CSS-->
    <link rel="stylesheet" href="/movie/view/css/store.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	ajaxRequest("/movie/store/main.do",{Kategorie:null},'json');
});
function ajaxRequest(url,data,datatype) {
	$.ajax({
		url:url,
		type:'post',
		data:data,
 		dataType:datatype,
		success:function(v){
			ajaxStoreList(v);
		},
		error:function(c){
			alert('error'+c);
		}
	});
}
function ajaxStoreList(v) {
	var temp="";
	$.each(v,function(index,dom){
		temp+="<div class=\"store-menu\">";
		temp+="<a href=\"/movie/store/store-detail.do?no="+dom.pno+"\">";
		temp+="<img id=\"product_img\" src=\"/movie/view/img/"+dom.pimg+"\" />";
		temp+="<p id=\"title\">"+dom.pname+"</p>";
		temp+="</a>";
		temp+="<p id=\"contents\">"+dom.pcontents+"</p>";
		temp+="<p id=\"price\">"+dom.pprice+"원</p>";
		temp+="</div>";
	});
	$("div.store-list").html(temp);
}

  $(function(){
	  $("button#hot").click(function(){
		var key="hot";
		$("button").removeClass("store_click_on");
		$("button#hot").addClass("store_click_on");
		ajaxRequest('/movie/store/main.do',{Kategorie:key},'json');
	});
	  
	  $("button#ticket").click(function(){
		var key="ticket";
		$("button").removeClass("store_click_on");
		$("button#ticket").addClass("store_click_on");
		ajaxRequest('/movie/store/main.do',{Kategorie:key},'json');
	});
	  
	  $("button#goods").click(function(){
		var key="goods";
		$("button").removeClass("store_click_on");
		$("button#goods").addClass("store_click_on");
		ajaxRequest('/movie/store/main.do',{Kategorie:key},'json');
	});
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
        <button id="hot" class="store_click_off store_click_on">인기상품</button>
        <button id="ticket" class="store_click_off">티켓</button>
        <button id="goods" class="store_click_off">팝콘/음료/굿즈</button>
      </div>
    	<div class="store-wrap">
	    	<div class="store-list">
	  		</div>
   		</div>
    </div>
      <!-- content -->
      <!-- footer -->
      <jsp:include page="footer.jsp" ></jsp:include>
  </body>
</html>