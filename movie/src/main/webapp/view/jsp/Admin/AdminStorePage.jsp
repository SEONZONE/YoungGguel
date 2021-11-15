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
	<link rel="stylesheet" type="text/css" href="/movie/view/jsp/Admin/css/AdminStore.css" /> 
	
	<script type="text/javascript" src="/movie/view/jsp/Admin/js/jquery.js"></script>
	<script type="text/javascript" src="/movie/view/jsp/Admin/js/switcher.js"></script>

<title>영끌 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('td#ckno').click(function(){
		var value=$("td#ckno").val();
		console.log(value);
		
		$(document).on('click', '#updateReview', function(){	
			   var reviewNo = this.name;
			   var updateText = $('input[id="'+reviewNo+'"]');
			   
			   updateText.attr("disabled", false); //input의 disabled 기능 해제
			   updateText.focus();
			   
			   movieReview('/movie/reviewUpdate.do',$("form#updateForm").serialize(),'json');
		   });
		
		$('button#insert_booking').click(function(){
			//document.location.href='/movie/insertBooking.do';
			form.submit();
			
			});
		/*  뮤비의 리뷰 리스트 */
		  function movieReview(url,data,dataType){
		      $.ajax({
					  url:url,
		    		  type:'POST',
		    		  data:data,
		   			  dataType:dataType,				  
		   			  success:function(v){
		   				//ajax돌리면서 보여줄 함수작성
		   			  },
		   			  error:function(e){
		   				  alert('관람평은 한 번만 등록 가능합니다.');
	    			  }	    		  
		   			  });	
		      }
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
				<li><a href="/movie/view/jsp/Admin/AdminBookingPage.jsp">예매관리</a></li>
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
			<h3 class="tit">스토어 관리</h3>
			<button id="selectStore"><a href="/movie/SelectAllProduct.do">스토어 관리</a>
</button>
<!-- 시작 -->
<div class="selectBtn">

</div>

<!-- 스토어 리스트 -->
<div class="StoreList" id="store" style="overflow:scroll; height:400px;">
 
 <table class="nostyle" id="StoreListTable">
            <tr>
            <tr>
					<th>번호</th>
					<th>체크</th>
					<th>상품코드</th>
					<th>제품명</th>
					<th>제품 구성품</th>
				    <th>가격</th>
				    <th>카테고리</th>
				    <th>이미지</th>
				    <th>판매율</th>
				    <th>수정<th>
				    <th>삭제<th>
				</tr>
            </tr>
            
           <c:forEach var="i" items="${AllProductList }" varStatus="cnt">
				<form>
				<tr>
					<td><c:out value="${cnt.count }"/></td>
					<td id="ckno"><input type="checkbox" VALUE="${i.PNO}"></td>
				    <td>${i. PNO}</td>
				    <td>${i. PNAME}</td>
				    <td>${i. PCONTENTS}</td>
				    <td>${i. PPRICE}</td>
				    <td>${i. PCATEGORY}</td>
				    <td>${i. PIMG}</td>
				    <td>${i. PSALESRATE}</td>
				    
				    <td><input type="submit" value="수정"></td>
				    <td><input type="button" value="삭제"></td>
				  
				</tr>
				</form>
			</c:forEach>
			</table> 
			<!--수정 이나 딜리트 버튼누르면 해당 정보 지우는거 로 하려면
			해당 라디오 버튼 눌럿을떄 정보 가져가야됨 그러려면
			어떤 식으로 해야되나 -->
	</div>
         
			
			</div>
		</div> <!-- /content -->
	</div> <!-- /cols -->
</div> <!-- /main -->
</body>
</html>



