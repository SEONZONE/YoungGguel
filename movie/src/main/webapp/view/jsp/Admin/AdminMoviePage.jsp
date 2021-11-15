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
	<link rel="stylesheet" type="text/css" href="/movie/view/jsp/Admin/css/AdminMovie.css" /> 
	
	<script type="text/javascript" src="/movie/view/jsp/Admin/js/jquery.js"></script>
	<script type="text/javascript" src="/movie/view/jsp/Admin/js/switcher.js"></script>

<title>영끌 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

  $(function(){
    
     $(".selectBtn button").click(function(){
    	 $("div#movie").css("display","none");
    	 if(this.id=="selectMovie"){
    	 	$(".movieList").css("display","block");  		 
    	 	}else if(this.id=="insertMovie"){
    	 	$(".movieInsert").css("display","block");	 
    	 }return null;
     });
     
     //수정 버튼 클릭
     $("button#modify").click(function(){
    	//수정 완료 클릭
    	if(this.innerText=="수정완료"){
    		updateMovie('/movie/UpdateMovie.do',$("form#sendMovie").serialize());
    		this.innerText='수정';
    	}else{
    	this.innerText='수정완료';
    	alert("수정을 시작합니다.");
    	var movieCd=this.className;
    	//input의 disabled 기능 해제
    	$("input[class='"+this.className+"']").attr("disabled",false);    	 
    	$("input[class='"+this.className+"']").css("border","solid 1px");
    	$("td button[class='"+this.className+"']").css("display","block");    		
    	$("td button[class='"+this.className+"']").click(function(){
    		$("textarea.modContents").val($("input[class='"+this.className+"'][name=contents]").val());
    		$(".modContents").css("display","block");
    	});
    	//수정 확인 버튼 클릭시 수정된 내용이 input[name=contents]에 들어감
    	$("button.modContents").click(function(){
    		$("input[class='"+movieCd+"'][name=contents]").val("");
    		$("input[class='"+movieCd+"'][name=contents]").val($("textarea.modContents").val());
    		alert("내용 수정이 완료되었습니다.")
    		$(".modContents").css("display","none");	
    	});   		
    	}
     });
     
     function updateMovie(url,data){
  	   $.ajax({
  			  url:url,
  			  type:'POST',
  			  data:data,				  
  			  success:function(){
  				  alert('수정되었습니다.');
  				  document.location.href='/movie/SelectAllMovie.do';
  			  },
  			  error:function(e){
  				  alert(e);
  			  }
  		  });	
  }
     
     //삭제 버튼 클릭
     $("button#delete").click(function(){
    	 var movieCd = this.className;
    	 var result = confirm("삭제하시겠습니까?");
    	 if(result){
    		 document.location.href='/movie/DeleteMovie.do?movieCd='+movieCd;
    	 }else{
    		 return false;
    	 }
     });

});
  
  function checkForm(frm) {
	     var genres = [];
	     $("input[name=genres]:checked").each(function(){
	    	 genres.push($(this).val());
	     });
	     $("input[name=genre]").val(genres);
	     console.log($("input[name=genre]").val());
	     document.frm.action = "/movie/InsertMovie.do";
	     document.frm.submit();
	     }

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
			<h3 class="tit">영화 관리</h3>

<!-- 시작 -->
<div class="selectBtn">
<button id="selectMovie"><a href="/movie/SelectAllMovie.do">영화리스트</a></button>
<button id="insertMovie">영화 입력</button>
<!-- <button id="fintMovie">찾기</button> -->
</div>

