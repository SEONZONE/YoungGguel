<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="gnb.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      http-equiv="X-UA-Compatible"
      content="width=device-width, initial-scale=1"
    />
    <title>영끌</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--메인 CSS-->
    <link rel="stylesheet" text="text/css" href="/movie/view/css/movie_list.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">



$(function(){   
	/* URL에서 파라미터값 가져오기 */

    var param = getUrlParams();
    result = param.view;       
    
    /* URL에서 파라미터값 가져오기 */
    function getUrlParams() {
       var params = {};
       window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
       return params;
    }
    /* 영화 리스트 버튼 클릭시 onclick 속성 실행 */
   if(result == 'poster'){
      $("#boxoffice").addClass("active");
   }else if(result == 'current'){
      $("#current").addClass("active");      
   }else{
      $("#later").addClass("active");            
   }
   /* 정렬 버튼 함수 */
    $(".align-button img").click(function(){
       var img =$(this).attr('src');    
       if(img == '/movie/view/img/list.PNG'){
        $(".align-button img").attr("src","/movie/view/img/poster.PNG");             
          if(result == 'poster'){
              ajaxList('/movie/ajaxMovieList.do?view=poster','json'); 
          }else if(result == 'current'){
             ajaxList('/movie/ajaxMovieList.do?view=current','json');             
          }else if(result == 'later'){
             ajaxList('/movie/ajaxMovieList.do?view=later','json');                          
          }   
       }else{
    	   /* 버튼이 리스트형일 때 */
          $(".align-button img").attr("src","/movie/view/img/list.PNG");
          if(result == 'poster'){
              ajaxPoster('/movie/ajaxMovieList.do?view=poster','json'); 
          }else if(result == 'current'){
             ajaxPoster('/movie/ajaxMovieList.do?view=current','json');
          }else if(result == 'later'){
             ajaxPoster('/movie/ajaxMovieList.do?view=later','json');
          }
       }
    });
    
  }); 


/* 영화 리스트 함수 */
function select_click(btnSelect){   

   if(btnSelect == 'boxoffice'){
       document.location.href='/movie/movieList.do?view=poster';
    }else if(btnSelect == 'current'){
      document.location.href='/movie/movieList.do?view=current';    
   }else{
      document.location.href='/movie/movieList.do?view=later';    
   } 

}
  
/* 영화목록 포스트형으로 */

function ajaxPoster(url,data,dataType){
      $.ajax({
           url:url,
           type:'POST',
           data:data,
           dataType:dataType,              
           success:function(v){
             ajaxMovieList2(v)
           },
           error:function(e){
              alert(e);
           }
        });   
}
/* 영화목록 포스트형으로 */
function ajaxMovieList2(v){
   var temp="";
   $.each(v,function(index,dom){
      temp+="<div class=\"movie\">";
      temp+="<a href=\"/movie/movieInfo.do?no="+dom.movieCd+"\">";
      temp+="<img src=\"/movie/view/img/"+dom.movieCd+".jpg\" id=\"mposter\" />";
      temp+="<br>";
      temp+="<span id=\"title\">"+dom.movieNm+"</span>";
      temp+="<br>";
      temp+="<span id=\"release\">개봉일 "+dom.openDt+" |</span>";
      temp+="<span id=\"runningtime\">"+dom.showTm+"분</span>";
      temp+="<br>";
      temp+="<span id=\"ratio\">예매율 30%</span>";
      temp+="</a>";
      temp+="<br>";
      temp+="<br>";
      temp+="<button>예매하기</button>";
      temp+=" <span class=\"movie_like\">🤍</span>";
      /* temp+="<img src=\"/movie/view/img/like.png\" class=\"like\" id=\"like\" onclick=\"like()\" />"; */
      temp+="</div>";
   });
   $(".movie-list").html(temp);
}
/* 영화목록 리스트형으로 */

function ajaxList(url,data,dataType){
      $.ajax({
           url:url,
           type:'POST',
           data:data,
           dataType:dataType,              
           success:function(v){
             ajaxMovieList(v)
           },
           error:function(e){
              alert(e);
           }
        });   
}

function ajaxMovieList(v){
    $(".movie").css("display","none");
   var temp="";
   $.each(v,function(index,dom){
      temp+="<li class=\"movie-list-li\">";
      temp+="<div class=\"movie-list-info\" id=\"fleft\">";
      temp+="<img src=\"/movie/view/img/"+dom.movieCd+".jpg\" />";
      temp+="</div>";
       temp+="<div id=\"fleft\">";
      temp+="<a href=\"/movie/movieInfo.do?no="+dom.movieCd+"\">";
       temp+="<div class=\"tit-area\">";
       temp+="<span class=\"title\">"+dom.movieNm+" | </span>";
       temp+="<span class=\"runningtime\">"+dom.showTm+"분 </span>";
        temp+="<span class=\"rate\">예매율 60%</span>";
       temp+="</div>";
       temp+="<div class=\"detail-area\">";
       temp+=" <span>개봉 </span><span class=\"release\">"+dom.openDt+"</span>";
       temp+=" <p class=\"genre\">"+dom.genre+"</p>";
       temp+=" <p class=\"cont\">"+dom.contents+"</p>";
        temp+="</div>";
        temp+="</a>";
        temp+="<div class=\"btn-area\">";
        temp+="<button class=\"reserve\">예매하기</button>";
        temp+=" <span class=\"movie_like\">🤍</span>";
        temp+="</div>";
        temp+="</div>";
        temp+="</li>";
   });
   $(".movie-list").html(temp);
}

</script>
  </head>
  <body>
  <div class="content">
   <div class="select">
      <div class="list_button" style="height: 60px; margin: auto">
        <button id="boxoffice" onclick="select_click(this.id)">박스오피스</button>
        <button id="current" onclick="select_click(this.id)">현재상영작</button>
        <button id="later" onclick="select_click(this.id)">상영예정작</button>
      </div>
      <div class="align-button">
        <img src="/movie/view/img/list.PNG"/>
      </div>
     </div>
      <div class="inner-wrap">
        <div class="movie-list">
           <c:forEach var="i" items="${movieList}" varStatus="cnt">
            <div class="movie">
            <a href="/movie/movieInfo.do?no=${i.movieCd}">
              <img src="/movie/view/img/${i.movieCd}.jpg" id="mposter"/>
              <br>
              <span id="title">${i.movieNm}</span>
              <br>
              <span id="release">개봉일 ${i.openDt} |</span>
              <span id="runningtime">${i.showTm}분</span>
              <br>
              <span id="ratio">예매율 30%</span>
              </a>
              <br>
              <br>
              <button>예매하기</button>
              <span class="movie_like">🤍</span>
             <!--  <img src="/movie/view/img/like.png" class="like" id="like" onclick="like()" /> -->
            </div>
           </c:forEach>
         </div> 
        </div>
      </div>
    <!--content 끝-->
    <!--footer 시작-->
    <jsp:include page="footer.jsp" ></jsp:include>
    <!--footer 끝-->
  </body>
</html>