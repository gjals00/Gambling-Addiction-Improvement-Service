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
    <title>회원탈퇴 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/deleteCheck.css">
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
    	
    	function lastCheck() 
    	{
    		var signup = document.signup;
    		var user_pw = signup.user_pw.value;
    		
    		if(confirm("탈퇴 하시겠습니까?"))
   	 		{
                if(user_pw == '')
                {
                	alert('비밀번호를 입력해주세요.');
                }	
                else
                {
                	signup.method = "post";
            		signup.action = "/userDelete.do";
            		signup.submit(); //자바스크립트에서 서블릿으로 전송)
                }
   	 		}
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
                    <li><a href="/MyProject/category/successBoard.jsp">성공사례 게시판</a></li>
                </ul>
            </li>
            <li><a href="/MyProject/category/map.jsp">가까운 센터</a></li>
            <li><a href="/MyProject/category/selfTest.jsp">자가진단 테스트</a></li>
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
    <h1>회원 탈퇴</h1>
    </center>
        <form name="signup" id="signup">
                <!-- <img id="login_img" src="images/main_logo.png" alt="메인 로그인 이미지"> -->
              <ul>
                <div id="id_pw">
                <li>
                  <label for="user_id">아이디</label><br>
                  <input id="user_id" name="user_id" type="text" value="${user_id}" readonly>
                </li>
                <li>
                  <label for="user_pw">비밀번호</label><br>
                  <input id="user_pw" name="user_pw" type="password" required>
                </li>
                </div>
              </ul>
              <br>
              <br>
              <br>
              <br>
              <div id="login_menu">
              <input type="button" value="탈퇴하기" onclick="lastCheck()" style="width: 300px; height: 70px"> 
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