<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='EUC-KR'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>영끌</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!--메인 CSS-->
    <link rel="stylesheet" href="/movie/view/css/schueduler.css">
    <!-- 영화별/극장별 클릭시 이미지 변경 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	ajaxRequest("/movie/scheduler/mainloding.do",{select:null},'json',ajaxmovieList);
});
/* 에이젝스 모듈  */



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
			alert('error'+c);
		}
	});
}

/* 큰 카테고리 무비리스트 에이젝스 성공함수 */
function ajaxmovieList(success) {
	$("div.theatertop").addClass("hidden");
	$("div.movietop").removeClass("hidden");
	$(".day").removeClass('day_nameclick');
	var temp="";
	var temp2="";
	var temp3="";
	$.each(success,function(index,dom){
		temp+="<div class=\"con_name\" data-movie-index=\""+dom.movieCd+"\">"+dom.movieNm+"</div>";
		temp2+="<img src=\"/movie/view/img/"+dom.movieCd+".jpg\" data-movie-index=\""+dom.movieCd+"\" class=\"selectedposterimg hidden\">";
	});
	temp3+="<div class=\"city\">";
	temp3+="<div class=\"cityinfo cityinfoclick\">서울</div>";
	temp3+="<div class=\"cityinfo\">경기</div>";
	temp3+="<div class=\"cityinfo\">인천</div>";
	temp3+="<div class=\"cityinfo\">대전/충청/세종</div>";
	temp3+="<div class=\"cityinfo\">부산/대구/경남</div>";
	temp3+="<div class=\"cityinfo\">광주/전라</div>";
	temp3+="<div class=\"cityinfo\">강원</div>";
	temp3+="</div>";
 	temp3+="<img src=\"/movie/view/img/좌측icon.png\" id=\"towncontrolliconright\">";
	temp3+="<div class=\"town\">";
	temp3+="<div class=\"towninfo\">왕십리</div>";
	temp3+="<div class=\"towninfo\">동대문</div>";
	temp3+="</div>";
	temp3+="<img src=\"/movie/view/img/우측icon.png\" id=\"towncontrolliconleft\">";
	$("div.choicer_con_info").html(temp);
	$("div.selectedposter").html(temp2);
	$("div.locationtab").html(temp3);
	evtBind();
}

/* 큰 카테고리 상영관리스트 에이젝스 성공함수 */
function ajaxtheaterList(success){
	$("div.movietop").addClass("hidden");
	$("div.theatertop").removeClass("hidden");
	$(".day").removeClass('day_nameclick');
	var temp="";
	var temp2="";
	$.each(success,function(index,dom){
		temp+="<div class=\"town_name\">"+dom.theaterTown+"</div>";
	});
	temp2+="<img src=\"/movie/view/img/f4f4f4.png\" class=\"selectedposterimg\">";
	$("div.choicer_con_info").html(temp);
	$("div.selectedposter").html(temp2);
	$("div.locationtab").html("");
	evtBind();
}

