<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
         <link rel="stylesheet" href="/movie/view/css/myPagecommon.css">
      <link rel="stylesheet" href="/movie/view/css/myPage2.css"> 
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var UUid = sessionStorage.getItem('Uid');
function ajaxReplyList(v){
	   var temp="";
	   var id="";
	    $.each(v,function(index,dom){
	    	temp+="<div id=\"QNA_result\">";
	    	temp+="<div class=\"result_title\">";
	    	temp+="<img src=\"/movie/view/img/"+dom.answer_ck+".png\" alt=\"답변여부\" class=\"result_img\">";
	    	temp+="<div class=\"ask_title\"><a href=\"javascript:ajaxcontent()\"  >";
	    	temp+="<span id=ask_title lang="+dom.ask_no+" class=link>"+dom.ask_title+"</span></a>   /"+dom.user_id+"의 글</div>";
	    	temp+="<div class=\"ask_date\"><a href=\"/movie/AnswerList.do?user_id="+dom.user_id+"&ask_no="+dom.ask_no+"\" id=\"Answer\">답변달기</a>"+dom.ask_regdate+"</div>";
	    	    
	    	//temp+="<span><input type=\"button\"value="답변달기\"></button></span>";
	    	
	       //여기아래 부분이 하이드 되어잇음 
	    	 temp+="<div class=\"result_answer\" lang=\"answer\" id="+dom.ask_no+">";
	         temp+="<img src=\"/movie/view/img/답변화살표.png\" alt=\"답변화살표\" class=\"result_img2\">"+dom.ask_contents;
	         temp+="</div>"; 
	         temp+="</div>"; 
	    });
	    $("div#QNA_result").html(temp);

	}

 
function ajaxRequest(url,data,dataType){
   $.ajax({
        url:url,
        type:'POST',
        data:data,
        dataType:dataType,              
        success:function(v){
           ajaxReplyList(v);
           $("div[lang=answer]").hide();
        },
        error:function(e){
           alert('error'+e);
        }
     });

};

$(function(){
	$("button#searchask").click(function(){
			if(UUid!=null){
				ajaxRequest('/movie/selectAsk.do',{id:'${id}'},'json');
			}else{	<!--저장된 아이디 값이 없으면-->
				alert('로그인이 필요합니다');
				modal('my_modal');
			}
		});
	  $('img#checkReserveimg').click(function(){
		  //alert(this);
		  document.location.href='/movie/view/jsp/myPage1.jsp';
	  });
	  $('img#questionimg').click(function(){
		  //alert(this);
		  document.location.href='/movie/view/jsp/Admin/myPage2.jsp';
	  });
	  $('img#changeInfoimg').click(function(){
		  if(UUid!=null){
			  document.location.href='/movie/mypage3.do?id=${id}';
			}else{	<!--저장된 아이디 값이 없으면-->
				alert('로그인이 필요합니다');
				modal('my_modal');
			}
		  
	  });
	
    	  
      
      
	  
});
</script>
</head>

