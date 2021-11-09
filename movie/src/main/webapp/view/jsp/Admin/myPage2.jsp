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
 function ajaxReplyList(v){
   var temp="";
    $.each(v,function(index,dom){
    	temp+="<div id=\"QNA_result\">";
    	temp+="<div class=\"result_title\">";
    	temp+="<img src=\"/movie/view/img/"+dom.answer_ck+".png\" alt=\"미답변\" class=\"result_img\">";
        temp+="<div class=\"ask_title\">"+dom.ask_title+"</div>";
        temp+="<div class=\"ask_date\">"+dom.ask_regdate+"</div>";
        temp+="</div>";
    });
    $("div#QNA_RE").html(temp);
} 
function ajaxRequest(url,data,dataType){
   $.ajax({
        url:url,
        type:'POST',
        data:data,
        dataType:dataType,              
        success:function(v){
           ajaxReplyList(v);
        },
        error:function(e){
           alert('error'+e);
        }
     });

};

$(function(){
	$("button#searchask").click(function(){
			ajaxRequest('/movie/selectAsk.do',{id:'seonzone'},'json')
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
		  //alert(this);
		 // document.location.href='/movie/view/jsp/myPage3.jsp';
		  document.location.href='/movie/mypage3.do?id=asd';
	  });
/* 	  $("a#searchask").click(function(){
	         ajaxRequest('${pageContext.request.contextPath}/mypage2.do',$("form#QNAFROM").serialize(),'json');
	        
	      }); */
	  
});
</script>
</head>

<body>
<!-- <a href="/movie/selectAsk.do">asasdas -->
  <jsp:include page="../gnb.jsp"></jsp:include>
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
        <!--폼 시작-->
        <form action="/movie/ask.do?job=new" method="POST" id="QNAFROM" enctype="multipart/form-data">
            <div id="QNA"><input type="text" class="QNA_title" placeholder="제목을 입력하시오" name="ask_title"></div>
            <div id="QNA"><textarea class="QNA_contents" placeholder="내용을 입력하시오" name="ask_contents"></textarea></div>
            <!-- <div id="QNA"><input type="file" class="QNA_file"></div>     -->

           
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

            <div id="btn_tap">
                <input type="submit" value="확인" class="form_submit">
                <input type="button" value="취소" class="form_cancel">
            </div>

        </form>

    
        <!--문의내역 시작-->
        
        <div id="result">
            <div class="question">
             <button id="searchask">문의내역 확인</a> 
            </div>
            <div id="QNA_RE">
          
                 </div>
                <!-- <!-- <div class="result_title">
                    <img src="/movie/view/img/미답변.png" alt="미답변" class="result_img">영끌페시기 제목
                </div> 
                <div class="result_title">
                    <img src="/movie/view/img/답변완료.png" alt="미답변" class="result_img_active">
                     <div class="ask_title">영끌 포인트 제도은 없나요</div>
                    <div class="ask_date">날짜</div>
                </div>
 -->

                <div class="result_answer">
                    <img src="/movie/view/img/답변화살표.png" alt="답변화살표" class="result_img2">답변 뭐시기뭐시기답변 뭐시기뭐시기답변 뭐시기뭐시기답변뭐시기뭐시기답변
                    뭐시기뭐시기답변 뭐시기뭐시기답변뭐시기뭐시기답변 뭐시기뭐시기답변
                    뭐시기뭐시기답변뭐시기뭐시기답변 뭐시기변 뭐시기뭐시기답변ㄴ
                </div>

            
 </div>
            </div>
            <!--문의내역 끝-->
            <jsp:include page="../footer.jsp"></jsp:include>
           
            </body>

</html>