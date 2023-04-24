<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도박 중독 치유/재활 참여 예측 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/predictive3.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
        </style>
<script type="text/javascript">
        	
     function logout_check() 
     {
    	 
    	 if(confirm("로그아웃 하시겠습니까?"))
    	 {
    		 alert("로그아웃 처리되었습니다.");
    		 location.href='/logout.do';
    	 }   	 
	  }
     function my_info() 
     {
    	 location.href='/userlist?user_id=${user_id}';
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
                <c:if test="${user_id == null}">
						<div id="login">
          				<a href="/main_login">
              			<img id="main_login" src="${pageContext.request.contextPath}/resources/images/main_login2.png" alt="메인 로그인">
          				</a>
      					</div>
					</c:if> 
					<c:if test="${user_id != null}">
						<div id="login_info">
            			<p>${user_id}님 환영합니다.</p>
        				</div>
        				<div id="login_service">
        				<a onclick="my_info()"><p>내정보</p></a>
            			
             			<a onclick="logout_check()"><p>로그아웃</p></a>
        				</div>
					</c:if>
            </nav>
        </header>
        <div id="box">
            <h1>도박 중독 치유/재활 참여 예측</h1>
        </div>
        <form id="signup" name="signup" method="post" action="/predictive3Result.do">
        <div id="mainMenu">
            <h3>
                	본인 또는 가족, 지인들의 치유 재활 참여 수요 증감을 예측 분석하는 서비스입니다. 
            </h3>
            <div id="form">
            <p>
                	조건을 선택해주세요.
            </p>
            <ul>
                <li>
                    <label class="sub-title">Q1. <span>대상</span></label>
                    <div class="info">
                        <label><input id="selfhealing" name="selfhealing" type="checkbox" value="s_3">본인의 도박 중독 치유/재활 상담 참여</label>
                        <label><input id="grouphealing" name="grouphealing" type="checkbox" value="s_5">가족 및 지인의 도박 중독 치유/재활 상담 참여</label>
                        <label><input id="selfcounseling" name="selfcounseling" type="checkbox" value="s_5">본인의 도박 중독 집단상담 프로그램 참여</label>
                        <label><input id="groupcounseling" name="groupcounseling" type="checkbox" value="s_5">가족 및 지인의 도박 중독 집단상담 프로그램 참여</label>
                    </div>
                </li>
                <li>
                    <label class="sub-title">Q2. <span>희망 예측연도</span></label>
                    <div>
                        <select id="year" name="year">
            				<option selected value="2024">2024</option> <!-- -> 기본 항목 -->
                			<option value="2025">2025</option>
                			<option value="2026">2026</option>
                			<option value="2027">2027</option>
                			<option value="2028">2028</option>
						</select>
                    </div>
                </li>
            </ul>
        </div>
        <div id="button">
            <a>
                <input type="submit" value="예측하기">
            </a>
            <a>
                <input type="button" onclick="location.href='main';" value="돌아가기">
            </a>
        </div>
        </div>
        </form>
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