<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="gnb.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>영끌 영화정보</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='/movie/view/css/movie_info.css'> <!--무비인포 CSS-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


  $(function(){

	  /* 로그인 세션 확인 */
	  var UUid = sessionStorage.getItem('Uid');
      
      /* 덧글에 id html로 넣음 */
      $("#sessionId").html(UUid);
      
      var code = $("#movieCd").val();
	  movieReview('/movie/Review.do',{movieCd:code},'json');
      
      /* 로그인 세션이 있을 경우 id값 hidden해서 넘김 */
      if(UUid != null){
      $("#userId").val(UUid);    	  
      }
	  
      /*  뮤비의 리뷰 리스트 */
	  function movieReview(url,data,dataType){
	      $.ajax({
				  url:url,
	    		  type:'POST',
	    		  data:data,
	   			  dataType:dataType,				  
	   			  success:function(v){
	   				movieReviewList(v);
	   			  },
	   			  error:function(e){
	   				  alert(e);
    			  }	    		  
	   			  });	
	      }

	   function movieReviewList(v){
		   var temp="";
		   var id="";
    		$.each(v,function(index,dom){ 		
    			id=dom.userId;
    			temp+="<div class=\"review_list\">";
    			temp+="<div style=\"width: 130px; height: 50px; text-align: center;\">"; 
    			temp+="<span><img src=\"/movie/view/img/usericon.png\"></span><br>";
    			temp+="<span>"+dom.userId+"</span>";
    			temp+="</div>";
    		    if(UUid!=id){
    			  temp+="<div id=\"review_text\" class="+dom.userId+">"+dom.comments;
    			  temp+="<span class=\"updateDate\">"+dom.updateDate+"</span>";
    			  temp+="</div>";
    		    } else {
    			  temp+="<div id=\"review_text\" class="+dom.userId+">"+dom.comments;
    			  temp+="<span class=\"updateDate\">"+dom.updateDate+"</span>";
    			  temp+="<button class=\"review_btn\" id=\"updateReview\" name="+dom.reviewNo+">수정</button>";
    			  temp+="<button class=\"review_btn\" id=\"deleteReview\" name="+dom.reviewNo+">삭제</button>";
    			  temp+="</div>";   		    	
    			  temp+="<form id=\"hiddenValue\">";
    			  temp+="<input type=\"hidden\" id=\"reviewNo\" name=\"reviewNo\" value="+dom.reviewNo+">";
    			  temp+="<input type=\"hidden\" id=\"movieCd\" name=\"movieCd\" value="+dom.movieCd+">";
    			  temp+="</form>";
    		    }
    			temp+="</div>";
	    	});	
    		$(".reviewList").html(temp);
	      }
	   
	   
	   /* 코멘트 작성 후 버튼 클릭시 리뷰리스트에 추가 */
	   $("div#review_button").click(function(){
		   if(UUid == null){
			   alert('로그인 후 관람평 등록이 가능합니다.');
			   $("#comments").val('');
		   }else{
			   movieReview('/movie/reviewInsert.do',$("form#sendReview").serialize(),'json'); 
			   $("#comments").val('');
		   }		   
	   });
	   
	   $(document).on('click', '#deleteReview', function(){
			  movieReview('/movie/reviewDelete.do',$("form#hiddenValue").serialize(),'json');	  
	   });

  });
  
	   /* $(".reviewList.review_list.review_text.review_btn").click(function(){
		  
	   }); */
	   
	  /* 
	   $(".review_btn").on("click",".review_btn", function(){
		   alert("success");
		 }); */
 /*  $(document).on('click', '.deletelanguage', function () {
	    alert("success");
	    $('#LangTable').append(' <br>------------<br> <a class="deletelanguage">Now my class is deletelanguage. click me to test it is not working.</a>');
	}); */
	
</script>
</head>
<body>

    <!--content 시작-->
        <div class="content">
            <div class="black_bar">
                <div class="wrapping">
                    <div id="blur_back_img"  style="background-image: url(/movie/view/img/sp.jpg); "></div>
                    <div id="on_img">
                        <div id="main_title">${info.movieNm}</div>
                        <div id="sub_title">${info.movieNmEn}</div>
                        <div id="right_poster"><img src="/movie/view/img/${info.movieCd}.jpg" style="width: 85%;"></div>
                        <div id="right_button">예매하기</div>
                        <div>
                            <ul>
                                <li class="movie_rank_info">실관람평점
                                    <br><span style="color: #73eaff;">8.9</span>
                                </li>
                                <li class="movie_rank_info">예매율
                                    <br><span >1위</span>
                                </li>
                                <li class="movie_rank_info">누적관객수
                                    <br><span>111,111</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrapping">
                <div class="summary">
                    <div>
                    ${info.contents}
                    </div>
                    <br><br>
                    <div>
                    감독:&nbsp;${info.directors}&nbsp;| 장르:&nbsp;${info.genre}&nbsp;| 개봉일:&nbsp;${info.openDt} <br>
                    출연진:&nbsp;${info.actors}
                    </div>
                </div>
                <div class="review">
                    <span>리뷰 모아보기</span>
                    <form id="sendReview" method="POST"> 
                    <div class="review_lnput">
                    <input type="hidden" name="movieCd" id="movieCd" value="${info.movieCd}"> 
                    <input type="hidden" name="userId" id="userId"> 
                        <div style="width: 130px; height: 50px; text-align: center;"> 
                            <span><img src="/movie/view/img/usericon.png"></span><br>                        
                            <span id="sessionId"></span>
                        </div>
                        <input type="text" placeholder="관람평을 등록해주세요.(200자)" name="comments" id="comments">
                        <div id="review_button">관람평 쓰기</div>
                    </div>
                   </form>
                   <div class="reviewList"></div>
                  <!-- <div class="review_list">
                        <div style="width: 130px; height: 50px; text-align: center;"> 
                            <span><img src="/movie/view/img/usericon.png"></span><br>
                            <span>작성자아이디</span>
                        </div>
                    <div id="review_text">글자수 제한 필요합니다
                    <span class="updateDate">0000</span>
                    <button id="updateReview">수정</button>                 
                    <button id="deleteReview">삭제</button>
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











