<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel='stylesheet' href='/movie/view/css/join.css'>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("button#close_join").click(function() {
			document.location.href="/movie/movieList.do?view=poster";
		});
		
	});
</script>
</head>
<body>
<div class="join4">
            <div class="contents">
                <div class="topcon">
                    <span>Error Page</span>
                </div>
                <div class="join_list">
                    <img src="/movie/view/img/logo.png" class="join_list">
                </div>
                <div class="midcon">
                    <a><img src="/movie/view/img/join_fin.png"></a>
                    <b><br>영끌 : 잘못된 경로입니다<br></b>
                    <span>영끌의 다양한 컨텐츠 서비스를 즐겨보세요!<br></span>
                    <button id="close_join">홈페이지로 돌아가기</button>
                </div>        
            </div>
        </div>
</body>
</html>

