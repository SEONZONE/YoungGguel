<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<jsp:include page="gnb.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>영끌</title>   
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='/movie/view/css/main.css'> <!-- 메인 CSS -->
   <!--  icon -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&display=swap" rel="stylesheet"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script type="text/javascript">

  $(function(){
  
	$("#popular").click(function(){
		$(this).removeClass("category_off");
		
		ajaxMain('/movie/ajaxMain.do?key=main','json');
	});
	$("#onAir").click(function(){
		ajaxMain('/movie/ajaxMain.do?key=onAir','json');
	});
	$("#scheduled").click(function(){
		ajaxMain('/movie/ajaxMain.do?key=scheduled','json');
	});
	  
	/* 메인에서 검색 */
    $(".glyphicon.glyphicon-search").click(function(){
    	if($("input#textbox").val().length == 0){
    		alert('검색어를 입력해주세요');
    	}else{
    	document.location.href='/movie/movieSearch.do?search='+$("input#textbox").val();
    	}
    });
	
	/* 페이지 로딩시 ajax로 메인에 인기영화 리스트를 뿌림 */
    ajaxMain('/movie/ajaxMain.do?key=main','json');

    function ajaxMain(url,data,dataType){
    	   $.ajax({
    			  url:url,
    			  type:'POST',
    			  data:data,
    			  dataType:dataType,				  
    			  success:function(v){
    				  ajaxMainList(v);
    			  },
    			  error:function(e){
    				  alert(e);
    			  }
    		  });	
      }
    
    /* 메인 호버 컨텐츠 */
    function ajaxMainList(v){
       var temp="";
       var hover="";
        $.each(v,function(index,dom){          
           temp+="<li id="+dom.movieCd+"><a href=\"/movie/movieInfo.do?no="+dom.movieCd+"\"><img src=\"/movie/view/img/"+dom.movieCd+".jpg\" id=\"hoverImg\"></a></li>";         
           hover+="<div class=\"hoverContents\">";
            hover+="<div class=\"main_hover_con\" id="+dom.movieCd+">";         
            hover+="<div class=\"hover_back\">";
            hover+="<div class=\"hover_txt\" id=\"movieNm\" style=\"font-size: 25px; font-weight: bold;\">"+dom.movieNm+"</div>";
            hover+="<div class=\"hover_txt\" style=\"font-size: 17px;\">예매율<span>79%</span></div>";
            hover+="<div class=\"hover_txt\" style=\"font-size: 17px;\">"+dom.genre+"<span>·</span><span>"+dom.showTm+"분</span></div><br><br>";
            hover+="<div class=\"main_hover_btn\">예매하기</div>";
             hover+="<div class=\"main_hover_like\">🤍</div>";
             hover+="<div class=\"main_hover_like_on hidden\">🧡</div>";
             hover+="</div>";
             hover+="</div>";           
               hover+="</div>";
        });
        $(".ajaxList").html(temp);   
        $(".hovercon").html(hover); 
        $(".main_hover_con").css("visibility","hidden");
    }
});

    $(document).on('mouseover', '.ajaxList li', function(){
        var movieCd = this.id;
        console.log(movieCd);
        $('div[id="'+movieCd+'"]').css("visibility","visible");
        $('div[id="'+movieCd+'"]').mouseout(function(){
           $(".main_hover_con").css("visibility","hidden");
        });
      });
</script>
</head>
<body>
 
    <!--content 시작-->
        <div class="content">
            <div class="wrapping">
                <div class="search-box">
                    <form>
                        <input type="text" id="textbox" placeholder="오늘의 영끌은?">
                        <i class="glyphicon glyphicon-search"></i>
                    </form>
                </div>
                <div class="category">
                    <ul>
                        <li><span class="category_off" id="popular">인기순위</span></li>
                        <li><span class="category_on" id="onAir">현재상영작</span></li>
                        <li><span class="category_off" id="scheduled">개봉예정작</span></li>
                    </ul>
                </div>
                <span id="more_view">MORE VIEW&nbsp;&nbsp;&nbsp;></span>
                <div class="movie-list">
                    <ul class="ajaxList">
                    </ul>       
                </div>
               <!-- 호버 컨텐츠 -->
                <div class="movie-list">
                  <div class="hovercon">              
                    </div>           
                </div>
                <!-- 호버 컨텐츠끝 -->
            </div>
        </div>
    <!--content 끝-->
    <!--footer 시작-->
        <div class="footer">
            <div class="wrapping">
                <span class="footercontent"><img src="/movie/view/img/logo.png"></span>
                <p>COPYRIGHT © YoungGgleJoongAng, Inc. All rights reserved</p>
                <p>서울특별시 노원구 월계동    ARS 0914-0924</p>
                <p>대표자명 박원우 · 개인정보보호책임자 박원우 · 사업자등록번호 919-09-090909 · 통신판매업신고번호 제 88256호</p>
            </div>
        </div> 
    <!--footer 끝-->
</body>
</html>

<!-- 미디어쿼리 // 반응형 -->


























