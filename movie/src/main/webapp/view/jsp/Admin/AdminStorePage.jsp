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
	
	$(function() {
		$('td#ckno').click(function(){
		var value=$("td#ckno").val();
		console.log(value);
		
		$(document).on('click', '#updateReview', function(){	
			   var reviewNo = this.name;
			   var updateText = $('input[id="'+reviewNo+'"]');
			   
			   updateText.attr("disabled", false); //input의 disabled 기능 해제
			   updateText.focus();
			   
			   movieReview('/movie/reviewUpdate.do',$("form#updateForm").serialize(),'json');
		   });
		
		$('button#insert_booking').click(function(){
			//document.location.href='/movie/insertBooking.do';
			form.submit();
			
			});
		/*  뮤비의 리뷰 리스트 */
		  function movieReview(url,data,dataType){
		      $.ajax({
					  url:url,
		    		  type:'POST',
		    		  data:data,
		   			  dataType:dataType,				  
		   			  success:function(v){
		   				//ajax돌리면서 보여줄 함수작성
		   			  },
		   			  error:function(e){
		   				  alert('관람평은 한 번만 등록 가능합니다.');
	    			  }	    		  
		   			  });	
		      }
	});

</script>
</head>
<body>

<jsp:include page="../gnb.jsp" ></jsp:include>

<div>영화정보 변경</div>
 <form action="/movie/updateMovie.do" method="post" id="userdelete_form">
 <input type="text" name="id" value="${id}">
 <input type="submit">제출
 </form>	

			
<button id="selectStore"><a href="/movie/SelectAllProduct.do">상품 테이블 가져오기</a></button>
 <table class="nostyle">

				<tr>
					<th>번호</th>
					<th>체크</th>
					<th>상품코드</th>
					<th>제품명</th>
					<th>제품 구성품</th>
				    <th>가격</th>
				    <th>카테고리</th>
				    <th>이미지</th>
				    <th>판매율</th>
				    <th>수정<th>
				    <th>삭제<th>
				</tr>

				<c:forEach var="i" items="${AllProductList }" varStatus="cnt">
				<form>
				<tr>
					<td><c:out value="${cnt.count }"/></td>
					<td id="ckno"><input type="checkbox" VALUE="${i.PNO}"></td>
				    <td>${i. PNO}</td>
				    <td>${i. PNAME}</td>
				    <td>${i. PCONTENTS}</td>
				    <td>${i. PPRICE}</td>
				    <td>${i. PCATEGORY}</td>
				    <td>${i. PIMG}</td>
				    <td>${i. PSALESRATE}</td>
				    
				    <td><input type="submit" value="수정"></td>
				    <td><input type="button" value="삭제"></td>
				  
				</tr>
				</form>
			</c:forEach>
			</table> 
			수정 이나 딜리트 버튼누르면 해당 정보 지우는거 로 하려면
			해당 라디오 버튼 눌럿을떄 정보 가져가야됨 그러려면
			어떤 식으로 해야되나 
			
<jsp:include page="../footer.jsp" ></jsp:include> 
</body>
</html>