/* 상영관별 대분류 클릭시 중분류 출력 에이젝스 성공함수 */
function ajaxtownList(success) {
	var temp="";
	$.each(success,function(index,dom){
		temp+="<div class=\"towninfo\">"+dom.theaterTown+"</div>";
	});
	$("div.town").html(temp);
	evtBind();
}
/* 영화별 리스트 에이젝스 성공함수 */
function ajaxGwanList(success) {
	var temp="";
	var theaternum = null;
	
/* 
	    <div class="infoboxContainer">
	    
	        <div class="theaterbox">
	            <div class="theaternum">1234관</div>
	            <div class="theaterseatcount">총 232석</div>
	        </div>
	        <div class="infobox">
	            <div class="scheduledtime">15시30분</div>
	        </div>
	        
        </div>
     */
	
	
	$.each(success,function(index,dom){
		if(theaternum == null) {
			theaternum = dom.bookingGwan;
			temp+="<div class=\"infoboxContainer\">";
			temp+="<div class=\"theaterbox\">";
			temp+="<div class=\"theaternum\">"+dom.bookingGwan+"</div>";
			temp+="<div class=\"theaterseatcount\">총 "+dom.bookingTheaterroomseat+"</div>";
			temp+="</div>";
			temp+="<div class=\"infobox\">";
			temp+="<div class=\"scheduledtime\">"+dom.bookingTimeStart+"</div>";
			temp+="<div class=\"remainingseat\">낭낭~</div>";
			temp+="</div>";
		}else{
			if(theaternum == dom.bookingGwan){
				temp+="<div class=\"infobox\">";
				temp+="<div class=\"scheduledtime\">"+dom.bookingTimeStart+"</div>";
				temp+="<div class=\"remainingseat\">낭낭~</div>";
				temp+="</div>";
			}else{
				theaternum = dom.bookingGwan;
				temp+="</div>";
				temp+="<div class=\"infoboxContainer\">";
				temp+="<div class=\"theaterbox\">";
				temp+="<div class=\"theaternum\">"+dom.bookingGwan+"</div>";
				temp+="<div class=\"theaterseatcount\">총 "+dom.bookingTheaterroomseat+"</div>";
				temp+="</div>";
				temp+="<div class=\"infobox\">";
				temp+="<div class=\"scheduledtime\">"+dom.bookingTimeStart+"</div>";
				temp+="<div class=\"remainingseat\">낭낭~</div>";
				temp+="</div>";
		}
	  }
	});
	temp+="</div>";
	$(".infogroup").html(temp);
}

/* 상영관별 리스트 에이젝스 성공함수 */
function ajaxGwanMovieList(success) {
	
	var temp="";
	var movieNm = "";
	var theaternum = "";
	
	$.each(success,function(index,dom){
		if(movieNm == dom.bookingMovieName){ //1
			//모가디슈
			if(theaternum == dom.bookingGwan){ //2
				temp+="<div class=\"infobox\">";
				temp+="<div class=\"scheduledtime\">"+dom.bookingTimeStart+"</div>";
				temp+="<div class=\"remainingseat\">12석</div>";
				temp+="</div>";
			}else{ //2
				//infoboxContainter부터 만들어야함
				temp+="</div>";
				theaternum = dom.bookingGwan;
				temp+="<div class=\"infoboxContainer\">";
				temp+="<div class=\"theaterbox\">"; 			
				temp+="<div class=\"theaternum\">"+dom.bookingGwan+"</div>";
				temp+="<div class=\"theaterseatcount\">총"+dom.bookingTheaterroomseat+"</div>";
			    temp+="</div>";
			    temp+="<div class=\"infobox\">";
				temp+="<div class=\"scheduledtime\">"+dom.bookingTimeStart+"</div>";
				temp+="<div class=\"remainingseat\">낭낭~</div>";
				temp+="</div>";
			}			
		}else{ //1
			/* movieNm이 다를 때 */
			//모가디슈
		    movieNm = dom.bookingMovieName;	
		    temp+="</div>"; //infoboxContainer 닫음
		    temp+="<div class=\"movieinfo\">"+dom.bookingMovieName+"</div>";		
		    temp+="<div class=\"schedulinfo\">"; //div
			temp+="<div class=\"infoboxContainer\">"; //div
			temp+="<div class=\"theaterbox\">";
			//관 넘버
			if(theaternum == dom.bookingGwan){ //3
				temp+="<div class=\"infobox\">";
				temp+="<div class=\"scheduledtime\">"+dom.bookingTimeStart+"</div>";
				temp+="<div class=\"remainingseat\">낭낭~</div>";
				temp+="</div>";
			}else{	//3
				theaternum = dom.bookingGwan;
				temp+="<div class=\"theaternum\">"+dom.bookingGwan+"</div>";
				temp+="<div class=\"theaterseatcount\">총"+dom.bookingTheaterroomseat+"</div>";
			    temp+="</div>";
			    temp+="<div class=\"infobox\">";
				temp+="<div class=\"scheduledtime\">"+dom.bookingTimeStart+"</div>";
				temp+="<div class=\"remainingseat\">낭낭~</div>";
				temp+="</div>";
			}
		}
	});
	temp+="</div>";
	$(".infogroup").html(temp);
}

