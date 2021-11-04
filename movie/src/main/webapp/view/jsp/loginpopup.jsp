
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
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('534b4017ef7a96d9511d903bc1bf922f'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
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
						src="/movie/view/img/loginpopupkakao.png" onclick="kakaoLogin();"><br> <span>네이버</span>  <span>카카오 로그인</span> 
						<!-- <a href="javascript:void(0)"></a> -->
						<ul>
	
		<li onclick="kakaoLogout();">
	      <a href="javascript:void(0)">
	          <span>카카오 로그아웃</span>
	      </a>
		</li>
</ul>
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