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
    <link rel="stylesheet" href="/movie/view/css/myPage3email.css">
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
		 // document.location.href='/movie/view/jsp/myPage3.jsp';
		  document.location.href='/movie/myPage3.do?id=asd';
	  }),
	  $("a#signin").click(function(){
		  alert("form제출");
	  });
			
});
</script>
</head>
<body>
${user_info }
 <jsp:include page="../gnb.jsp" ></jsp:include>
         <div id="contents_wrap">
        <div id="myPage_btn">
            <div id="myPage_div_img"><img src="/movie/view/img/예매확인.png" class="myPage_img" id="checkReserveimg" onmouseover="
                    this.style.cursor='pointer'" ></div>
            <div id="myPage_div_img"><img src="/movie/view/img/문의하기.png" class="myPage_img" id="questionimg" onmouseover="
                    this.style.cursor='pointer'"></div>
            <div id="myPage_div_img_active"><img src="/movie/view/img/개인정보변경.png" class="myPage_img active" id="changeInfoimg" onmouseover="
                    this.style.cursor='pointer'"></div>
        </div>
       
            <!--버튼끝-->
            <!-- <div id="contents">
                <span class="search">구분</span>
                <span><input type="radio" class="search2">예매내역</span>
                <span><input type="radio" class="search2">지난내역</span>&nbsp;
                <span><input type="date" class="search2"></span><span> ~ </span>
                <span><input type="date" class="search2"></span>
                <span><input type="button" value="조회하기"></span>
            </div> -->
            <!--구분탭끝-->      
            <form action="/movie/view/jsp/main.jsp" method="POST" id="joinform">
                <table id="form_table">
                <c:forEach var="i" items="${user_info }" varStatus="cnt"> 
                    <tr>
                        <td class="table_td">성명</td>
                        <td><input type="text" class="form_tap" name="name" placeholder="성명을 입력하세요" value="${i.USER_NAME}"></td>
                    </tr>
                    <tr>
                        <td class="table_td"> 휴대폰 번호</td>
                        <td><input type="text" class="form_tap" name="phone" placeholder="핸드폰 번호를 입력하세요" value="${i.USER_TEL}"></td>
                    </tr>
                    <tr>
                        <td class="table_td">비밀번호</td>
                        <td><input type="password" class="form_tap" name="password" placeholder="비밀번호을 입력하세요" value="${i.USER_PW}"></td>
                    </tr>
                    <tr>
                        <td class="table_td">비밀번호 확인</td>
                        <td><input type="password" class="form_tap" name="contents" placeholder="내용을 입력하세요"></td>
                    </tr>
                    <tr>
                        <td class="table_email">이메일주소</td>
                        <td class="table_email"><input type="text" class="form_tap2" name="email" placeholder="이메일을 입력하세요" value="${i.USER_EMAIL}">
                        &nbsp;@ &nbsp;<select id="select_email">
                        <option>naver.com
                        <option>daum.net
                        <option>google.com
                        <option>yahoo.co.kr
                        <option>hanmail.net
                        <option>직접입력</select>
                        </td>
                    </tr>
                   
                        
                    </c:forEach>
                </table>
                <input type="submit" value="확인" class="form_btn3">
            </form>
            </div>
            <jsp:include page="../footer.jsp" ></jsp:include>
    </body>
</html>