/* 큰 카테고리 클릭시 변경이벤트 */
$(function(){
    var key;
    var cityvar;
    var conname;
 	var datekey;
 	var	towninfo;
 	var townname;
     /* 큰 카테고리 무비클릭시 변경이벤트 */
     $("div.schedulmovie").click(function(){
     	 key = "movie";
    	 $("div.schedultheater").removeClass('on').addClass('off');
    	 $("div.schedulmovie").removeClass('off').addClass('on');
    	 ajaxRequest("/movie/scheduler/mainloding.do",{select:key},'json',ajaxmovieList);
	});
     /* 큰 카테고리 상영관클릭시 변경이벤트 */
     $("div.schedultheater").click(function(){
    	 key = "theater";
    	 cityvar = "서울";
    	 $("div.schedulmovie").removeClass('on').addClass('off');
    	 $("div.schedultheater").removeClass('off').addClass('on');
    	 
    	 ajaxRequest("/movie/scheduler/mainloding.do",{select:key,city:cityvar},'json',ajaxtheaterList);
	});
    /* 상영관 대분류(city)클릭시 중분류 출력  */
    $("div.theatertop").click(function(){
    	$("div.theatertop").addClass('btnoff');
    	$(this).removeClass('btnoff');
		cityvar = $.trim($(this).text());
		ajaxRequest("/movie/scheduler/mainloding.do",{select:"theater",city:cityvar},'json',ajaxtheaterList);
	});
});
  
/* 이벤트 바인드 */
function evtBind(){
	/* 영화클릭시 on/off 이벤트 및 포스터 출력 */
   $("div.con_name").click(function() {
		$(this).addClass('con_nameclick');
    	$("div.con_name").not($(this)).removeClass('con_nameclick');
		data = $(this).data("movie-index");
		movie = $("[data-movie-index="+data+"]");
		$(".selectedposterimg").addClass('hidden');
		for(var i = 0; i < movie.length; i++) {
			if (movie.eq(i).prop('tagName') === 'IMG') {
				movie.eq(i).removeClass('hidden');
			}
		}
		conname = $(this).text();
		console.log(conname);
		if(conname != null && datekey != null && townname != null){
			ajaxRequest("/movie/scheduler/gwanList.do",{moviename:conname,town:towninfo,date:datekey},'json',ajaxGwanList);
		}
	});
   /* 대문류 클릭시 on/off 이벤트 및 중분류 ajax실행  */
   $(".cityinfo").click(function(){
  	 	var cityvar;
	    $(".cityinfo").removeClass('cityinfoclick');
 	  	$(this).addClass('cityinfoclick');
 	  	cityvar = $(this).text();
 	  	ajaxRequest("/movie/scheduler/mainloding.do",{select:"theater",city:cityvar},'json',ajaxtownList);
	});
   /* 중분류 클릭시  on/off 이벤트 */
   $("div.town_name").click(function(){
		$(this).addClass('con_nameclick');
   		$("div.town_name").not($(this)).removeClass('con_nameclick');
   		townname = $(this).text();
   		if(townname != null && datekey != null){
			ajaxRequest("/movie/scheduler/gwanMovieList.do",{town:townname,date:datekey},'json',ajaxGwanMovieList);
		}
	});
   /* 영화별 중분류 클릭시 on/off 이벤트 */
   $(".towninfo").click(function(){
  	 	$(".towninfo").removeClass('towninfoclick');
 	  	$(this).addClass('towninfoclick');
		towninfo = $(this).text();
		if(conname != null && datekey != null && towninfo != null){
			ajaxRequest("/movie/scheduler/gwanList.do",{moviename:conname,town:towninfo,date:datekey},'json',ajaxGwanList);
		}
	});
   /* 날짜 클릭시 버튼 on / 변수넣기  */
   $(".day").click(function name() {
	   	$(".day").removeClass('day_nameclick');
	   	$(this).addClass('day_nameclick');
	   	datekey=$(this).find('#datekey').text();
	   	if(townname != null && datekey != null){
	   		ajaxRequest("/movie/scheduler/gwanMovieList.do",{town:townname,date:datekey},'json',ajaxGwanMovieList);
		}
	   	if(conname != null && datekey != null && towninfo != null){
	   		ajaxRequest("/movie/scheduler/gwanList.do",{moviename:conname,town:towninfo,date:datekey},'json',ajaxGwanList);
		}
	});
}


