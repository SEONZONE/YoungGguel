<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
   <link rel='stylesheet' href='/movie/view/css/gnb.css'> <!--gnb CSS-->
    <link rel='stylesheet' href='/movie/view/css/loginpopup.css'> <!--�α��� ���̾��˾� CSS-->
    <link rel='stylesheet' href='/movie/view/css/joinpopup.css'> <!--�α��� ���̾��˾� CSS-->
  <!--   <script src="../js/main.js"></script> ���� ��ũ��Ʈ -->
    <script src="../js/loginpopup.js"></script> <!--�α��� ���̾��˾� ��ũ��Ʈ-->
    <script src="../js/join.js"></script> <!--�α��� ���̾��˾� ��ũ��Ʈ-->
<title>Insert title here</title>
</head>
<body>
  <div class="gnb">
            <div class="wrapping">
                <div class="gnblogo" id="gnblogoid">
                    <a href="/">
                        <img src="/movie/view/img/logo.png">
                    </a>
                    <ul>
                        <li><img src="/movie/view/img/loginbutton.png" onclick="loginpopup()"></li>
                        <li><a href="../html/join.html"><img src="/movie/view/img/joinbutton.png"></a></li>
                    </ul>
                </div>
                <div class="menu">
                    <ul>
                        <li>��ȭ</li>
                        <li>�󿵽ð�ǥ</li>
                        <li onclick="wow()" >
                            <img src="/movie/view/img/gnbbutton.png"
                            onmouseover="this.src='/movie/view/img/gnbbutton_hover.png'"
                            onmouseout="this.src='/movie/view/img/gnbbutton.png'">
                        </li>
                        <li>�����</li>
                        <li>������</li>
                    </ul>
                </div>
            </div>
        </div>
</body>
</html>