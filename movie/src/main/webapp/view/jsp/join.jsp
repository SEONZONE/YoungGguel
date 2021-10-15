<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <link rel='stylesheet' href='/movie/view/css/join.css'>
    <script src="../js/join.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
	  $("button#next2").click(function(){
			<!-- 휴대폰 인증 구현하면 바꿔야될부분 -->
			$("div.join1").addClass("hidden");
			$("div.join2").removeClass("hidden");
			$("input[name=USER_NAME]").val("김영끌");
			$("input[name=USER_TEL]").val("01012345678");
			$("input[name=USER_BIRTH]").val("20210101");
			$('input[id=man]').attr("checked",true);
			<!-- 휴대폰 인증 구현하면 바꿔야될부분 -->
		});
		$("button#next3").click(function(){
			if($('input[name=check]').is(":checked") == false ){
				alert("약관에 동의해라");
			}else{
				$("div.join2").addClass("hidden");
				$("div.join3").removeClass("hidden");
			}
		});
		$("span#id_overlap").click(function(){
			function idChk(){
				$.ajax({
					url:"/movie/idCheck.do",
					type:"post",
					dataType:"text",
					data : $("input[name=USER_ID]").val(),
					success : function(imsi){
						alert("good");
					}
				})
			}
		});
		$("button#next4").click(function(){
			
			
			
			/* $("div.join3").addClass("hidden");
			$("div.join4").removeClass("hidden"); */
		});
		$("img#close_join").click(function(){
			location.replace('main.jsp');
		});
  });
</script>
</head>
<body>
    <div class="join_Pop_Wrapping">
        <!--회원가입 1번-->
        <div class="join1">
            <div class="contents">
                <div class="topcon">
                    <span>JOIN</span>
                    <img src="/movie/view/img/popupx.png" style="position: absolute; right: 35%;" id="exit_btn">
                </div>
                <div class="join_list">
                    <img src="/movie/view/img/join_list_1.png" class="join_list">
                </div>
                <div class="midcon">
                    <a><img src="/movie/view/img/phone.png"></a>
                    <span><br>안심본인인증은 성명, 생년월일, 성별,연락처 등을 통해 인증하며, 
                    <br>한국신용평가㈜의정보를 사용합니다.<br></span>
                    <button id="next2">건너뛰기</button>
                </div>        
            </div>
        </div>
        <!--회원가입 2번-->
        <div class="join2 hidden">
            <div class="contents">
                <div class="topcon">
                    <span>JOIN</span>
                    <img src="/movie/view/img/popupx.png" style="position: absolute; right: 35%;" id="exit_btn">
                </div>
                <div class="join_list">
                    <img src="/movie/view/img/join_list_2.png" class="join_list">
                </div>
                <div class="midcon_Wrapping"> 
                    <div class="midcon">
                        <div class="mid_top">약관동의 및 정보활용 동의</div>
                        <div class="mid_top">영끌 서비스 이용을 위한 약관을 동의해주세요.</div><br>
                        <div class="mid_box">제1조 . 목적<br>
                            본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고
                            영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅
                            본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고
                            영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅
                            본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고
                            영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅
                            본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고
                            영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅
                            본 약관은 어쩌고 저쩌고 영끌 만세 만만세 화이팅본 약관은 어쩌고 저쩌고
                            영끌 만세 만만세 화이팅</div>
                        <form action=""></form>
                        <span class="ok_checkbox">
                            <input type="checkbox" name="check" >약관에 동의합니다.
                        </span><br>
                        <button id="next3">확인</button>
                        </form>
                    </div>        
                </div>
            </div>
        </div>
        <!--회원가입 3번-->
        <div class="join3 hidden">
            <div class="contents">
                <div class="topcon">
                    <span>JOIN</span>
                    <img src="/movie/view/img/popupx.png" style="position: absolute; right: 35%;" id="exit_btn">
                </div>
                <div class="join_list">
                    <img src="/movie/view/img/join_list_3.png" class="join_list">
                </div>
                <div class="midcon_Wrapping">
                    <div class="midcon">
                        <div class="mid_top">영끌에 오신것을 환영합니다.</div>
                        <div class="mid_top">회원정보를 입력해주세요.</div><br>
                        <form action="" method="post">
                        <!-- /movie/join.do -->
                            <ul class="info_list">
                                <li><div>성명</div><input type="text" name="USER_NAME" ></li>
                                <li>
                                    <div>성별</div>
                                    <input type="radio" name="USER_GENDER" id="man" value="남자"><label for="man">남자</label>
                                    <input type="radio" name="USER_GENDER" id="woman" value="여자"><label for="woman">여자</label>
                                </li>
                                <li><div>생년월일</div><input type="text" name="USER_BIRTH"></li>
                                <li><div>휴대폰번호</div><input type="text" name="USER_TEL"></li>
                                <li><div>아이디</div><input type="text" id="id" name="USER_ID"><span id="id_overlap">중복확인</span></li>
                                <div style="display: block;">사용 가능한 아이디입니다</div>
                                <li><div>비밀번호</div><input type="password" name="USER_PW"></li>
                                <li><div>비밀번호 확인</div><input type="password"></li>
                                <li><div>이메일주소</div><input type="text" name="USER_EMAIL"></li>
                            </ul>
                            <button id="next4">가입하기</button>
                        </form>
                    </div>
                </div>        
            </div>
        </div>
        <!--회원가입 4번-->
        <div class="join4 hidden">
            <div class="contents">
                <div class="topcon">
                    <span>JOIN</span>
                </div>
                <div class="join_list">
                    <img src="/movie/view/img/join_list_4.png" class="join_list">
                </div>
                <div class="midcon">
                    <a><img src="/movie/view/img/join_fin.png"></a>
                    <b><br>영끌 가입을 환영합니다!<br></b>
                    <span>영끌의 다양한 컨텐츠 서비스를 즐겨보세요!<br></span>
                    <button>홈페이지로 돌아가기</button>
                </div>        
            </div>
        </div>
    </div>
</body>
</html>