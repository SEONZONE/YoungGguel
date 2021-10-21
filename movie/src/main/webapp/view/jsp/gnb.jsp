<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='/movie/view/css/gnb.css'>
<!--gnb CSS-->
<link rel='stylesheet' href='/movie/view/css/loginpopup.css'>
<!--로그인 레이어팝업 CSS-->
<link rel='stylesheet' href='/movie/view/css/joinpopup.css'>
<!--로그인 레이어팝업 CSS-->
<!--   <script src="../js/main.js"></script> 메인 스크립트 -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>




<script type="text/javascript">
	
	/* 로그인 팝업 function */
	
	function modal(id) {
		var zIndex = 9999;
		var modal = $('#' + id);
		// 모달 div 뒤  레이어
		var bg = $('<div>').css({
			position : 'fixed',
			zIndex : zIndex,
			left : '0px',
			top : '0px',
			width : '100%',
			height : '100%',
			overflow : 'auto',
			backgroundColor : 'rgba(0,0,0,0.4)'
		}).appendTo('body');
		modal.css({
							position : 'fixed',
							boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

							// 배경 레이어 보다 한칸 위에 보이기
							zIndex : zIndex + 1,
							// div center 정렬
							top : '50%',
							left : '50%',
							transform : 'translate(-50%, -50%)',
							msTransform : 'translate(-50%, -50%)',
							webkitTransform : 'translate(-50%, -50%)'
						}).show()
				// 닫기 버튼 처리, 배경 레이어와 모달 div 지우기
				.find('.modal_close_btn').on('click', function() {
					bg.remove();
					modal.hide();
				});
	}


	
	$(function() {
	
		
		/* 아이디 비밀번호 검증 */	
		$("#LOGIN").click(function(e) {
							if ($("input#id").val().length == 0
									|| $("input#password").val().length == 0) {
								alert('Id Or Pass Check!');
								$("input#id").val('');
								$("input#password").val('');
								return false;
							}
							//$("form").submit();
							$.ajax({
										url : '/movie/loginpopup.do',
										type : 'POST',
										dataType : 'text',
										data : {
											id : $("input#id").val(),
											pw : $("input#password").val()
										},
										success : function(e) {
											if (e == 'Fail') {
												$("span#check")
														.html(
																"<font color = 'red'> 아이디 또는 비밀번호를 확인해 주세요</font>");
												$("input#id").val('');
												$("input#password").val('');

											} else {
												document.location.href = '/movie/view/jsp/loginGNB.jsp';
											}
										},
										error : function(e) {
											alert('에러' + e);
										}
									});
						});
		/* 모달창 오픈 */
		$("img#popup_open_btn").click(function() {
			modal('my_modal');
			});
		/* 모달창 닫기 */
		$("#close_pop").click(function(flag) {
			$('#boxposition').hide();
		});
	});
</script>


<title>Insert title here</title>
</head>
<body>

	<div class="gnb">
		<div class="wrapping">
			<div class="gnblogo" id="gnblogoid">
				<a href="/"> <img src="/movie/view/img/logo.png">
				</a>
				<ul>

					<li><img src="/movie/view/img/loginbutton.png" id="popup_open_btn"></li>
					<li><a href="../html/join.html"><img src="/movie/view/img/joinbutton.png"></a></li>
				</ul>
			</div>
			<div class="menu">
				<ul>
					<li>영화</li>
					<li>상영시간표</li>
					<li onclick="wow()"><img src="/movie/view/img/gnbbutton.png"
						onmouseover="this.src='/movie/view/img/gnbbutton_hover.png'"
						onmouseout="this.src='/movie/view/img/gnbbutton.png'"></li>
					<li>스토어</li>
					<li>고객센터</li>
				</ul>
			</div>
		</div>
		<div id="modal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
	</div>


	<!-- 로그인 팝업 창  -->
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



</body>
</html>