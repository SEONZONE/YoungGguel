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
    <title>MyPage</title>

        <link rel="stylesheet" href="/movie/view/css/myPagecommon.css">
      <link rel="stylesheet" href="/movie/view/css/myPage1.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var dateFrom="";
var dateTo="";
function selectSection(url,data,dataType){
	   $.ajax({
	        url:url,
	        type:'POST',
	        data:data,
	        dataType:dataType,              
	        success:function(v){
	        	  alert('조회성공');
	        },
	        error:function(e){
	           alert('error'+e);
	        }
	     });

	};
  $(function(){
	  
	  $('img#checkReserveimg').click(function(){
		  document.location.href='/movie/view/jsp/myPage1.jsp';
	  });
	  $('img#questionimg').click(function(){
		  document.location.href='/movie/mypage2.do';
	  });
	  $('img#changeInfoimg').click(function(){
		  document.location.href='/movie/mypage3.do?id=asd';
	  });
	  /* $('img#find_img').click(function(){
		  document.location.href='/movie/loadReserveList.do';
	  }); */
	$('img#find_img').click(function() {
			var dateFrom = document.getElementById('from');			//시작일 
			var dateTo = document.getElementById('to');			//종료일 
			var today = new Date();			//오늘 날짜-100 
			dateFrom = new Date(dateFrom.value);
			var fromYear = dateFrom.getFullYear();
			var fromMonth = dateFrom.getMonth() + 1;
			var fromDay = dateFrom.getDate();
			
			//날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리 
			if (isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)) {
				fromYear = 0;
				fromMonth = 0;
				fromDay = 0;
			}
			dateFrom = fromYear + '/' + fromMonth + '/' + fromDay;
			dateTo = new Date(dateTo.value);
			var toYear = dateTo.getFullYear();
			var toMonth = dateTo.getMonth() + 1;
			var toDay = dateTo.getDate();

			//날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리 
			if (isNaN(toYear) || isNaN(toMonth) || isNaN(toDay)) {
				toYear = 0;
				toMonth = 0;
				toDay = 0;
			}
			dateTo = toYear + '/' + toMonth + '/' + toDay;

			//오늘날짜 날짜 형식으로 지정 
			var todayYear = today.getFullYear(); //2020 
			var todayMonth = today.getMonth() + 1; //06 
			var todayDay = today.getDate(); //11 
			today = todayYear + '/' + todayMonth + '/' + todayDay;
			// 2020/06/11 (형식 지정은 본인 자유) 
			//날짜 조회 시, 시작일이 오늘 날짜보다는 크고, 종료일이 시작일보다는 커야하기 때문에 조건을 걸어줌 
			if (dateFrom >= today&& dateTo >= dateFrom) {
				selectSection('/movie/myPage1Test.do',{from:dateFrom,to:dateTo},'json');
				//document.location.href='/movie/loadReserveList.do?from='${dateFrom}'&to='${dateTo}';
				//return true;
				/* if(dateFrom -dateTo>=1){
					alert('기간은 100일까지만 조회가가능합니다');
				} */
			} else {
				console.log(dateFrom+dateTo);
				alert("해당 기간의 조회가 불가능합니다.");
			}
		});//click() end

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
           <!--  <span id="search2"><input type="text" id="from"></span><span> ~ </span>
            <span id="search2"><input type="text" id="to"></span> -->
            <span id="search2"><input type="date" id="from" name="from"> ~ <input type="date" id="to" name="to"> </span>
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
            <!-- paging 부분 시작 --> 
			<div class="paging">
							<a href="/web/memberList.do?cmd=memberList&page=1"><img
								src="/movie/view/img/맨처음버튼.gif"
								alt="처음페이지" /></a>
							<c:choose>
								<c:when test="${pageBean.currentPage>1}">
									<a
										href="/web/memberList.do?cmd=memberList&page=${pageBean.currentPage-1}">Before</a>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${pageBean.currentBlock >1 }">
									<a
										href="/web/memberList.do?cmd=memberList&page=${pageBean.startPage-1 }">
										<img src="/movie/view/img/이전버튼.gif" alt="이전" /></a>
								</c:when>
								<c:otherwise>
									<a href="#"><img
										src="/movie/view/img/이전버튼.gif"	alt="이전" /></a>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${pageBean.startPage }"
								end="${pageBean.endPage}" step="1">
								<c:choose>
									<c:when test="${i eq pageBean.currentPage }">
										<a href="#"> <font size="4" color="red"> [${i}] </font>
										</a>
									</c:when>
									<c:otherwise>
										<a href="/web/memberList.do?cmd=memberList&page=${i}">
											[${i}] </a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pageBean.endPage<pageBean.totalPage }">
									<a
										href="/web/memberList.do?cmd=memberList&page=${pageBean.endPage+1}">
										<img src="/movie/view/img/다음버튼.gif"
										alt="다음" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="#"> <img
										src="/movie/view/img/다음버튼.gif" alt="다음" />
									</a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pageBean.currentPage<pageBean.totalPage}">
									<a
										href="/web/memberList.do?cmd=memberList&page=${pageBean.currentPage+1}">Next</a>
								</c:when>
							</c:choose>
							<a
								href="/web/memberList.do?cmd=memberList&page=${pageBean.totalPage}">
								<img src="/movie/view/img/마지막버튼.gif" alt="마지막페이지" />
							</a>
						</div>
						<!-- paging 부분 끝 --> 
       
        </div>
 <jsp:include page="footer.jsp" ></jsp:include>
</body>
</html>