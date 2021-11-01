<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <link rel='stylesheet' href='/movie/view/css/join.css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var birthformChk =  /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/; // 생년월일체크 정규식
	var yakguan = 0; // 약관동의 체크
	var checkid = 0; // 아이디 중복체크 확인
	var saveid; // 중복체크된 아이디 저장

	  /*아이디 한글제한*/
		$( 'input[name=USERID]' ).on("blur keyup", function() {
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''));
		});
	  
	  /* 아이디 공백제거 */
		$('input[name=USERID]').on("change keyup paste", function() {
			if($('input[name=USERID]').val().indexOf(' ') > 0){
				document.getElementById("id").value="";
				$("span#idcheck_txt").addClass("fail");
				document.getElementById("idcheck_txt").innerText="공백은 사용이 불가능합니다";
			}else{
				document.getElementById("idcheck_txt").innerText="";
			}
		});
	  
	  /* 패스워드 공백제거 */
	  $('input[name=USERPW]').on("change keyup paste", function() {
			if($('input[name=USERPW]').val().indexOf(' ') > 0){
				document.getElementById("USERPW").value="";
				$("span#passcheck_txt").addClass("fail");
				document.getElementById("passcheck_txt").innerText="※공백 사용불가!!!!※";
			}else{
				document.getElementById("passcheck_txt").innerText="";
			}
		});		
	  /* 휴대폰 인증 구현하면 바꿔야될부분 */
	  $("button#next2").click(function(){
			$("div.join1").addClass("hidden");
			$("div.join2").removeClass("hidden");
			$("input[name=USERNAME]").val("김영끌");
			$("input[name=USERTEL]").val("01012345678");
			$("input[name=USERBIRTH]").val("20210101");
			$('input[id=man]').attr("checked",true);
		});
	  	
	  	/* 약관동의 체크 */
		$("button#next3").click(function(){
			if($('input[name=check]').is(":checked") == false ){
				alert("약관에 동의해라");
			}else{
				yakguan = 1;
				$("div.join2").addClass("hidden");
				$("div.join3").removeClass("hidden");
			}
		});
	  	
		/* 아이디 체크 */
		$("span#id_overlap").click(function(){
			var userid = $("input[name=USERID]").val();
				$.ajax({
					url:"/movie/idCheck.do",
					type:"post",
					dataType:"json",
					data : {id:userid},
					success : function(count){
						if(count > 0){
							$("span#idcheck_txt").removeClass("pass");
							$("span#idcheck_txt").addClass("fail");
							document.getElementById("idcheck_txt").innerText="사용 불가능한 아이디입니다";
							checkid = 0;
						}else{
							$("span#idcheck_txt").removeClass("fail");
							$("span#idcheck_txt").addClass("pass");
							document.getElementById("idcheck_txt").innerText="사용이 가능한 아이디입니다";
							saveid = $("input[name=USERID]").val();
							checkid = 1;
						}
					}
				});
		});
		
		/* 비밀번호 길이 체크*/
		var checkpwlen = 0;
		$("input[name=USERPW]").on("change keyup paste",function() {
			if($("input[name=USERPW]").val().length < 8){
				$("span#passcheck_txt").addClass("fail");
				document.getElementById("passlancheck_txt").innerText="비밀번호가 짧습니다";
				checkpwlen = 0;
			}else{
				document.getElementById("passlancheck_txt").innerText="";
				checkpwlen = 1;
			}
		});
		
		
		/* 비밀번호 맞는지 체크 */
		var checkpw = 0
		$("input[name=check_pw]").on("change keyup paste",function() {
			if($("input[name=USERPW]").val()==$("input[name=check_pw]").val()){
				$("span#passcheck_txt").removeClass("fail");
				$("span#passcheck_txt").addClass("pass");
				document.getElementById("passcheck_txt").innerText="비밀번호가 맞습니다";
				checkpw = 1;
			}else{
				$("span#passcheck_txt").removeClass("pass");
				$("span#passcheck_txt").addClass("fail");
				document.getElementById("passcheck_txt").innerText="비밀번호가 틀립니다";
				checkpw = 0;
			}
		});
		/* 이메일 형식체크 */
		
		$("button#next4").click(function(){
			if(yakguan != 1){
				alert("부정적인 방법의 접근입니다");
				location.reload();
			}else if(checkid != 1){ 
				alert("아이디 중복확인을 해주세요");			
			}else if(!birthformChk.test($("input[name=USERBIRTH]").val())){ 
				alert("생년월일을 확인해주세요");			
			}else if(saveid != $("input[name=USERID]").val()){
				alert("아이디 중복확인을 해주세요");
			}else if(checkpwlen != 1){
				alert("비밀번호 길이를 확인해주세요");
			}else if(checkpw != 1){
				alert("비밀번호가 다릅니다");
			}else{
				$.ajax({
					url:"/movie/join.do",
					type:"post",
					dataType:"json",
					data : {"USERID":$("input[name=USERID]").val(),
						"USERPW":$("input[name=USERPW]").val(),
						"USERNAME":$("input[name=USERNAME]").val(),
						"USERGENDER":$("input[name=USERGENDER]").val(),
						"USERTEL":$("input[name=USERTEL]").val(),
						"USERBIRTH":$("input[name=USERBIRTH]").val(),
						"USEREMAIL":$("input[name=USEREMAIL]").val()
						},
					success : function(data){
						if(data == 1){
							$("div.join3").addClass("hidden");
							$("div.join4").removeClass("hidden");
						}else{
							alert("가입실패!!!")
						}
					}
				});
			}
			
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
                            <ul class="info_list">
                                <li><div>성명</div><input type="text" name="USERNAME" ></li>
                                <li>
                                    <div>성별</div>
                                    <input type="radio" name="USERGENDER" id="man" value="남자"><label for="man">남자</label>
                                    <input type="radio" name="USERGENDER" id="woman" value="여자"><label for="woman">여자</label>
                                </li>
                                <li><div>생년월일</div><input type="number" name="USERBIRTH" placeholder="YYYY/MM/DD" maxlength="8"></li>
                                <li><div>휴대폰번호</div><input type="number" name="USERTEL"></li>
                                <li><div>아이디</div><input type="text" id="id" name="USERID" placeholder="영문,숫자조합 최대 16글자" maxlength="16"><span id="id_overlap">중복확인</span></li>
                                <span id="idcheck_txt" style="position: relative; right: 225px;"></span>
                                <li><div>비밀번호</div><input type="password" name="USERPW" id="USERPW" placeholder="영문,숫자조합 8~16 글자" maxlength="16" ></li>
                                <span id="passlancheck_txt" style="position: relative; right: 275px;"></span>
                                <li><div>비밀번호 확인</div><input type="password" name="check_pw"></li>
                                <span id="passcheck_txt" style="position: relative; right: 275px;"></span>
                                <li><div>이메일주소</div><input type="text" name="USEREMAIL" placeholder="yyyy@ggg.com 형식에 맞춰 작성해주세요"></li>
                            </ul>
                            <button type="button" id="next4">가입하기</button>
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
                    <button id="close_join">홈페이지로 돌아가기</button>
                </div>        
            </div>
        </div>
    </div>
</body>
</html>