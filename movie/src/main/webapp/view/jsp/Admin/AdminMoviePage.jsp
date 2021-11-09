<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/movie/view/css/adminPage.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var temp="";
//영화 리스트 출력구문
function showMovieList(v){
	 var imsi="";
	 $.each(v,function(index,dom){ 	
	 	imsi="";
		});	
		$(".reviewList").html(temp);
	 }
	$(function() {
		//마이페이지로
		 
			//에매내역넣기
		$('input#btn').click(function(){
			temp=$("input#btn").val();
			console.log(temp);
		});
		$('button#insert_booking').click(function(){
			form.submit();
			
			});
		 function movieList(url,data,dataType){
		      $.ajax({
					  url:url,
		    		  type:'POST',
		    		  data:data,
		   			  dataType:dataType,				  
		   			  success:function(v){
		   				//함수명(v);
		   				//성공하면 호출될 함수부분
		   			//temp="ajax부분"
		   			  },
		   			  error:function(e){
		   				  alert('오류.');
	    			  }	    		  
		   			  });	
		      }
		 //수정 버튼 클릭
		 /*  $(document).on('click', '#modifyMovie', function(){
			 movieList('/movie/admin/UpdateMovie.do',[movieNo:${AllMovieList.movieCd},$("form#movieForm").serialize(),'json');	  
		   });  
		 //삭제 버튼 클릭
		  $(document).on('click', '#deleteMovie', function(){
			 movieList('/movie/admin/deleteMovie.do',$("form#movieForm").serialize(),'json');	  
		   }); */
		 //jquery구문 끝
		 });
	
	
			

</script>
</head>
<body>
<div id="wrapper">
<jsp:include page="../gnb.jsp" ></jsp:include>

<button id="selectMovie"><a href="/movie/SelectAllMovie.do">영화 테이블 가져오기</a></button>
<form id="movieForm"> 
 <table class="nostyle">

				<tr>
					<th id="movieForm_td">번호</th>
					<th id="movieForm_td">체크</th>
					<th id="movieForm_td">한글제목</th>
				    <th id="movieForm_td">영어제목</th>
				    <th id="movieForm_td">러닝타임</th>
				    <th id="movieForm_td">개봉일</th>
				    <th id="movieForm_td">마감일</th>
				    <th id="movieForm_td">내용</th>
				    <th id="movieForm_td">국가</th>
				    <th id="movieForm_td">장르</th>
				    <th id="movieForm_td">감독</th>
				    <th id="movieForm_td">배우</th>
				    <th id="movieForm_td">연령제한</th>
				    <th id="movieForm_td">제작사</th>
				    <th id="movieForm_td">수정<th>
				    <th id="movieForm_td">삭제<th>
				</tr>

				<c:forEach var="i" items="${AllMovieList }" varStatus="cnt">
				<tr>
					<td><c:out value="${cnt.count }"/></td>
					 <td><input type="radio" id="btn" VALUE="${i.movieCd}"></td>
					 <td>${i.movieCd}</td>
					<td>${i. movieNm}</td>
				    <td>${i. movieNmEn}</td>
				    <td>${i. showTm}</td>
				    <td>${i. openDt}</td>
				    <td>${i. endDt}</td>
				    <td>${i. contents_s}</td>
				     <td>${i. nations}</td>
				    <td>${i. genre}</td>
				    <td>${i. directors}</td>
				    <td>${i. actors}</td>
				    <td>${i. watchGradeNm}</td>
				    <td>${i. companys}</td>
					 
					
					 
					 	
					 <td><input type="checkbox" id="movieForm_td" VALUE="${i.movieCd}"></td>
				    <td id="movieForm_td"><input type="text" name="movieNm" value="${i. movieNm}" ></td>
				    <td id="movieForm_td"><input type="text" name="movieNmEn" value="${i. movieNmEn}" ></td>
				    <td id="movieForm_td"><input type="text" name="showTm" value="${i. showTm}"></td>
				    <td id="movieForm_td"><input type="date" name="openDt" value="${i. openDt}"></td>
				    <td id="movieForm_td"><input type="date" name="endDt" value="${i. endDt}"></td>
				    <td id="movieForm_td"><input type="text" name="contents" value="${i. contents}"></td>
				    <td id="movieForm_td"><input type="text" name="nations" value="${i. nations}"></td>
				    <td id="movieForm_td"><input type="text" name="genre" value="${i. genre}"></td>
				    <td id="movieForm_td"><input type="text" name="directors" value="${i. directors}"></td>
				    <td id="movieForm_td"><input type="text" name="actors" value="${i. actors}"></td>
				    <td id="movieForm_td"><input type="text" name="watchGradeNm" value="${i. watchGradeNm}"></td>
				    <td id="movieForm_td"><input type="text" name="companys" value="${i. companys}"></td>
				    <td id="movieForm_td"><input type="button" id="modifyMovie" value="수정"></td>
				    <td id="movieForm_td"><input type="button"id="deleteMovie"  value="삭제"></td> 
				  
				</tr>
				</form>
			</c:forEach>
			</table> 
			
			<div></div>
		
<!-- <form action="/movie/insertMovie.do"method="GET" id="movie_form">
<span><input type="hidden" placeholder="영화번호를 입력하시오" name="movie_no"></span>
<span><input type="text" placeholder="제목을 입력하시오" name="movie_no"></span>
 <div><input type="text" placeholder="제목을 입력하시오" name="moviecd"></div>
<div><input type="text" placeholder="원어제목를 고르세요" name="movieNm"></div>
<div><input type="text" placeholder="영어제목을 입력하시오" name="movieNmEn"></div>
<div><input type="text" placeholder="러닝타임을 입력하시오" name="showTm"></div>
<div><input type="date" placeholder="개봉일을 입력하시오" name="openDt"></div>
<div><input type="date" placeholder="마감일을 입력하시오" name="endDt"></div>

<div><input type="text" placeholder="줄거리을 입력하시오" name="contents"></div>
<div><input type="text" placeholder="개봉상태을 입력하시오" name="prdtStatNm"></div>
<div><input type="text" placeholder="국가을 입력하시오" name="nations"></div>
<div><input type="text" placeholder="장르를 입력하시오" name="genre"></div>
<div><input type="text" placeholder="감독명을 입력하시오" name="directors"></div>

<div><input type="text" placeholder="배우을 입력하시오" name="actors"></div>
<div><input type="text" placeholder="제한연령을 입력하시오" name="watchGradeNm"></div>
<div><input type="text" placeholder="회사를 입력하시오" name="companys"></div>

<button id="insert_movie">영화 넣기</button> 
</form>-->
</div>
<div> </div>
<!--  form1 끝 -->
</body>
</html>