<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]-->
<!-- MSIE6 -->
<!-- GRAPHIC THEME -->
<link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/style.css" />
<link rel="stylesheet" href="/movie/view/jsp/Admin/css/AdminBooking.css">
<script type="text/javascript" src="/movie/view/jsp/Admin/js/jquery.js"></script>
<script type="text/javascript" src="/movie/view/jsp/Admin/js/switcher.js"></script>


<title>영끌 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

var clickSeatNo = ""; //삭제 버튼을 눌렀을 때 좌석번호
var clickDelete = ""; //삭제 버튼에 해당하는 예매번호
var clickSeat1 = ""; //삭제 버튼을 눌렀을 때 좌석번호1	
var clickSeat2 = ""; //삭제 버튼을 눌렀을 때 좌석번호2

	$(function() {

		function listAjax(url, data, dataType, methodName) {
			$.ajax({
				url : url,
				type : 'POST',
				data : data,
				dataType : dataType,
				success : function(v) {
					if (methodName == "allList") {
						allList(v);
						

					}
					else if(methodName == "deleteList") { 
						alert("삭제완료");
						listAjax('/movie/allList.do', {allSelect : 'allSelect'}, 'json', 'allList');
					}
				},
				error : function(e) {
					console.log("실패");
					console.log("error" + e);
				}
			});

		}
		//예매내역 출력
		function allList(v) {
			var tempAllList = ""
			$.each(v,
					function(index, dom) {
						
						tempAllList += "<tr>";
						tempAllList += "<th class =\"deleteButtonNo\" id=\"listBar\">" + dom.bookingNo+ " </th>";
						tempAllList += "<th id=\"listBar\">"+ dom.bookingUserId + "</th>";
						tempAllList += "<th id=\"listBar\">"+ dom.bookingMovieName + "</th>";
						tempAllList += "<th id=\"listBar\">" + dom.bookingTown+ "</th>";
						tempAllList += "<th id=\"listBar\">"+ dom.bookingTimeStart + "</th>";
						tempAllList += "<th id=\"listBar\">" + dom.bookingDate+ " </th>";
						tempAllList += "<th class =\"deleteSeatNo\" id=\"listBar\">" + dom.bookingSeat+ " </th>";
						tempAllList += "<th  class =\"deleteSeat1\" id=\"listBar\">" + dom.bookingSeat1+ " </th>";
						tempAllList += "<th  class =\"deleteSeat2\" id=\"listBar\">" + dom.bookingSeat2+ " </th>";
						tempAllList += "<th id=\"listBar\"><button >좌석 수정</button></th>";
						tempAllList += "<th id=\"listBar\"><button class=\"deleteButton\">삭제</button></th>"; 
						tempAllList += "</tr>";
						
					});
			$(".bookingList").html(tempAllList);
			evtbind();
		}
	
		function evtbind() { 
			
			//삭제 이벤트
			$("button.deleteButton").click(function () {
				clickDelete = $(this).parents().children("th[class='deleteButtonNo']").text();
				clickSeat1 = $(this).parents().children("th[class='deleteSeat1']").text();
				clickSeat2 = $(this).parents().children("th[class='deleteSeat2']").text();
				clickSeatNo = $(this).parents().children("th[class='deleteSeatNo']").text();
				var returnValue = confirm("예매번호:"+ clickDelete +"를 삭제하시겠습니까?");
				if(returnValue == true) {  
					listAjax('/movie/deletList.do',{deleteOne : clickDelete,deleteSeat1 : clickSeat1, deleteSeat2 : clickSeat2, deleteSeatNo : clickSeatNo},'text','deleteList');
				} 
			});
		}

		/* 메인에서 검색 */
		$(".glyphicon.glyphicon-search").click(function() {
			if ($("input#textbox").val().length == 0) {
				listAjax('/movie/allList.do', {allSelect : 'allSelect'}, 'json', 'allList');
			} else {

			}
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
				<span class="f-left" id="switcher"> <a href="#" rel="1col" class="styleswitch ico-col1" title="Display one column"><img
						src="/movie/view/jsp/Admin/design/switcher-1col.gif" alt="1 Column"
					/></a> <a href="#" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img src="/movie/view/jsp/Admin/design/switcher-2col.gif" alt="2 Columns" /></a>
				</span> Project: <strong>영끌</strong>
			</p>
			<p class="f-right">
				관리자: <strong>관리자이름</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a href="#" id="logout">Log out</a></strong>
			</p>
		</div>
		<!--  /tray -->
		<!-- Columns -->
		<div id="cols" class="box">
			<!-- Aside (Left Column) -->
			<div id="aside" class="box">
				<div class="padding box">
					<!-- Logo (Max. width = 200px) -->
					<p id="logo">
						<a href="#"><img src="/movie/view/jsp/Admin/tmp/logo.jpg" alt="Our logo" title="Visit Site" /></a>
					</p>
				</div>
				<!-- /padding -->
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
						</ul></li>
				</ul>
			</div>
			<!-- /aside -->
			<hr class="noscreen" />
			<!-- Content (Right Column) -->
			<div id="content" class="box">
				<!-- Table (TABLE) -->

				<table>
					<div class="search-box">
						<form>
							<input type="text" id="textbox" placeholder="회원 아이디, 예매번호 입력 "> <i class="glyphicon glyphicon-search"></i>
						</form>
					</div>

					<tr id="upperBar">
						<th>예매번호</th>
						<th>회원아이디</th>
						<th>영화</th>
						<th>영화관</th>
						<th>상영시간</th>
						<th>상영날짜</th>
						<th>SE_NO</th>
						<th>좌석넘버1</th>
						<th>좌석넘버2</th>
					
					</tr>
					

				</table>
				<table class="bookingList">
					
				</table>


			</div>
			<!-- /content -->
		</div>
		<!-- /cols -->
	</div>
	<!-- /main -->
</body>
</html>



