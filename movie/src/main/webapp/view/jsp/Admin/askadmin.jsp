<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
a#Answer{
margin-right:15px;}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/movie/view/css/myPage2.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

 function ajaxReplyList(v){
   var temp="";
   var id="";
    $.each(v,function(index,dom){
    	temp+="<div id=\"QNA_result\">";
    	temp+="<div class=\"result_title\">";
    	temp+="<img src=\"/movie/view/img/"+dom.answer_ck+".png\" alt=\"답변여부\" class=\"result_img\">";
    	temp+="<div class=\"ask_title\"><a href=\"javascript:ajaxcontent()\"  >";
    	temp+="<span id=ask_title lang="+dom.ask_no+" class=link>"+dom.ask_title+"/</span></a></div>";
    	temp+="<div class=\"ask_date\"><a href=\"/movie/AnswerList.do?user_id="+dom.user_id+"&ask_no="+dom.ask_no+"\" id=\"Answer\">답변달기</a>"+dom.ask_regdate+"</div>";
    	    
    	//temp+="<span><input type=\"button\"value="답변달기\"></button></span>";
    	
       //여기아래 부분이 하이드 되어잇음 
    	 temp+="<div class=\"result_answer\" lang=\"answer\" id="+dom.ask_no+">";
         temp+="<img src=\"/movie/view/img/답변화살표.png\" alt=\"답변화살표\" class=\"result_img2\">"+dom.ask_contents;
         temp+="</div>"; 
         temp+="</div>"; 
    });
    $("div#QNA_RE").html(temp);

}

 //만약 가져왓을때 dom.answer_ck가 답변완료면 
	  /* function ajaxRelpayAnswerList(index,dom){
		 var temp2="";
		 $.each(v,function(index,dom){
			 	temp+="<div class=\"result_answer\">";
		        temp+="<img src=\"/movie/view/img/답변화살표.png\" alt=\"답변화살표\" class=\"result_img2\">"+dom.ask_contents;
		        temp+="</div>";
		 });
	 }  */
	 
 function ajaxRequest(url,data,dataType){
	   $.ajax({
	        url:url,
	        type:'POST',
	        data:data,
	        dataType:dataType,              
	        success:function(v){
	           ajaxReplyList(v);
	           $("div[lang=answer]").show();
	        },
	        error:function(e){
	           alert('error'+e);
	        }
	     });

	};
	
$(function(){	
		
		$("button#searchask").click(function(){
			ajaxRequest('/movie/selectAskAnswerList.do',{},'json');
		});
		
	});
	
</script>
</head>
<body>
	<h1>문의내역 불러오기</h1>
	
	<div id="result">
		<div class="question">
			<button id="searchask">문의내역 확인</button>
		</div>
		<div id="QNA_RE"></div>
	</div>
	
	
</body>
</html>