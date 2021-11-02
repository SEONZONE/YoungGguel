<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/movie/view/css/myPagecommon.css">
 <link rel="stylesheet" href="/movie/view/css/myPage1.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
	  $('img#find_img').click(function(){
		  document.location.href='/movie/loadReserveList.do';
	  });
	  $('img#checkReserveimg').click(function(){
		  document.location.href='/movie/view/jsp/myPage1.jsp';
	  });
	  $('img#questionimg').click(function(){
		  document.location.href='/movie/mypage2.do';
	  });
	  $('img#changeInfoimg').click(function(){
			  document.location.href='/movie/mypage3.do?id=${id}';
	  	  });
	  $(document).ready(function(){
		  if(UUid!=null){
				return true;
			}else{	<!--저장된 아이디 값이 없거나 URL 통한 접근 시 애러페이지-->
				alert('로그인이 필요합니다');
				return document.location.href="/movie/view/jsp/ErrorPage.jsp";
				//modal('my_modal');
			}
		});
  });
</script>
</head>
<body>

 <jsp:include page="gnb.jsp" ></jsp:include>
    <div id="contents_wrap">
        <div id="myPage_btn">
            <div id="myPage_div_img_active"><img src="/movie/view/img/예매확인.png" class="myPage_img active" id="checkReserveimg" onmouseover="
                    this.style.cursor='pointer'" ></div>
            <div id="myPage_div_img"><img src="/movie/view/img/문의하기.png" class="myPage_img" id="questionimg" onmouseover="
                    this.style.cursor='pointer'"></div>
            <div id="myPage_div_img"><img src="/movie/view/img/개인정보변경.png" class="myPage_img" id="changeInfoimg" onmouseover="
                    this.style.cursor='pointer'"></div>
        </div>
            <!--버튼끝-->
        <div id="contents">
            <span class="search">구분</span>
            <span id="taptap">

            <span id="search2" ><input type="radio" name="searchtap" checked="checked" >전체 내역</span>
            <span id="search2"><input type="radio" name="searchtap">기간별 조회</span>&nbsp;
            <span id="search2"><input type="date" id="search_date" name="from"></span><span> ~ </span>
            <span id="search2"><input type="date" id="search_date" name="to"></span>
            <img src="/movie/view/img/find.png" id="find_img" onmouseover="this.style.cursor='pointer'"></span>
             
        </div>
        <!--구분탭끝-->
        <!--테이블탭시작-->
       
            <table id="table_wrap">      
                <thead id="table_top">
                    <tr>
                        <td class="table_header">예매날짜</td>
                        <td class="table_header">예매번호</td>
                        <td class="table_header">영화이름</td>
                        <td class="table_header">예매정보</td>
                        <td class="table_header">결제금액</td>
                        <td class="table_header">결제시간</td>
                    </tr>
                    </thead>

			<c:forEach var="i" items="${mlist}" varStatus="cnt">
				<tbody>
					<tr>
						<td class="table_data">${i.reserve_date }</td>
						<td class="table_data">${i.reserve_no }</td>
						<td class="table_data">${i.movie_title }</td>
						<td class="table_data">${i.reserve_info }</td>
						<td class="table_data">${i.pay_total }원</td>
						<td class="table_data">${i.pay_date }</td>
					</tr>
			</c:forEach>
			</tbody>
            </table>

        <!--테이블탭끝-->
        </div>
 <jsp:include page="footer.jsp" ></jsp:include>
</body>
</html>