</script>
</head>
<body>
    <!--gnb 시작-->
       <jsp:include page="gnb.jsp" ></jsp:include>
    <!--gnb 끝-->
    <!--content 시작-->
        <div class="content">
            <div class="wrapping">
                <div id="schedulbox">
                    <div class="schedulgroup">
                        <div class="schedulmovie on">
                            <img src="/movie/view/img/영화별.png" class="btn_img">
                        </div>
                        <div class="schedultheater off">
                            <img src="/movie/view/img/극장별.png" class="btn_img">
                        </div>
                    </div>
                    <div class="schedulnav">
                        <div class="choicer" id="choicer_top">
                        	<div class="movietop hidden">전체영화</div>
                           <c:forEach var="i" items="${city}" varStatus="cnt">
                            <div class="theatertop hidden btnoff">
                          	 	${i.theaterCity}
                            </div>
                            </c:forEach>
                        </div>
                        <div class="choicer" id="choicer_con">
                            <div class="choicer_con_info">
								
                            </div>
                        </div>
                    </div>
                    <div class="selectedposter">
                       
                    </div>
                </div>
                <c:set var="now" value="<%=new java.util.Date()%>"/>
				<c:set var="date"><fmt:formatDate value="${now}" pattern="yyyy.MM" /></c:set> 
                <div class="selectdate">
                    <div class="selectdateconright">
                    <span><c:out value="${date}" />
                    
					</span>
                    <img src="/movie/view/img/좌측icon.png" id="controllicon">
                    </div>
                    <div class="date_info">
                    <c:forEach items="${list1}" var="list1" varStatus="status">
                    	<div class="day">
                            <span id="datekey">${list1}</span>
                            <span id="dayinfo">${list2[status.index]}</span>
                            <span>${list3[status.index]}</span>
                        </div>                   
                    </c:forEach>
                    </div>
                    <div class="selectdateconrleft">
                        <img src="/movie/view/img/우측icon.png" id="controllicon">
                    </div>
                </div>
                <div class="locationtab">
 
                </div>
            	<div class="infogroup">
            	<!--
                     <div class="movieinfo">정보입니다</div>
                    <div class="schedulinfo">
                        <div class="infoboxContainer">
                            <div class="theaterbox">
                                <div class="theaternum">1234관</div>
                                <div class="theaterseatcount">총 232석</div>
                            </div>
                            <div class="infobox">
                                <div class="scheduledtime">15시30분</div>
                                <div class="remainingseat">12석</div>
                            </div>
                            <div class="infobox">
                                <div class="scheduledtime">15시30분</div>
                                <div class="remainingseat">12석</div>
                            </div>
                            <div class="infobox">
                                <div class="scheduledtime">15시30분</div>
                                <div class="remainingseat">12석</div>
                            </div>
                            </div>
                        </div> -->
                     </div> 
            </div>
        </div>
    <!--content 끝-->
    <!--footer 시작-->
        <jsp:include page="footer.jsp" ></jsp:include>
    <!--footer 끝-->
</body>
</html>





