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
    <title>내정보 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/InfoChange.css">
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
     
     function infoEdit() 
     {
    	 location.href='/InfoChangeResult?user_id=${user_id}';
    	 
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
    <br>
    <br>
    <br>
    <div id="box">
    <center>
      <br>
    <h1 >내정보 조회</h1>
    </center>
    <form id="signup" method="post" action="/deleteCheck">
          <ul>
            <li>
              <label for="user_id">아이디</label><br>
              <input for="user_id" name="user_id" type="text" value="${memberDto.getUser_id()}" readonly>
            <div id="li2">
            <li>
              <label for="user_pw">비밀번호</label><br>
              <input for="user_pw" name="user_pw" type="text" value="${memberDto.getUser_pw()}" readonly>
            </li> 
            <li>
              <label for="user_name">이름</label><br>
              <input for="user_name" name="user_name" type="text" value="${memberDto.getUser_name()}" readonly>
            </li>
            <li>
              <label for="user_birthday">생년월일</label><br>
              <input for="user_birthday" name="user_birthday" type="text" value="${memberDto.getUser_birthday()}" readonly>
            </li>
            <li>
              <label for="user_gender">성별</label><br>
              <input for="user_gender" name="user_gender" id="남" type="text" value="${memberDto.getUser_gender()}" readonly>
              <br>
            </li>
            <li>
              <label for="user_email">이메일 주소</label><br>
              <input for="user_email" type="email" name="user_email" value="${memberDto.getUser_email()}" readonly>
            </li>
            <li>
              <label for="user_tel">휴대전화</label><br>
              <input for="user_tel" name="user_tel" type="tel" value="${memberDto.getUser_tel()}" readonly>
            </li>
            <li>
              <label for="user_tel">가입 날짜</label><br>
              <input for="user_tel" name="user_register" type="text" value="${memberDto.getUser_register()}" readonly>
            </li>
            <br>
            <br>
            <!-- <li><input type="checkbox" required> 개인정보 처리에 동의합니다.</li>   -->
     
            <br>
            <br>
            <div id="final1">
              <input id="final" type="button" onclick="infoEdit()" value="정보수정" style="width: 500px; height: 60px"></a>
          </div>
          <div id="final2">
          <input id="final_delete" type="submit" value="회원탈퇴" style="width: 500px; height: 60px">
          </div>
        </div>
          </ul>
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
  </div>
</body>
</html>