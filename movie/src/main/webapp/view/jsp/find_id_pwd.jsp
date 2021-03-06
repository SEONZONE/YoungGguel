<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <link rel='stylesheet' href='/movie/view/css/find_id_pwd.css'>
    <script src="../js/join.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     
  });
</script>
</head>
<body>
    <div class="find_Wrapping">
        <div class="find">
            <div class="contents">
                <div class="topcon">
                    <span>아이디/비밀번호 찾기</span>
                    <img src="/movie/view/img/popupx.png" style="position: absolute; right: 34%; cursor: pointer;">
                </div>
                <div class="find_list">
                    <div class="find_btn ">아이디 찾기</div><div class="find_btn off">비밀번호 찾기</div>
                </div>
                <div class="midcon_Wrapping">
                    <div class="midcon">
                        <!-- id 찾기-->
                        <div class="find_id ">
                            <div class="mid_top">아이디 찾기입니다.</div>
                            <div class="mid_top">회원정보를 입력해주세요.</div><br>
                            <form>
                                <ul class="info_list">
                                    <li><div>성명</div><input type="text"></li>
                                    <li><div>생년월일</div><input type="text"></li>
                                    <li><div>휴대폰번호</div><input type="text"></li>
                                </ul>
                                <button id="find_id_btn">아이디 찾기</button>
                            </form>
                        </div>
                        <!-- pwd 찾기-->
                        <div class="find_pwd hidden">
                            <div class="mid_top">비밀번호 찾기입니다.</div>
                            <div class="mid_top">회원정보를 입력해주세요.</div><br>
                            <form>
                                <ul class="info_list">
                                    <li><div>아이디</div><input type="text"></li>
                                    <li><div>성명</div><input type="text"></li>
                                    <li><div>휴대폰번호</div><input type="text"><span class="phone_number_check">인증요청</span></li>
                                    <li><div>인증번호</div><input type="text"><span class="phone_check">인증확인</span></li>
                                </ul>
                                <button id="find_pwd_btn">비밀번호 찾기</button>
                            </form>
                        </div>
                    </div>
                </div>        
            </div>
        </div>
    </div>
</body>
</html>