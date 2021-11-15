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
   <link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/admintimetable.css" /> 
   
   <script type="text/javascript" src="/movie/view/jsp/Admin/js/jquery.js"></script>
   <script type="text/javascript" src="/movie/view/jsp/Admin/js/switcher.js"></script>

<title>영끌 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function ajaxRequest(url,data,datatype,callback) {
	$.ajax({
		url:url,
		type:'post',
		data:data,
 		dataType:datatype,
		success:function(success) {
			callback(success);
		},
		error:function(c){                                                                                                                                                                                                                   
			alert("안됨");
		}
	});
}

/* 에이젝스 성공함수 */
function ajaxInsertTimetable(success) {
	document.location.href="/movie/adminTimetable.do";
}
function ajaxDeleteTimetable(success) {
	document.location.href="/movie/adminTimetable.do";
}
function ajaxModifyTimetable(success) {
	document.location.href="/movie/adminTimetable.do";
}


$(function(){
	var id;
	$("button#insert").click(function(){
		var form1 = $("#form").serialize();
		ajaxRequest("/movie/adminTimetableInsert.do",form1,'json',ajaxInsertTimetable);
	});
	
	$(".deletebtn").click(function(){
		ajaxRequest("/movie/adminTimetableDelete.do",{id:id},'json',ajaxDeleteTimetable);
		id = "";
	});
	
	$(".bookingtimeno").click(function(){
		id = $(this).val();
	});
	
	$(".modifybtn").click(function(){
		$(this).addClass("hidden");
		$(this).next().removeClass("hidden");
		$("input[class='"+id+"']").css("border","solid 1px black");
		$("input[class='"+id+"']").attr("disabled",false);
		
		/* var form2 = $("#form2").serialize();
		ajaxRequest("/movie/adminTimetableModify.do",form2,'json',ajaxModifyTimetable); */
	});
	
	$(".modifySuccessbtn").click(function() {
		$(this).addClass("hidden");
		$(this).prev().removeClass("hidden");
		$("input[class='"+id+"']").css("border","0px");
		$("input[class='"+id+"']").attr("disabled",true);
//		alert($("input[class='"+id+"']").val());
		//alert($(this).parent("input[name='bookingdate']").val());
		var gongtong = $(this).parents().children("td")
		var bookingdate = gongtong.children("input[name='bookingdate']").val();
		var bookingtimestart = gongtong.children("input[name='bookingtimestart']").val();
		var bookingtimeend = gongtong.children("input[name='bookingtimeend']").val();
		ajaxRequest("/movie/adminTimetableModify.do",{id:id,bookingdate:bookingdate, bookingtimestart:bookingtimestart,bookingtimeend:bookingtimeend},'json',ajaxModifyTimetable);
		
	});
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
            <li><a href="/movie/boardList.do">유저관리</a></li>
				<li><a href="/movie/SelectAllMovie.do">영화관리</a></li>
				<li><a href="/movie/adminTimetable.do">시간표관리</a></li>
				<li><a href="/view/jsp/Admin/AdminBookingPage.jsp">예매관리</a></li>
				<li><a href="#">문의하기</a></li>
				<li><a href="/movie/SelectAllProduct.do">상품관리하기</a></li>
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
			<form id="form">
			<h3 class="tit">시간표 입력</h3>
				<table style="text-align: center;">
					<tr>
					    <th>영화명</th>
					    <th>상영관번호(고유값)/지역/관</th>
					    <th>상영날짜</th>
					    <th>시작시간</th>
					    <th>종료시간</th>
					</tr>
						<tr>
							<td>
								<input list="movie" name="moviecd">
								  <datalist id="movie">
									<c:forEach var="i" varStatus="cnt" items="${movieList}">
								    	<option value="${i.MOVIECD}" label="${i.MOVIENM}">
								    </c:forEach>
								  </datalist>
						  	</td> 
							<td>
								<input list="theater" name="theaterno">
								  <datalist id="theater">
									<c:forEach var="i" varStatus="cnt" items="${theaterList}">
								    	<option value="${i.THEATERNO}" label="${i.THEATERTOWN} / ${i.THEATERGWAN}">
								    </c:forEach>
								  </datalist>
						  	</td>
						  	<td>
						  		<input type="date" name="bookingdate">
						  	</td>
						  	<td>
						  		<input type="time" name="bookingtimestart">
						  	</td>
						  	<td>
						  		<input type="time" name="bookingtimeend">
						  	</td>
						</tr>
				</table>
				<button type="button" id="insert" value="등록" style="width: 1580px; background-color: white; margin-top: 10px; color: red;" >등록</button>
			</form>
			<h3 class="tit">시간표 리스트</h3>
			<table>
				<tr>
				    <th style="width: 65px;">시간표번호</th>
				    <th>영화번호(고유값)/영화명</th>
				    <th>상영관번호(고유값)/지역/관</th>
				    <th style="width: 80px;">상영날짜</th>
				    <th style="width: 80px;">시작시간</th>
				    <th style="width: 80px;">종료시간</th>
				    <th style="width: 170px;">수정/삭제</th>
				</tr>
				<c:forEach var="list" varStatus="cnt" items="${timetableList}">
					<tr>
						<td><input type="checkbox" value="${list.BOOKINGTIMENO}" class="bookingtimeno" style="width: 80px;"></td>
						<td>${list.BOOKINGMOVIENAME}</td>
						<td>${list.BOOKINGTHEATERNO}</td>
						<td><input type="text" class="${list.BOOKINGTIMENO}" value="${list.BOOKINGDATE}" name="bookingdate" disabled="disabled" style="width: 67px; border: 0px;"></td>
						<td><input type="text" class="${list.BOOKINGTIMENO}" value="${list.BOOKINGTIMESTART}" name="bookingtimestart" disabled="disabled" style="width: 67px; border: 0px;"></td>
						<td><input type="text" class="${list.BOOKINGTIMENO}" value="${list.BOOKINGTIMEEND}" name="bookingtimeend" disabled="disabled" style="width: 67px; border: 0px;"></td>
						<td>
							<button type="button" class="modifybtn">수정</button>
							<button type="button" class="modifySuccessbtn hidden">수정완료</button>
							<button type="button" class="deletebtn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
      </div> <!-- /content -->
   </div> <!-- /cols -->
</div> <!-- /main -->
</body>
</html>


