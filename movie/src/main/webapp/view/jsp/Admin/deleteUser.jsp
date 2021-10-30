<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
	  var pw=1234;/* ${pw} */
	//var path="";
	var dropokay=confirm("탈퇴하시겠습니까?");
	if(dropokay){  // true이면
		console.log(dropokay);
		var pwcheck=prompt("비밀번호를 입력하시오");
		if(pw==pwcheck){
			document.location.href="/movie/view/jsp/deleteSuccess.jsp";
		}else{
			alert('다시입력하세요');
		}
	}else{	//거절하면
		alert('다시 돌아갑니다');
		document.location.href="/movie/view/jsp/main.jsp";
	}
    		    	    	
  });
</script>
</head>
<body>
<%-- <h1>탈퇴하시겠씁니까</h1>
<p>
그러면 성종이가 gnb에서 id랑 pw계속 들고있으니까 <br/>
나는 그냥 id랑 pw 값을 ajax로 검증만 하면된다라고하넹<br/>


 1. 탈퇴하겟습니다 라는 val을 똑같이 입력받으면<br/>
 2. ajax로 2번째 passchec가 드ㄹ나고<br/>
 3. passcheck의 밸류가 가져온 passcheck가 같으면<br/>
 4.성공페이지로 넘어가라</p><br/>
<input type="text" id="dropout" name="dropout" placeholder="탈퇴하겠습니다" value="${check}">
<input type="text" id="passcheck" name="pwCheck" placeholder="비밀번호입력해주세요" value="${pw}">
<!-- 텍스트에 탈퇴하겠습니다 입력시 다음페이지로 이동-
입력 오류시 원페이지 그대로-->
<input type="button" id="submit">
</form> --%>
</body>
</html>