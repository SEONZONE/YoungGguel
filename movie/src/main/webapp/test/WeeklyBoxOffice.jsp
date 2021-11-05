<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>	
</head>
<body>
	<h2>박스오피스</h2>

	<div id="result">
	</div>

	<script>
		$.ajax({
			method : "GET",
			url : "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=03778b8e03b2f65d0d2c724260f2df8c&targetDt=20210901",
			data : {
				itemPerPage : "10"
			}
		}).done(function(msg) {
			let resultt = "";
			for(let i=0; i<10; i++){
			    let short_url = msg.boxOfficeResult.dailyBoxOfficeList[i];

				resultt += "<b>"+i+"</b>"
				resultt += "<b>영화 코드 : "+short_url.movieCd+"</b><br>"
				resultt += "<b>영화 제목 : "+short_url.movieNm+"</b>"
				resultt += "<p>개봉일 : "+short_url.openDt+"</p>"
				resultt += "<p>일일 관객 수 : "+short_url.audiCnt+"</p><hr>"
				
			}
			$("#result").append(resultt);
		});
	</script>

</body>
</html>