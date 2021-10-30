<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/movie/view/css/answerAsk.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {

	});i
</script>
</head>
<body>
	<h1 style="text-align: center">문의하기 답변창</h1>
	<c:forEach var="i" items="${AskListItem }">
		<h3 style="text-align: center">"${i.ask_title }"의 답변 달기</h3>
		<h3 style="text-align: center">내용 : "${i.ask_contents }"</h3>
	</c:forEach>
	<!--폼 시작-->
	<form action="/movie/insertAskAnswer.do?job=answer&user_id=Admin"
		method="POST" id="QNAFROM" enctype="multipart/form-data">
		<div id="QNA">
			<input type="text" class="QNA_title" placeholder="제목을 입력하시오"
				name="ask_title">
		</div>
		<div id="QNA">
			<textarea class="QNA_contents" placeholder="내용을 입력하시오"
				name="ask_contents"></textarea>
		</div>

		<!--파일추가-->
		<input type="hidden" name="answer_ck" value="답변완료">
		<div id="QNA">
			<div>
				<input type="file" id="file" name="file">
			</div>
		</div>
		<c:forEach var="i" items="${AskListItem }">
			<input type="hidden" name="user_id" value="${i.user_id}">
			<input type="hidden" name="pnum" value="${i.ask_no }">
			<input type="hidden" name="ref" value="${i.ref }">
		</c:forEach>
		<div id="btn_tap">

			<input type="submit" value="확인" class="form_submit"> <input
				type="button" value="취소" class="form_cancel">
		</div>

	</form>
</body>
</html>