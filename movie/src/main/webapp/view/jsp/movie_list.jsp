<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      http-equiv="X-UA-Compatible"
      content="width=device-width, initial-scale=1"
    />
    <title>영끌</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--메인 CSS-->
    <link rel="stylesheet" href="/movie/view/css/movie_list.css" />
  </head>
  <body>
    <!--gnb 시작-->
   <jsp:include page="gnb.jsp" ></jsp:include>
     <!--gnb 시작-->
    <div class="content">
      <div class="select">
        <div class="list_button" style="height: 60px; margin: auto">
          <button>박스오피스</button>
          <button>현재상영작</button>
          <button>상영예정작</button>
        </div>
        <div class="align-button">
          <img src="/movie/view/img/list.PNG"/>
        </div>
      </div>
      <div class="inner-wrap">
        <div class="movie-list">
          <ol class="list" id="movielist">
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/Harry_Potter1.jpg" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">해리포터와 비밀의 방</span>
                  <span class="runningtime">80분</span>
                  <span class="rate">예매율 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">개봉 2006.06.06</p>
                  <p class="genre">판타지</p>
                  <p class="cont">
                    해리 포터(다니엘 래드클리프 분)는 위압적인 버논 숙부(리챠드
                    그리피스 분)와 냉담한 이모 페투니아 (피오나 쇼 분), 욕심
                    많고 버릇없는 사촌 더즐리(해리 멜링 분) 밑에서 갖은 구박을
                    견디며 계단 밑 벽장에서 생활한다. 이모네 식구들 역시
                    해리와의 동거가 불편하기는 마찬가지. 이모 페투니아에겐
                    해리가 이상한(?) 언니 부부에 관한 기억을 떠올리게 만드는
                    달갑지 않은 존재다. 11살 생일이 며칠 앞으로 다가왔지만
                    한번도 생일파티를 치르거나 제대로 된...
                  </p>
                </div>
                <div class="btn-area">
                  <button class="reserve">예매하기</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/Harry_Potter2.jpg" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">해리포터와 비밀의 방</span>
                  <span class="runningtime">80분</span>
                  <span class="rate">예매율 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">개봉 2006.06.06</p>
                  <p class="genre">판타지</p>
                  <p class="cont">
                    어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오
                    잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ
                    어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ
                  </p>
                </div>
                <div class="btn-area">
                  <button class="reserve">예매하기</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/Harry_Potter3.jpg" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">해리포터와 비밀의 방</span>
                  <span class="runningtime">80분</span>
                  <span class="rate">예매율 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">개봉 2006.06.06</p>
                  <p class="genre">판타지</p>
                  <p class="cont">
                    어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오
                    잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ
                    어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ
                  </p>
                </div>
                <div class="btn-area">
                  <button class="reserve">예매하기</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/Harry_Potter4.jpg" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">해리포터와 비밀의 방</span>
                  <span class="runningtime">80분</span>
                  <span class="rate">예매율 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">개봉 2006.06.06</p>
                  <p class="genre">판타지</p>
                  <p class="cont">어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">예매하기</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/Harry_Potter5.jpg" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">해리포터와 비밀의 방</span>
                  <span class="runningtime">80분</span>
                  <span class="rate">예매율 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">개봉 2006.06.06</p>
                  <p class="genre">판타지</p>
                  <p class="cont">어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">예매하기</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/Harry_Potter6.jpg" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">해리포터와 비밀의 방</span>
                  <span class="runningtime">80분</span>
                  <span class="rate">예매율 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">개봉 2006.06.06</p>
                  <p class="genre">판타지</p>
                  <p class="cont">어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">예매하기</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/극한직업.jpg" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">극한직업</span>
                  <span class="runningtime">80분</span>
                  <span class="rate">예매율 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">개봉 2006.06.06</p>
                  <p class="genre">판타지</p>
                  <p class="cont">어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">예매하기</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/1917.png" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">1917</span>
                  <span class="runningtime">80분</span>
                  <span class="rate">예매율 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">개봉 2006.06.06</p>
                  <p class="genre">판타지</p>
                  <p class="cont">어쩌구오잉어잉저쩌구아아어이ㅓ랭더ㅔㅇ</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">예매하기</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
          </ol>
        </div>
      </div>
    </div>

    <!--footer 끝-->
    <jsp:include page="footer.jsp" ></jsp:include>
    <!--footer 끝-->
  </body>
</html>