<body>

  <jsp:include page="gnb.jsp"></jsp:include>
     <div id="contents_wrap">
        <div id="myPage_btn">
            <div id="myPage_div_img"><img src="/movie/view/img/예매확인.png" class="myPage_img" id="checkReserveimg" onmouseover="
                    this.style.cursor='pointer'" ></div>
            <div id="myPage_div_img_active"><img src="/movie/view/img/문의하기.png" class="myPage_img active" id="questionimg" onmouseover="
                    this.style.cursor='pointer'"></div>
            <div id="myPage_div_img"><img src="/movie/view/img/개인정보변경.png" class="myPage_img" id="changeInfoimg" onmouseover="
                    this.style.cursor='pointer'"></div>
        </div>
        <!--버튼끝-->
        <!--폼 시작-->`
        <form action="/movie/ask.do?job=ask&id=${id }" method="POST" id="QNAFROM" enctype="multipart/form-data">
            <div id="QNA"><input type="text" class="QNA_title" placeholder="제목을 입력하시오" name="ask_title"></div>
            <div id="QNA"><textarea class="QNA_contents" placeholder="내용을 입력하시오" name="ask_contents"></textarea></div>
			<input type="hidden" name="user_id" value="${id }">
           
            <!--파일추가-->
            <div id="QNA">
            	<div>
            	<input type="file" id="file" name="file">
            	</div>
            </div>
               <!--  <div class="filebox">
	                 <input class="upload-name" value="파일선택" disabled="disabled">
	                 <label for="ex_filename">업로드</label> 
	                 <input type="file" id="ex_filename" class="upload-hidden">
                </div> -->
            <!--파일추가-->
			<input type="hidden" name="answer_ck" value="미답변">
            <div id="btn_tap">
                <input type="submit" value="확인" class="form_submit">
                <input type="button" value="취소" class="form_cancel">
            </div>
		
        </form>

    
        <!--문의내역 시작-->
        
        <div id="result">
            <div class="question">
             <button id="searchask">문의내역</a> 
            </div>
            <div id="QNA_result">
                 <div class="result_title">
                   <!-- <img src="/movie/view/img/미답변.png" alt="미답변" class="result_img">
                    <div class="ask_title">영끌페시기 제목</div>
                    <div class="ask_date">날짜</div>
                </div>
                 <div class="result_title">
                    <img src="/movie/view/img/미답변.png" alt="미답변" class="result_img">영끌페시기 제목
                </div> 
                <div class="result_title">
                    <img src="/movie/view/img/답변완료.png" alt="미답변" class="result_img_active">
                     <div class="ask_title">영끌 포인트 제도은 없나요</div>
                    <div class="ask_date">날짜</div>
                </div>-->


                <!-- <div class="result_answer">
                    <img src="/movie/view/img/답변화살표.png" alt="답변화살표" class="result_img2">답변 뭐시기뭐시기답변 뭐시기뭐시기답변 뭐시기뭐시기답변뭐시기뭐시기답변
                    뭐시기뭐시기답변 뭐시기뭐시기답변뭐시기뭐시기답변 뭐시기뭐시기답변
                    뭐시기뭐시기답변뭐시기뭐시기답변 뭐시기변 뭐시기뭐시기답변ㄴ
                </div> -->

            </div>
 </div>
<!-- paging 부분 시작 --> 
<div class="paging">
							<a href="/web/memberList.do?cmd=memberList&page=1"><img
								src="/movie/view/img/맨처음버튼.gif"
								alt="처음페이지" /></a>
							<c:choose>
								<c:when test="${pageBean.currentPage>1}">
									<a
										href="/web/memberList.do?cmd=memberList&page=${pageBean.currentPage-1}">Before</a>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${pageBean.currentBlock >1 }">
									<a
										href="/web/memberList.do?cmd=memberList&page=${pageBean.startPage-1 }">
										<img src="/movie/view/img/이전버튼.gif" alt="이전" /></a>
								</c:when>
								<c:otherwise>
									<a href="#">
									<img src="/movie/view/img/이전버튼.gif" alt="이전" /></a>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${pageBean.startPage }"
								end="${pageBean.endPage}" step="1">
								<c:choose>
									<c:when test="${i eq pageBean.currentPage }">
										<a href="#"><font size="4" color="red"> [${i}]</font>
										</a>
									</c:when>
									<c:otherwise>
										<a href="/web/memberList.do?cmd=memberList&page=${i}" style="text-decoration: none;
    color: #848484;">
											[${i}]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pageBean.endPage<pageBean.totalPage }">
									<a href="/web/loadReserveList.do?cmd=memberList&page=${pageBean.endPage+1}">
										<img src="/movie/view/img/다음버튼.gif" alt="다음" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="#"> 
									<img src="/movie/view/img/다음버튼.gif" alt="다음" />
									</a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageBean.currentPage<pageBean.totalPage}">
									<a href="/web/memberList.do?cmd=memberList&page=${pageBean.currentPage+1}">
									</a>
								</c:when>
							</c:choose>
							<a href="/web/memberList.do?cmd=memberList&page=${pageBean.totalPage}">
								<img src="/movie/view/img/마지막버튼.gif" alt="마지막페이지" />
							</a>
						</div>
<!-- paging 부분 끝 --> 
 
            </div>
            <!--문의내역 끝-->
            <jsp:include page="footer.jsp"></jsp:include>
           
            </body>

</html>