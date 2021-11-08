<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta http-equiv="content-type" content="text/html; charset=utf-8" />
   <meta http-equiv="content-language" content="en" />
   <meta name="robots" content="noindex,nofollow" />
    <!-- RESET -->
   <link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/reset.css" />
   <!-- MAIN STYLE SHEET -->
   <link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/main.css" /> 
    <!-- DEFAULT: 2 COLUMNS -->
   <link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/2col.css" title="2col" />
   <!-- ALTERNATE: 1 COLUMN -->
   <link rel="alternate stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/1col.css" title="1col" /> 
   <!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]--> <!-- MSIE6 -->
   <!-- GRAPHIC THEME -->
   <link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/style.css" /> 
   
   <script type="text/javascript" src="/movie/view/jsp/Admin/js/jquery.js"></script>
   <script type="text/javascript" src="/movie/view/jsp/Admin/js/switcher.js"></script>


<title>영끌 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     
  });
</script>  
</head>
<body>
   <div id="main">
   <!-- Tray -->
   <div id="tray" class="box">
      <p class="f-left box">
         <!-- Switcher -->
         <span class="f-left" id="switcher">
            <a href="#" rel="1col" class="styleswitch ico-col1" title="Display one column"><img src="/movie/view/jsp/Admin/design/switcher-1col.gif" alt="1 Column" /></a>
            <a href="#" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img src="/movie/view/jsp/Admin/design/switcher-2col.gif" alt="2 Columns" /></a>
         </span>
         Project: <strong>영끌</strong>
      </p>
      <p class="f-right">관리자: <strong>관리자이름</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a href="#" id="logout">Log out</a></strong></p>
   </div>
    <!--  /tray -->
   <!-- Columns -->
   <div id="cols" class="box">
      <!-- Aside (Left Column) -->
      <div id="aside" class="box">
         <div class="padding box">
            <!-- Logo (Max. width = 200px) -->
            <p id="logo"><a href="#"><img src="/movie/view/jsp/Admin/tmp/logo.jpg" alt="Our logo" title="Visit Site" /></a></p>
         </div> <!-- /padding -->
         <ul class="box">
            <li><a href="#">유저관리</a></li>
            <li><a href="#">영화관리</a></li>
            <li><a href="#">시간표관리</a></li>
            <li><a href="#">예매관리</a></li>
            <li><a href="#">문의하기</a></li>
            <li id="submenu-active"><a href="#">예비 html</a> <!-- Active -->
               <ul>
                  <li><a href="#">예비</a></li>
                  <li><a href="#">예비</a></li>
               </ul>
            </li>
         </ul>
      </div> <!-- /aside -->
      <hr class="noscreen" />
      <!-- Content (Right Column) -->
      <div id="content" class="box">
         <!-- Table (TABLE) -->
         <h3 class="tit">유저 리스트<a href="/movie/selectAllUser.do">유저조회</a></h3>
         
         <table>
            <tr>
               <th id="userForm_td">번호</th>
               <th id="userForm_td">체크</th>
               <th id="userForm_td">유저 ID</th>
                <th id="userForm_td">유저 비밀번호</th>
                <th id="userForm_td">이름</th>
                <th id="userForm_td">핸드폰 번호</th>
                <th id="userForm_td">유저 생일</th>
               <th id="userForm_td">유저 이메일</th>
                <th id="userForm_td">성별</th>
                <th id="userForm_td">수정</th>
                <th id="userForm_td">삭제<th>
            </tr>
            <c:forEach var="i" items="${AllUserList}" varStatus="cnt">
            <tr>
               <td><c:out value="${cnt.count }"/></td>
               <td><input type="radio" VALUE="${i.USERID }"></td>
                <td>${i. USERID}</td>
                <td>${i. USERPW}</td>
                <td>${i. USERNAME}</td>
                <td>${i. USERTEL}</td>
                <td>${i. USERBIRTH}</td>
                <td>${i. USEREMAIL}</td>
                <td>${i. USERGENDER}</td>
                <td><input type="button" value="수정"></td>
                <td><input type="button" value="삭제"></td>
              
            </tr>
         </c:forEach>
         </table>
         <!-- Form -->
         <h3 class="tit">Form</h3>
         <fieldset>
            <legend>Legend</legend>
            <table class="nostyle">
               <tr>
                  <td style="width:70px;">Input:</td>
                  <td><input type="text" size="40" name="" class="input-text" /></td>
               </tr>
               <tr>
                  <td>Input:</td>
                  <td><input type="text" size="40" name="" class="input-text" disabled="disabled" /></td>
               </tr>
               <tr>
                  <td class="va-top">Input:</td>
                  <td><textarea cols="75" rows="7" class="input-text"></textarea></td>
               </tr>
               <tr>
                  <td>Input:</td>
                  <td>
                     <label><input type="checkbox" /> Lorem ipsum</label> &nbsp;
                     <label><input type="checkbox" /> Lorem ipsum</label> &nbsp;
                     <label><input type="checkbox" /> Lorem ipsum</label>
                  </td>
               </tr>
               <tr>
                  <td>Input:</td>
                  <td>
                     <label><input type="radio" /> Lorem ipsum</label> &nbsp;
                     <label><input type="radio" /> Lorem ipsum</label> &nbsp;
                     <label><input type="radio" /> Lorem ipsum</label>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" class="t-right"><input type="submit" class="input-submit" value="Submit" /></td>
               </tr>
            </table>
         </fieldset>
      </div> <!-- /content -->
   </div> <!-- /cols -->
</div> <!-- /main -->
</body>
</html>


