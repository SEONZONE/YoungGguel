
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
		$("a#signin").click(
				
				function(e) {
					if ($("input#id").val().length == 0
							|| $("input#password").val().length == 0) {
						alert('Id Or Pass Check!');
						$("input#id").val('');
						$("input#password").val('');
						return false;
					}
					//$("form").submit();
					$.ajax({
						url: '/movie/loginpopup.do',
						type: 'POST',
						dataType : 'text',
						data: {id:$("input#id").val(),pw:$("input#password").val()},
						success:function(e) { 
							if(e == 'Fail') {
								$("span#check").html("<font color = 'red'> 아이디 또는 비밀번호를 확인해 주세요</font>");
								$("input#id").val('');
								$("input#password").val('');
								
							}
							else { 
								document.location.href='/movie/view/jsp/loginGNB.jsp';
							}
						},
						error : function(e) { 
							alert('에러'+e);
						}
					});
					
					
				});
		
		$("#close_pop").click(function(flag) {
			$('#boxposition').hide();
		});
	});
</script>
</head>
<body>
	<div class="login_Pop_Wrapping">
		<div class="contents">
			<div class="topcon">
				<span>LOGIN</span>
				 <img src="/movie/view/img/popupx.png" id="close_pop">
			</div>
			<form name="LOGIN_FORM" id="LOGIN_FORM" method="post">
				<div class="boxposition">
					<input type="text" class="inputbox" placeholder="ID" id="id" name="id"><br> <input
						type="password" class="inputbox" placeholder="PW" id="password" name="password"><br>
					<!-- <input type="button" class="login_button" name="LOGIN" value="LOGIN" id="LOGIN"> -->
					<a href="#" id="signin" class="login_button">SIGN IN</a><br>
					<span id="check"></span> 
				</div>
			</form>
			<div class="midcon">
				<img src="/movie/view/img/loginpopupnaver.png"> 
				<span style="color: #e7e7e7; font-size: 30px;">|</span> <img src="/movie/view/img/loginpopupkakao.png"><br> <span>네이버</span> <span>카카오</span>
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
</body>
</html>