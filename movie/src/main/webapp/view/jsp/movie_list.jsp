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
    <title>����</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--���� CSS-->
    <link rel="stylesheet" href="/movie/view/css/movie_list.css" />
  </head>
  <body>
    <!--gnb ����-->
   <jsp:include page="gnb.jsp" ></jsp:include>
     <!--gnb ����-->
    <div class="content">
      <div class="select">
        <div class="list_button" style="height: 60px; margin: auto">
          <button>�ڽ����ǽ�</button>
          <button>�������</button>
          <button>�󿵿�����</button>
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
                  <span class="title">�ظ����Ϳ� ����� ��</span>
                  <span class="runningtime">80��</span>
                  <span class="rate">������ 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">���� 2006.06.06</p>
                  <p class="genre">��Ÿ��</p>
                  <p class="cont">
                    �ظ� ����(�ٴϿ� ����Ŭ���� ��)�� �������� ���� ����(��í��
                    �׸��ǽ� ��)�� �ô��� �̸� �����Ͼ� (�ǿ��� �� ��), ���
                    ���� �������� ���� ����(�ظ� �ḵ ��) �ؿ��� ���� ������
                    �ߵ�� ��� �� ���忡�� ��Ȱ�Ѵ�. �̸�� �ı��� ����
                    �ظ����� ���Ű� �����ϱ�� ��������. �̸� �����Ͼƿ���
                    �ظ��� �̻���(?) ��� �κο� ���� ����� ���ø��� �����
                    �ް��� ���� �����. 11�� ������ ��ĥ ������ �ٰ�������
                    �ѹ��� ������Ƽ�� ġ���ų� ����� ��...
                  </p>
                </div>
                <div class="btn-area">
                  <button class="reserve">�����ϱ�</button>
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
                  <span class="title">�ظ����Ϳ� ����� ��</span>
                  <span class="runningtime">80��</span>
                  <span class="rate">������ 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">���� 2006.06.06</p>
                  <p class="genre">��Ÿ��</p>
                  <p class="cont">
                    ��¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼����
                    �׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ�
                    ��¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ�
                  </p>
                </div>
                <div class="btn-area">
                  <button class="reserve">�����ϱ�</button>
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
                  <span class="title">�ظ����Ϳ� ����� ��</span>
                  <span class="runningtime">80��</span>
                  <span class="rate">������ 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">���� 2006.06.06</p>
                  <p class="genre">��Ÿ��</p>
                  <p class="cont">
                    ��¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼����
                    �׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ�
                    ��¼�����׾�����¼���ƾƾ��̤÷����Ĥ���¼�����׾�����¼���ƾƾ��̤÷����Ĥ�
                  </p>
                </div>
                <div class="btn-area">
                  <button class="reserve">�����ϱ�</button>
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
                  <span class="title">�ظ����Ϳ� ����� ��</span>
                  <span class="runningtime">80��</span>
                  <span class="rate">������ 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">���� 2006.06.06</p>
                  <p class="genre">��Ÿ��</p>
                  <p class="cont">��¼�����׾�����¼���ƾƾ��̤÷����Ĥ�</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">�����ϱ�</button>
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
                  <span class="title">�ظ����Ϳ� ����� ��</span>
                  <span class="runningtime">80��</span>
                  <span class="rate">������ 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">���� 2006.06.06</p>
                  <p class="genre">��Ÿ��</p>
                  <p class="cont">��¼�����׾�����¼���ƾƾ��̤÷����Ĥ�</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">�����ϱ�</button>
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
                  <span class="title">�ظ����Ϳ� ����� ��</span>
                  <span class="runningtime">80��</span>
                  <span class="rate">������ 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">���� 2006.06.06</p>
                  <p class="genre">��Ÿ��</p>
                  <p class="cont">��¼�����׾�����¼���ƾƾ��̤÷����Ĥ�</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">�����ϱ�</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
            <li>
              <div class="movie-list-info" id="fleft">
                <img src="/movie/view/img/��������.jpg" />
              </div>
              <div id="fleft">
                <div class="tit-area">
                  <span class="title">��������</span>
                  <span class="runningtime">80��</span>
                  <span class="rate">������ 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">���� 2006.06.06</p>
                  <p class="genre">��Ÿ��</p>
                  <p class="cont">��¼�����׾�����¼���ƾƾ��̤÷����Ĥ�</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">�����ϱ�</button>
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
                  <span class="runningtime">80��</span>
                  <span class="rate">������ 60%</span>
                </div>
                <div class="detail-area">
                  <p class="release">���� 2006.06.06</p>
                  <p class="genre">��Ÿ��</p>
                  <p class="cont">��¼�����׾�����¼���ƾƾ��̤÷����Ĥ�</p>
                </div>
                <div class="btn-area">
                  <button class="reserve">�����ϱ�</button>
                  <img src="/movie/view/img/like.png" />
                </div>
              </div>
            </li>
          </ol>
        </div>
      </div>
    </div>

    <!--footer ��-->
    <jsp:include page="footer.jsp" ></jsp:include>
    <!--footer ��-->
  </body>
</html>
