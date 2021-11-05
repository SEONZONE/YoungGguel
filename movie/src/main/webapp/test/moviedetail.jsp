<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<div id="result2"></div>

	<script>
		let movie = $('#movieCd').val();
		console.log(movie);
		$.ajax({
			method : "GET",
			url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=581366190a6fcb8fa9a49aefcce52d69&movieCd=20210087",       
				
		}).done(function(msg) {
			let resultt = "";
			let short_url = msg.movieInfoResult.movieInfo;
				resultt += "<b>영화 제목 : "+short_url.movieNm+"</b>"
				resultt += "<p>영화명 영문: "+short_url.movieNmEn+"</p>"
				resultt += "<p>제작국가명: "+short_url.nationNm+"</p>"
				resultt += "<p>제작연도: "+short_url.prdtYear+"</p>"
				resultt += "<p>개봉일자: "+short_url.openDt+"</p>"
				resultt += "<p>상영시간 : "+short_url.showTm+"</p>"
				resultt += "<p>영화유형명 : "+short_url.typeNm+"</p>"
				resultt += "<p>장르명 : "+short_url.genreNm+"</p>"
				resultt += "<p>감독: "+short_url.directors+"</p>"			
				resultt += "<p>배우 : "+short_url.actors[0]['peopleNm']+"</p>"
			let acts = short_url.actors;
				 for(let i=0; i<acts.length; i++){
					 resultt += "<i>"+acts[i]['peopleNm']+"</i>";
				}  
				resultt += "<p>배역: "+short_url.cast+"</p>"
				resultt += "<p>상영형태: "+short_url.showTypes+"</p>"
				resultt += "<p>심의정보: "+short_url.audits[0]['watchGradeNm']+"</p>"
				resultt += "<p>스텝: "+short_url.staffs+"</p>"
				
			$("#result2").append(resultt);
		});
		/*
		아무튼, 저 Object가 나열된 출력문은 배열로 선언된 것이므로 배열을 풀어주어야한다.
'배우'라는 키값의 배열을 풀어보겠다.
actors 키의 배열(map형식)중에 나는 'peopleNm'라는 키의 값만 필요로 하고 있다.
해당 actors의 배열길이만큼 for문을 돌리고, acts의 i번째의 'peopleNm'을 위 보기와 같이 뽑았다.*/
	</script>
</body>
</html>