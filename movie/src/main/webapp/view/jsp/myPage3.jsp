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
</head>
 <jsp:include page="gnb.jsp" ></jsp:include>
        <div id="contents_wrap">
            <div id="myPage_btn">
                <div id="myPage_div_img"><img src="/movie/view/img/개인정보변경.png" class="myPage_img actvie" onmouseover="
                        this.style.cursor='pointer'"></div>
                <div id="myPage_div_img"><img src="/movie/view/img/문의하기.png" class="myPage_img" onmouseover="
                        this.style.cursor='pointer'"></div>
                <div id="myPage_div_img_active"><img src="/movie/view/img/예매확인.png" class="myPage_img" onmouseover="
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
            <form action="" method="POST" id="joinform">
                <table id="form_table">
                    <tr>
                        <td id="table_td">성명</td>
                        <td><input type="text" id="form_tap" class="name" placeholder="제목을 입력하세요"></td>
                    </tr>
                    <tr>
                        <td id="table_td"> 휴대폰 번호</td>
                        <td><input type="text" id="form_tap" class="name" placeholder="내용을 입력하세요"></td>
                    </tr>
                    <tr>
                        <td id="table_td">비밀번호</td>
                        <td><input type="text" id="form_tap" class="name" placeholder="내용을 입력하세요"></td>
                    </tr>
                    <tr>
                        <td id="table_td">비밀번호 확인</td>
                        <td><input type="text" id="form_tap" class="name" placeholder="내용을 입력하세요"></td>
                    </tr>
                    <tr>
                        <td id="table_td">이메일주소</td>
                        <td><input type="text" id="form_tap" class="name" placeholder="내용을 입력하세요"></td>
                    </tr>
                   
                        
                    
                </table>
                <input type="submit" value="확인" class="form_btn3">
            </form>
            </div>
            <jsp:include page="footer.jsp" ></jsp:include>
    </body>
</html>