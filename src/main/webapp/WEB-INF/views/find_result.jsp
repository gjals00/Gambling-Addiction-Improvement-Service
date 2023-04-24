<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 | 도박 중독 개선 서비스</title>
    <!-- <link rel="stylesheet" href="/css/login.css" type="text/css"/> -->
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/find_id_result.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
        </style>
        
        <script type="text/javascript">
        	function login() 
        	{
        		location.href = '/main_login';
			}
        </script>
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
    <h1>로그인</h1>
    </center>
        <form id="signup">
                <!-- <img id="login_img" src="images/main_logo.png" alt="메인 로그인 이미지"> -->
              <ul>
                <div id="id_pw">
                 
				<c:if test="${find_id != null}">
                <p>찾기 결과 아이디는 ${find_id}입니다.</p>
                </c:if>
                
                <c:if test="${find_pw != null}">
                <p>찾기 결과 비밀번호는 ${find_pw}입니다.</p>
                </c:if>
                </div>
              </ul>
              <br>
              <br>
              <br>
              <br>
              <input type="button" onclick="login()"  value="로그인" style="width: 300px; height: 70px"> 
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