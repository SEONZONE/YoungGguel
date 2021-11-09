<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지(영화 시간표)</title>
<link rel="stylesheet" href="/movie/view/css/adminPage.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		//마이페이지로
		$('button#to_myPage').click(function(){
			document.location.href='/movie/insert_movie.do';
			
			}),
			
	});

</script>
</head>
<body>

<jsp:include page="../gnb.jsp" ></jsp:include>
<div id="wrapper">
<button id="selectUser"><a href="/movie/selectTimeTable.do">영화 시간표 테이블 가져오기</a></button>


<table class="nostyle">

				<tr>
					<th>번호</th>
					<th>체크</th>
				    <th>영화 번호</th>
				    <th>날짜</th>
				    <th>시작 시간</th>
				    <th>끝 시간</th>
				    <th>좌석 갯수</th>
				    
				    <th>수정</th>
				    <th>삭제<th>
				</tr>
				<c:forEach var="i" items="${AllUserList}" varStatus="cnt">
				<tr>
					<td><c:out value="${cnt.count }"/></td>
					<td><input type="radio" VALUE="${i.USERID }"></td>
				    <td>${i. USERID}</td>
				    <td>${i. USERPW}</td>
				    <td>${i. USERNAME}</td>
				    <td>${i. USERTEL}</td>
				    <td>${i. USERBIRTH}</td>
				    <td>${i. USEREMAIL}</td>
				    <td>${i. USERGENDER}</td>
				    <td><input type="button" value="수정"></td>
				    <td><input type="button" value="삭제"></td>
				  
				</tr>
			</c:forEach>
			</table>
			</div>
			<jsp:include page="../footer.jsp" ></jsp:include>
</body>
</html>