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
	   				  alert('관람평은 한 번만 등록 가능합니다.');
    			  }	    		  
	   			  });	
	      }

      /* 뮤비 리뷰 리스트 */
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
    			/* 세션에 아이디가 없을 때 수정, 삭제 등의 기능을 추가하지 않고 리뷰 리스트 생성 */
    		    if(UUid!=id)
    		    {
    			  temp+="<div id=\"review_text\" class="+dom.userId+" name="+dom.reviewNo+">"+dom.comments; 
    			  temp+="<div id=\"btnBundle\">";
    			  temp+="<span class=\"updateDate\">"+dom.updateDate+"</span>";
    			  temp+="</div>";
    			  temp+="</div>";
    		    } 
    		    else 
    		    {/* 세션에 아이디가 있을 때  */
    			  temp+="<div id=\"review_text\" class="+dom.userId+" name="+dom.reviewNo+">"
    			  /* 3. 리뷰 수정 시 submit할 form, {movieCd,reviewNo,comments} */
    			  temp+="<form id=\"updateForm\">";
    			  temp+="<input type=\"text\" id="+dom.reviewNo+" name=\"comments\" value='"+dom.comments+"' maxlength=\"200\" disabled >";
    			  temp+="<input type=\"hidden\" name=\"reviewNo\" value="+dom.reviewNo+">";
    			  temp+="<input type=\"hidden\" name=\"movieCd\" value="+dom.movieCd+">";
    			  temp+="</form>";
    			  /* 2. 리뷰 수정 후 확인 버튼 */
    			  temp+="<button class=\"hidden\" id="+dom.reviewNo+">확인</button>"
    			  temp+="<div id=\"btnBundle\">";
    			  /* 1. 수정, 삭제 버튼 */
    			  temp+="<button class=\"review_btn\" id=\"updateReview\" name="+dom.reviewNo+" value="+dom.comments+">수정</button>";
    			  temp+="<button class=\"review_btn\" id=\"deleteReview\" name="+dom.reviewNo+">삭제</button>";
    			  temp+="<span class=\"updateDate\">"+dom.updateDate+"</span>";
    			  temp+="</div>";
    			  temp+="</div>";   		
    			  /* 리뷰 삭제 시 submit할 form {reviewNo, movieCd} */
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
		   /* 로그인이 안되어 있을 때 */
		   if(UUid == null){
			   alert('로그인 후 관람평 등록이 가능합니다.');
			   $("#comments").val('');
		   }else{
			   movieReview('/movie/reviewInsert.do',$("form#sendReview").serialize(),'json'); 
			   $("#comments").val('');	
		   }
	   });
	   
	   /* 리뷰 삭제 버튼 클릭 */
	   $(document).on('click', '#deleteReview', function(){
		   movieReview('/movie/reviewDelete.do',$("form#hiddenValue").serialize(),'json');	  
	   });
	   /* 리뷰 수정 클릭 */
	   $(document).on('click', '#updateReview', function(){	
		   var reviewNo = this.name;
		   var updateText = $('input[id="'+reviewNo+'"]');
		   
		   updateText.attr("disabled", false); //input의 disabled 기능 해제
		   updateText.focus();
		   
		   /* 리뷰 수정 확인 버튼 */
		   $('button[id="'+reviewNo+'"]').removeClass("hidden");
		   /* 리뷰 업데이트 */
		   $('button[id="'+reviewNo+'"]').click(function(){ 
			   movieReview('/movie/reviewUpdate.do',$("form#updateForm").serialize(),'json');
		   });
		   
	   });
	  
  });

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
                        <input type="text" placeholder="관람평을 등록해주세요.(200자)" name="comments" id="comments" maxlength="200">
                        <div id="review_button">관람평 쓰기</div>
                    </div>
                   </form>
                   <div class="reviewList"></div>
            </div>
        </div>
</div>
    <!--content 끝-->
    <!--footer 시작-->
        <jsp:include page="footer.jsp" ></jsp:include>
    <!--footer 끝-->
</body>
</html>





















