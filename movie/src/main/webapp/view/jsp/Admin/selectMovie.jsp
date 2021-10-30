<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function(){
	
		
	});	
</script>
</head>
<body>${moviesList }

<table>
<div>영화리스트 가져오기</div>
<a href="/movie/selectMovielist.do">가져오기</a>
<%-- <c:forEach var="i" items="${moviesList }">

</c:forEach> --%>
</table>
</body>
</html>