<!-- 영화 리스트 -->
<div class="movieList" id="movie" style="overflow:scroll; height:400px;">
 <table class="nostyle" id="MovieListTable">
            <tr>
               <th id="movieForm_td">번호</th>
               <th id="movieForm_td">영화코드</th>
               <th id="movieForm_td">한글제목</th>
               <th id="movieForm_td">영어제목</th>
               <th id="movieForm_td">러닝타임</th>
               <th id="movieForm_td">개봉일</th>
               <th id="movieForm_td">마감일</th>
               <th id="movieForm_td">개봉상태</th>
               <th id="movieForm_td">내용</th>
               <th id="movieForm_td">국가</th>
               <th id="movieForm_td">장르</th>
               <th id="movieForm_td">감독</th>
               <th id="movieForm_td">배우</th>
               <th id="movieForm_td">연령제한</th>
               <th id="movieForm_td">제작사</th>
               <th id="movieForm_td">수정</th>
               <th id="movieForm_td">삭제</th> 
            </tr>
            
            <c:forEach var="i" items="${AllMovieList}" varStatus="cnt">
               <form id="sendMovie">
            <tr>
               <td><c:out value="${cnt.count }"/></td>
               <td><input type="text" class="${i.movieCd}" name="movieCd" value="${i.movieCd}" disabled="disabled" style="width:60px;"></td>
               <td><input type="text" class="${i.movieCd}" name="movieNm" value="${i.movieNm}" disabled="disabled"></td>
               <td><input type="text" class="${i.movieCd}" name="movieNmEn" value="${i.movieNmEn}" disabled="disabled"></td>
               <td><input type="text" class="${i.movieCd}" name="showTm" value="${i.showTm}" disabled="disabled" style="width:60px;"></td>
               <td><input type="text" class="${i.movieCd}" name="openDt" value="${i.openDt}" disabled="disabled" style="width:70px;"></td>
               <td><input type="text" class="${i.movieCd}" name="endDt" value="${i.endDt}" disabled="disabled" style="width:70px;"></td>
               <td><input type="text" class="${i.movieCd}" name="prdtStatNm" value="${i.prdtStatNm}" disabled="disabled" style="width:70px;"></td>
               <td><input type="text" class="${i.movieCd}" name="contents" value="${i.contents}" disabled="disabled" style="width:300px;">
               <button type="button" class="${i.movieCd}" style="display:none">내용 수정하기</button></td>
               <td><input type="text" class="${i.movieCd}" name="nations" value="${i.nations}" disabled="disabled" style="width:30px;"></td>
               <td><input type="text" class="${i.movieCd}" name="genre" value="${i.genre}" disabled="disabled"></td>
               <td><input type="text" class="${i.movieCd}" name="directors" value="${i.directors}" disabled="disabled"></td>
               <td><input type="text" class="${i.movieCd}" name="actors" value="${i.actors}" disabled="disabled" style="width:60px;"></td>
               <td><input type="text" class="${i.movieCd}" name="watchGradeNm" value="${i.watchGradeNm}" disabled="disabled" style="width:60px;"></td>
               <td><input type="text" class="${i.movieCd}" name="companys" value="${i.companys}" disabled="disabled"></td>
               <td><button type="button" id="modify" class="${i.movieCd}" style="width:40px;">수정</button></td>
               
               <td><button type="button" id="delete" class="${i.movieCd}" style="width:40px;">삭제</button></td>
            </tr>
               </form>
         </c:forEach>
         </table> 
	</div>
         <textarea rows=10 cols=10 class="modContents" style="width:600px; height:200px; display:none;"></textarea>
         <button class="modContents" style="display:none;">확인</button>
			<!-- Form -->
			<div class="movieInsert" id="movie" style="display:none;">
			 <fieldset>
				<legend>영화 입력</legend>
				<table class="nostyle">				
 				<form name="frm" action="javascript:checkForm(document.frm);" method="post" accept-charset="utf-8" enctype="multipart/form-data">
					<tr>
						<td style="width:70px;">영화코드</td>
						<td><input type="text" size="40" name="movieCd" class="input-text" /></td>
					</tr>
					<tr>
						<td style="width:70px;">영화제목</td>
						<td><input type="text" size="40" name="movieNm" class="input-text" /></td>
					</tr>
					<tr>
						<td style="width:70px;">영어제목</td>
						<td><input type="text" size="40" name="movieNmEn" class="input-text" /></td>
					</tr>
					<tr>
						<td style="width:70px;">러닝타임</td>
						<td><input type="text" size="40" name="showTm" class="input-text" /></td>
					</tr>
					<tr>
						<td style="width:70px;">개봉일</td>
						<td><input type="date" size="40" name="openDt" class="input-text" /></td>
					</tr>
					<tr>
						<td style="width:70px;">마감일</td>
						<td><input type="date" size="40" name="endDt" class="input-text" /></td>
					</tr>
					<tr>
						<td style="width:70px;">국가</td>
						<td>
						<select name="nations" size="1">
						    <option>직접입력</option>
						    <option value="한국">한국</option>
						    <option value="미국">미국</option>
						    <option value="영국">영국</option>
						    <option value="러시아">러시아</option>
						    <option value="프랑스">프랑스</option>
						    <option value="일본">일본</option>
						    <option value="중국">중국</option>
						    <option value="인도">인도</option>
						    <option value="태국">태국</option>
						    <option value="독일">독일</option>
						    <option value="체코">체코</option>
						</select>
						<input type="text" size="20" name="nations" class="input-text" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td style="width:70px;">감독</td>
						<td><input type="text" size="40" name="directors" class="input-text" /></td>
					</tr>
					<tr>
						<td style="width:70px;">배우</td>
						<td><input type="text" size="40" name="actors" class="input-text" /></td>
					</tr>
					<tr>
						<td style="width:70px;">제작사</td>
						<td><input type="text" size="40" name="companys" class="input-text" /></td>
					</tr>
					<tr>
						<td class="va-top">내용</td>
						<td><textarea cols="75" rows="7" class="input-text" name="contents"></textarea></td>
					</tr>
					<tr>
						<td style="width:70px;">포스터</td>
						<td><input type="file" size="40" name="poster" class="input-text" /></td>
					</tr>
					<tr>
						<td>연령제한</td>
						<td>
							<label><input type="radio" name="watchGradeNm" value="15세 이상"/>15세 이상</label> &nbsp;
							<label><input type="radio" name="watchGradeNm" value="12세 이상"/>12세 이상</label> &nbsp;
							<label><input type="radio" name="watchGradeNm" value="청소년관람불가"/>청소년관람불가</label> &nbsp;
							<label><input type="radio" name="watchGradeNm" value="전체관람가"/>전체관람가</label>
						</td>
					</tr>
					<tr>
						<td>장르</td>
						<td>
							<label><input type="checkbox" name="genres" value="액션"/>액션</label> &nbsp;
							<label><input type="checkbox" name="genres" value="드라마"/>드라마</label> &nbsp;
							<label><input type="checkbox" name="genres" value="애니메이션"/>애니메이션</label> &nbsp;
							<label><input type="checkbox" name="genres" value="멜로/로맨스"/>멜로/로맨스</label> &nbsp;
							<label><input type="checkbox" name="genres" value="스릴러"/>스릴러</label> &nbsp;
							<label><input type="checkbox" name="genres" value="범죄"/>범죄</label> &nbsp;
							<label><input type="checkbox" name="genres" value="코미디"/>코미디</label> &nbsp;
							<label><input type="checkbox" name="genres" value="공포(호러)"/>공포(호러)</label><br>
							<label><input type="checkbox" name="genres" value="미스터리"/>미스터리</label> &nbsp;
							<label><input type="checkbox" name="genres" value="성인물(에로)"/>성인물(에로)</label> &nbsp;
							<label><input type="checkbox" name="genres" value="어드벤처"/>어드벤처</label> &nbsp;
							<label><input type="checkbox" name="genres" value="사극"/>사극</label> &nbsp;
							<label><input type="checkbox" name="genres" value="전쟁"/>전쟁</label> &nbsp;
							<label><input type="checkbox" name="genres" value="판타지"/>판타지</label> &nbsp;
							<label><input type="checkbox" name="genres" value="다큐멘터리"/>다큐멘터리</label> &nbsp;
							<label><input type="checkbox" name="genres" value="공연"/>공연</label> &nbsp;
							<label><input type="checkbox" name="genres" value="뮤지컬"/>뮤지컬</label>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="t-right"><input type="submit" class="input-submit" value="Submit" /></td>
					</tr>
					<input type="hidden" name="genre"/>				
				</form>
				</table>
			</fieldset>
			</div>
		</div> <!-- /content -->
	</div> <!-- /cols -->
</div> <!-- /main -->
</body>
</html>



