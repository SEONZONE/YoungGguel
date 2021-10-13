<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <link rel="stylesheet" href="/movie/view/css/myPagecommon.css">
      <link rel="stylesheet" href="/movie/view/css/myPage1.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     
  });
</script>
</head>

<body>
 <jsp:include page="gnb.jsp" ></jsp:include>
    <div id="contents_wrap">
        <div id="myPage_btn">
            <div id="myPage_div_img_active"><img src="/movie/view/img/개인정보변경.png" class="myPage_img" onmouseover="
                    this.style.cursor='pointer'"></div>
            <div id="myPage_div_img"><img src="/movie/view/img/문의하기.png" class="myPage_img" onmouseover="
                    this.style.cursor='pointer'"></div>
            <div id="myPage_div_img"><img src="/movie/view/img/예매확인.png" class="myPage_img" onmouseover="
                    this.style.cursor='pointer'"></div>
        </div>
            <!--버튼끝-->
        <div id="contents">
            <span class="search">구분</span>
            <span id="taptap">
            <span id="search2" ><input type="radio" >예매내역</span>
            <span id="search2"><input type="radio" >지난내역</span>&nbsp;
            <span id="search2"><input type="date" id="search_date"></span><span> ~ </span>
            <span id="search2"><input type="date" id="search_date"></span>
            <span id="search2"><img src="/movie/view/img/find.png" value="" id="find" onmouseover="
                this.style.cursor='pointer'"></span></span>
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
                    
                    <tbody>
                        <tr>
                        <td class="table_data">2021.09.23</td>
                        <td class="table_data">PWW5678922</td>
                        <td class="table_data">보이스</td>
                        <td class="table_data">2021.09.22/월계 CGV / 3관 / PM 09: 00 /성인 2명</td>
                        <td class="table_data">20,000원</td>
                        <td class="table_data">2021/09.22.AM12:00</td>
                    </tr>
                       <tr>
                        <td class="table_data">2021.09.23</td>
                        <td class="table_data">PWW5678922</td>
                        <td class="table_data">보이스</td>
                        <td class="table_data">2021.09.22/월계 CGV / 3관 / PM 09: 00 /성인 2명</td>
                        <td class="table_data">20,000원</td>
                        <td class="table_data">2021/09.22.AM12:00</td>
                    </tr>
                </tbody>
            </table>

        <!--테이블탭끝-->
        </div>
 <jsp:include page="footer.jsp" ></jsp:include>
</body>
</html>