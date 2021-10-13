<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <link rel="stylesheet" href="/movie/view/css/myPagecommon.css">
      <link rel="stylesheet" href="/movie/view/css/myPage2.css">
      <link rel="stylesheet" href="/movie/view/css/myPagefile.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function(){
     
  });
</script>
</head>

<body>
  <jsp:include page="gnb.jsp"></jsp:include>
    <div id="contents_wrap">
        <div id="myPage_btn">
            <div id="myPage_div_img"><img src="/movie/view/img/개인정보변경.png" class="myPage_img actvie" onmouseover="
                    this.style.cursor='pointer'"></div>
            <div id="myPage_div_img_active"><img src="/movie/view/img/문의하기.png" class="myPage_img" onmouseover="
                    this.style.cursor='pointer'"></div>
            <div id="myPage_div_img"><img src="/movie/view/img/예매확인.png" class="myPage_img" onmouseover="
                    this.style.cursor='pointer'"></div>
        </div>
        <!--버튼끝-->
        <!--폼 시작-->
        <form action="" method="POST" id="QNAFROM">
            <div id="QNA"><input type="text" class="QNA_title" placeholder="제목을 입력하시오"></div>
            <div id="QNA"><textarea class="QNA_contents" placeholder="내용을 입력하시오"></textarea></div>
            <!-- <div id="QNA"><input type="file" class="QNA_file"></div>     -->

           
            <!--파일추가-->
            <div id="QNA">
                <div class="filebox">
	                 <input class="upload-name" value="파일선택" disabled="disabled">
	                 <label for="ex_filename">업로드</label> 
	                 <input type="file" id="ex_filename" class="upload-hidden">
                </div>
            </div>
            <!--파일추가-->

            <div id="btn_tap">
                <input type="submit" value="확인" class="form_submit">
                <input type="button" value="취소" class="form_cancel">
            </div>

        </form>


        <!--문의내역 시작-->
        <div id="result">
            <div class="question">문의내역</div>
            <div id="QNA_result">
                <div class="result_title">
                    <img src="/movie/view/img/미답변.png" alt="미답변" class="result_img">영끌페시기 제목
                </div>
                <div class="result_contents">
                    <img src="/movie/view/img/답변완료.png" alt="미답변" class="result_img_active">영끌 포인트 제도은 없나요
                </div>


                <div class="result_answer">
                    <img src="/movie/view/img/답변화살표.png" alt="답변화살표" class="result_img2">답변 뭐시기뭐시기답변 뭐시기뭐시기답변 뭐시기뭐시기답변뭐시기뭐시기답변
                    뭐시기뭐시기답변 뭐시기뭐시기답변뭐시기뭐시기답변 뭐시기뭐시기답변
                    뭐시기뭐시기답변뭐시기뭐시기답변 뭐시기변 뭐시기뭐시기답변ㄴ
                </div>

            </div>
 </div>
            </div>
            <!--문의내역 끝-->
            <jsp:include page="footer.jsp"></jsp:include>
           
            </body>

</html>