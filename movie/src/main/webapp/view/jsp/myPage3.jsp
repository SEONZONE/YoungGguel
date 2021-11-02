<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/movie/view/css/myPagecommon.css">
    <link rel="stylesheet" href="/movie/view/css/myPage3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
	  $('img#checkReserveimg').click(function(){
		  //alert(this);
		  document.location.href='/movie/view/jsp/myPage1.jsp';
	  }),
	  $('img#questionimg').click(function(){
		  //alert(this);
		  document.location.href='/movie/view/jsp/myPage2.jsp';
	  }),
	  $('img#changeInfoimg').click(function(){
		  //alert(this);
		  document.location.href='/movie/mypage3.do?id=asd';
	  }),
	  $("a#signin").click(function(){
		  alert("form제출");
	  });
	  $(document).ready(function(){
		  if(UUid!=null){
			  return true;
			}else{	<!--저장된 아이디 값이 없으면-->
				alert('로그인이 필요합니다');
				return document.location.href="/movie/view/jsp/ErrorPage.jsp";
				//modal('my_modal');
			}
		});
			
});

</script>
</head>
<body>
 <jsp:include page="gnb.jsp" ></jsp:include>

        <div id="contents_wrap">
            <div id="myPage_btn">
            <div id="myPage_div_img"><img src="/movie/view/img/예매확인.png" class="myPage_img" id="checkReserveimg" onmouseover="
                    this.style.cursor='pointer'" ></div>
            <div id="myPage_div_img"><img src="/movie/view/img/문의하기.png" class="myPage_img" id="questionimg" onmouseover="
                    this.style.cursor='pointer'"></div>
            <div id="myPage_div_img_active"><img src="/movie/view/img/개인정보변경.png" class="myPage_img active" id="changeInfoimg" onmouseover="
                    this.style.cursor='pointer'"></div>
        </div>
      
            
            <form action="/movie/RenewPassword.do?user_id=${userId }&&user_pw=${user_pw}" method="GET" id="joinform">
                <table id="form_table">
				<c:forEach var="i" items="${user_info}" varStatus="cnt">
				<input type="hidden" id="form_tap" name="userId"
							placeholder="성명을 입력하세요" value="${i.USERID}">
					<tr>
						<td id="table_td">성명</td>
						<td><input type="text" id="form_tap" name="userName"
							placeholder="성명을 입력하세요" value="${i.USERNAME}"></td>
					</tr>
					<tr>
						<td id="table_td">휴대폰 번호</td>
						<td><input type="text" id="form_tap" name="userTel"
							placeholder="핸드폰 번호를 입력하세요" value="${i.USERTEL}"></td>
					</tr>
					<tr>
						<td id="table_td">비밀번호</td>
						<td><input type="password" id="form_tap" name="userPw"
							placeholder="변경할 비밀번호를 입력하시오"></td>
					</tr>
					<tr>
						<td id="table_td">비밀번호 확인</td>
						<td><input type="password" id="form_tap" name="userPwCheck"
							placeholder="변경할 비밀번호 확인"></td>
					</tr>
					<tr>
						<td id="table_td">이메일주소</td>
						<td><input type="text" id="form_tap" class="userEmail"
							placeholder="이메일을 입력하세요" value="${i.USEREMAIL}"></td>
					</tr>


				</c:forEach>
			</table>
                <input type="submit" value="확인" class="form_btn3">
            </form>
            </div>
            <jsp:include page="footer.jsp" ></jsp:include>
    </body>
</html>