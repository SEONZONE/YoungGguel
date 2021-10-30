<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='/movie/view/css/gnb.css'>
<!--gnb CSS-->
<link rel='stylesheet' href='/movie/view/css/loginpopup.css'>
<!--로그인 레이어팝업 CSS-->

<!--gnb CSS-->
<!-- <link rel='stylesheet' href='/movie/view/css/joinpopup.css'> -->




<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<jsp:include page="booking.jsp"></jsp:include>
<jsp:include page="loginpopup.jsp"></jsp:include>


<script type="text/javascript">

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
							//boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

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
	
	
	/* 시작할때 세션값에 아이디, 비밀번호가 있는지 체크
	있으면 로그인 되있단 뜻으로, 로그인상태 화면을 보여준다. */
	$(document).ready(function(){
		var UUid = sessionStorage.getItem('Uid');
		var UUpw = sessionStorage.getItem('Upw'); 
		if(UUid && UUpw != null) { 
			$("img#popup_open_btn").addClass("hidden");
			$("img#joinImg").addClass("hidden");		
			$("img#usericon").removeClass("hidden");
			$("span#info_user").removeClass("hidden");
			$("img#logoutBtn").removeClass("hidden");			
		}

	});
	


	
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

											} 
											//어드민 일 때
											else if(e =='adminSuccess'){
												alert("어드민 권한입니다.");
												var Uid = $("input#id").val();
												var Upw = $("input#password").val();	
										
												sessionStorage.setItem('Uid',Uid);
												sessionStorage.setItem('Upw',Upw);
												$("img#popup_open_btn").addClass("hidden");
												$("img#joinImg").addClass("hidden");													
												$("img#usericon").removeClass("hidden");
												$("span#info_user").removeClass("hidden");
												$("img#logoutBtn").removeClass("hidden");
										
												/* 트리거를 사용하여 로그인팝업 창 닫기 */
												$(document).ready(function(){
													$(".modal_close_btn").trigger('click');
													
												});
												
											}
											// 일반 회원일 때
											else {
												//세션값에 아이디, 비밀번호를 넣어준다.
												var Uid = $("input#id").val();
												var Upw = $("input#password").val();			
												sessionStorage.setItem('Uid',Uid);
												sessionStorage.setItem('Upw',Upw);
												$("img#popup_open_btn").addClass("hidden");
												$("img#joinImg").addClass("hidden");													
												$("img#usericon").removeClass("hidden");
												$("span#info_user").removeClass("hidden");
												$("img#logoutBtn").removeClass("hidden");
										
												/* 트리거를 사용하여 로그인팝업 창 닫기 */
												$(document).ready(function(){
													$(".modal_close_btn").trigger('click');
													
												});

											}
										},
										error : function(e) {
											alert('로그인 에러' + e);
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

		
		/* gnb_area 로그아웃 버튼 작동 */
	    $("#logoutBtn").click(function(e){
	    	$.ajax({  
	    		type: "POST",
	    		url: '/movie/logout.do',
	    		dataType : "text",
	    		success: function(e) { 
	    			alert("로그아웃 성공");
	    			
	    			//로그아웃 된 gnb를 띄워준다.
	    			$("img#popup_open_btn").removeClass("hidden");
					$("img#joinImg").removeClass("hidden");
					$("img#usericon").addClass("hidden");
					$("span#info_user").addClass("hidden");
					$("img#logoutBtn").addClass("hidden");
					
					//세션값에 저장되어 있던 아이디, 비밀번호를 지워준다.
					sessionStorage.removeItem("Uid");
					sessionStorage.removeItem("Upw");
					document.location.reload();
	    		},
	    		

				error : function(e) {
					alert('로그아웃 에러' + e);
				}
	    	
	    	});
	    });
		
		
	  

		
	//});
	
	

	});
	//Modal Function
	$(function(){
	/* 예매 모달 */
	$("img#popup_booking_open_btn").click(function() {
		modal('my_Bookmodal');
		});

	

	});

</script>


<title>Insert title here</title>
</head>
<body>

	<div class="gnb">
	
		<div class="wrapping">
			<div class="gnblogo" id="gnblogoid">
				<a href="/movie/view/jsp/main.jsp"> <img src="/movie/view/img/logo.png">
				</a>
				<ul>
				<li><img src="/movie/view/img/loginbutton.png" id="popup_open_btn" class="loginNo"></li>
					<li><a href="../html/join.html" ><img src="/movie/view/img/joinbutton.png" id="joinImg"class="loginNo"></a></li>			
                        <li><img src="/movie/view/img/usericon.png" id ="usericon"class=" hidden"></li>
                     
                        <li><span id ="info_user"class=" hidden">${id } 님 </span></li>
                        &nbsp;<li><img src="/movie/view/img/logoutbutton.png"class=" hidden" id="logoutBtn"></li>
				</ul>
			</div>
			
			<div class="menu">
				<ul>
					<li><a href='/movie/movieList.do?view=poster'>영화</a></li>
					<li>상영시간표</li>
					<li onclick="wow()"><img id="popup_booking_open_btn" src="/movie/view/img/gnbbutton.png"
						onmouseover="this.src='/movie/view/img/gnbbutton_hover.png'"
						onmouseout="this.src='/movie/view/img/gnbbutton.png'"></li>
					<li>스토어</li>
					<li><a href="/movie/view/jsp/myPage1.jsp">마이 페이지</a></li>
				</ul>
			</div>
		</div>
		<div id="modal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
	</div>


	
 
</body>
</html>