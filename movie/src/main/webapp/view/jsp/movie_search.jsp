<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="gnb.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible"
	content="width=device-width, initial-scale=1" />
<title>영끌</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--메인 CSS-->
<link rel="stylesheet" href="/movie/view/css/movie_list.css" />
<!-- icon -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){

  $(".glyphicon.glyphicon-search").click(function(){
  	if($("input#textbox").val().length == 0){
  		alert('검색어를 입력해주세요');
  	}else{
  	document.location.href='/movie/movieSearch.do?search='+$("input#textbox").val();
  	}
  });
    
});


</script>
</head>
<div class="content">
	<div class="search-box">
		<form>
			<input type="text" id="textbox" value="${param.search}"> <i
				class="glyphicon glyphicon-search"></i>
		</form>
	</div>
	<div class="inner-wrap">
		<div class="movie-list">
			<ol class="list" id="movielist">
			<c:forEach var="i" items="${result}" varStatus="cnt">
				<li>
					<div class="movie-list-info" id="fleft">
						<img src="/movie/view/img/${i.movieCd}.jpg" />
					</div>
					<div id="fleft">
						<a href="/movie/movieInfo.do?no=${i.movieCd}">
							<div class="tit-area">
								<span class="title">${i.movieNm} |</span> <span
									class="runningtime">${i.showTm}분</span> <span class="rate">예매율
									60%</span>
							</div>
							<div class="detail-area">
								<span>개봉</span><span class="release">
									${info.openDt}</span>
								<p class="genre">${i.genre}</p>
								<p class="cont">${i.contents}</p>
							</div>
						</a>
						<div class="btn-area">
							<button class="reserve">예매하기</button>
							<span class="movie_like">🤍</span>
						</div>
					</div>
				</li>
</c:forEach>
			</ol>
		</div>
	</div>
</div>

<!--footer 끝-->
<jsp:include page="footer.jsp"></jsp:include>
<!--footer 끝-->
</body>
</html>
