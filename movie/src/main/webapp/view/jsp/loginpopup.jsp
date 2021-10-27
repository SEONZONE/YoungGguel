
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>Page Title</title>
<link rel='stylesheet' href='/movie/view/css/loginpopup.css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

  
  $(function() {
		
	});
</script>
</head>
<body>
	<div id="my_modal">
		<div class="contents">
				<div class="topcon">
					<span>LOGIN</span> <img src="/movie/view/img/popupx.png" class="modal_close_btn "id="close_pop">
				</div>
				<form name="LOGIN_FORM" id="LOGIN_FORM" method="post">
					<div class="boxposition">
						<input type="text" class="inputbox" placeholder="ID" id="id" name="id"><br> <input
							type="password" class="inputbox" placeholder="PW" id="password" name="password"><br>
						<!-- <input type="button" class="login_button" name="LOGIN" value="LOGIN" id="LOGIN"> -->
						<input type="button" class="login_button" name="LOGIN" value="LOGIN" id="LOGIN">
						<br><span id="check"></span>
					
					</div>
				</form>
				<div class="midcon">
					<img src="/movie/view/img/loginpopupnaver.png"> <span
						style="color: #e7e7e7; font-size: 30px;">|</span> <img
						src="/movie/view/img/loginpopupkakao.png"><br> <span>네이버</span> <span>카카오</span>
				</div>
				<div class="footcon">
					<div class="findidpw">
						<a>아이디찾기</a> <span style="font-weight: bold;">|</span> <a>비밀번호찾기</a><br>
					</div>
					<div class="joinuscon">
						<span style="color: #133597;">영끌이 처음이신가요?</span> <img src="/movie/view/img/loginpopupjoin.png">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>