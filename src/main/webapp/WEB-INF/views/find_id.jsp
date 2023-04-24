<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/find_id.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
        </style>
</head>
<body>
    <div id="container">
    <header>
        <div id="logo">
            <a href="/main">
                <img src="${pageContext.request.contextPath}/resources/images/main_logo.png" alt="메인 로고">
            </a>
        </div>
        <nav>
            <ul id="topMenu">
                <li><a href="#">예측 분석 <span>▼</span></a>
                <ul>
                  <li><a href="/predictive1">도박 수요 증감 예측</a></li>
                  <li><a href="/predictive2">도박 범죄 유형별 증감 예측</a></li>
                  <li><a href="/predictive3">도박 중독 치유/재활 참여 예측</a></li>
                </ul>
            </li>
            <li><a href="#">커뮤니티<span>▼</span></a>
                <ul>
                    <li><a href="/freeBoard?pageNumber=1">자유 게시판</a></li>
                    <li><a href="/successBoard?pageNumber=1">성공사례 게시판</a></li>
                </ul>
            </li>
            <li><a href="/map">가까운 센터</a></li>
            <li><a href="/selfTest">자가진단 테스트</a></li>
            </ul>
            <div id="login">
                <a href="/main_login">
                    <img src="${pageContext.request.contextPath}/resources/images/main_login.png" alt="메인 로그인">
                </a>
            </div>
        </nav>
    </header>
    <br>
    <br>
    <br>

    <div id="box">
    <center>
    <br>
    <h1>아이디 찾기</h1>
    </center>
        <form id="signup" method="post" action="/findId.do">
                <!-- <img id="login_img" src="images/main_logo.png" alt="메인 로그인 이미지"> -->
              <ul>
                <div id="find">
                    <p>본인확인을 위한 정보를 입력해주세요.</p><br>
                </div>
                <div id="id_pw">
                <li>
                  <label for="user_name">이름</label><br>
                  <input id="user_name" name="user_name" type="text" required autofocus>
                </li>
                <li>
                  <label for="user_tel">휴대폰 번호</label><br>
                  <input id="user_tel" name="user_tel" type="text"  required>
                </li>
                <li>
                    <label for="user_email">이메일 주소</label><br>
                    <input id="user_email" name="user_email" type="text"  required>
                  </li>
                </div>
              </ul>
              <br>
              <br>
              <br>
              <br>
              <input type="submit" value="아이디 찾기" style="width: 300px; height: 70px"> 
              <div id="login_menu">
              <ul>
                <br>
                  <li><a href="/find_id">아이디 찾기</a></li>
                  <li><a href="/find_pw">비밀번호 찾기</a></li>
                  <li><a href="/membership">회원가입</a></li>
              </ul>
              </div>
          </form>
      </div>
      <footer>
        <div id="bottomMenu">
            <ul>
                <li><a href="#">© Gambling Addiction Improvement Service</a></li>
                <li><a href="#">개인정보 처리방침</a></li>
                <li><a href="#">이용 약관</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">데이터 출처</a></li>
            </ul>

        </div>
        <div id="company">
            <p>서울특별시 OO구 OO동 OO로 | 대표전화 : 02-000-1234</p>
        </div>
    </footer>
</div>
</body>
</html>