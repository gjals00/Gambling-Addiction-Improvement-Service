<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자가진단 테스트 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selftest.css">
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
      
      
      function result()
   	  {
    	  var selftest = document.selftest;
   		 // window.open("","팝업","width=800, height=700, top=10, left=10");
   		 selftest.method = "post";
   		 selftest.action = "/selfTest.do";
   		 // selftest.target="팝업";
   		 selftest.submit(); //자바스크립트에서 서블릿으로 전송
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

<br>
<div id="box">
<div id="top_text">
    <img id="cpgi" src="${pageContext.request.contextPath}/resources/images/cpgi.png" width="150px" height="140px">
<h1>도박 중독 자가 점검(CPGI)</h1><br>
<p class="content__subject mb20">지난 1년을 기준으로 해당하는 번호에 표시하세요.</p>
</div>
<br>
<form name = "selftest" id="selftest">
<ul class="checkup-list">
<li class="checkup-list__title">
	<h2>문항</h2>
</li>
<li>
	<p>Q1. 귀하는 도박에서 잃어도 크게 상관없는 금액 이상으로 도박을 한 적이 있습니까?</p>
	<div>
		<input type="radio" name="Q1" value=0 id="radioGroup1_0" class="cpgi" title="1번 문항" checked="checked">
		<label for="radioGroup1_0">없음 (0점)</label>
		<input type="radio" name="Q1" value=1 id="radioGroup1_1" class="cpgi" title="1번 문항">
		<label for="radioGroup1_1">가끔 (1점)</label>
		<input type="radio" name="Q1" value=2 id="radioGroup1_2" class="cpgi" title="1번 문항">
		<label for="radioGroup1_2">때때로 (2점)</label>
		<input type="radio" name="Q1" value=3 id="radioGroup1_3" class="cpgi" title="1번 문항">
		<label for="radioGroup1_3">거의항상 (3점)</label>
	</div>
</li>
<li>
	<p>Q2. 귀하는 도박에서 이전과 같은 흥분감을 느끼기 위해 더 많은 돈을 걸어야 했던 적이 있습니까?</p>
	<div>
		<input type="radio" name="Q2" value=0 id="radioGroup2_0" class="cpgi" title="2번 문항" checked="checked">
		<label for="radioGroup2_0">없음 (0점)</label>
		<input type="radio" name="Q2" value=1 id="radioGroup2_1" class="cpgi" title="2번 문항">
		<label for="radioGroup2_1">가끔 (1점)</label>
		<input type="radio" name="Q2" value=2 id="radioGroup2_2" class="cpgi" title="2번 문항">
		<label for="radioGroup2_2">때때로 (2점)</label>
		<input type="radio" name="Q2" value=3 id="radioGroup2_3" class="cpgi" title="2번 문항">
		<label for="radioGroup2_3">거의항상 (3점)</label>
	</div>
</li>
<li>
	<p>Q3. 귀하는 도박으로 잃은 돈을 만회하기 위해 다른 날 다시 도박을 하신 적이 있습니까?</p>
	<div>
		<input type="radio" name="Q3" value=0 id="radioGroup3_0" class="cpgi" title="3번 문항" checked="checked">
		<label for="radioGroup3_0">없음 (0점)</label>
		<input type="radio" name="Q3" value=1 id="radioGroup3_1" class="cpgi" title="3번 문항">
		<label for="radioGroup3_1">가끔 (1점)</label>
		<input type="radio" name="Q3" value=2 id="radioGroup3_2" class="cpgi" title="3번 문항">
		<label for="radioGroup3_2">때때로 (2점)</label>
		<input type="radio" name="Q3" value=3 id="radioGroup3_3" class="cpgi" title="3번 문항">
		<label for="radioGroup3_3">거의항상 (3점)</label>
	</div>
</li>
<li>
	<p>Q4. 귀하는 도박자금을 마련하기 위해 돈을 빌리거나 무엇인가를 판 적이 있습니까?</p>
	<div>
		<input type="radio" name="Q4" value=0 id="radioGroup4_0" class="cpgi" title="4번 문항" checked="checked">
		<label for="radioGroup4_0">없음 (0점)</label>
		<input type="radio" name="Q4" value=1 id="radioGroup4_1" class="cpgi" title="4번 문항">
		<label for="radioGroup4_1">가끔 (1점)</label>
		<input type="radio" name="Q4" value=2 id="radioGroup4_2" class="cpgi" title="4번 문항">
		<label for="radioGroup4_2">때때로 (2점)</label>
		<input type="radio" name="Q4" value=3 id="radioGroup4_3" class="cpgi" title="4번 문항">
		<label for="radioGroup4_3">거의항상 (3점)</label>
	</div>
</li>
<li>
	<p>Q5. 귀하는 자신의 도박행위가 문제가 될 만한 수준이라고 느낀 적이 있습니까? </p>
	<div>
		<input type="radio" name="Q5" value=0 id="radioGroup5_0" class="cpgi" title="5번 문항" checked="checked">
		<label for="radioGroup5_0">없음 (0점)</label>
		<input type="radio" name="Q5" value=1 id="radioGroup5_1" class="cpgi" title="5번 문항">
		<label for="radioGroup5_1">가끔 (1점)</label>
		<input type="radio" name="Q5" value=2 id="radioGroup5_2" class="cpgi" title="5번 문항">
		<label for="radioGroup5_2">때때로 (2점)</label>
		<input type="radio" name="Q5" value=3 id="radioGroup5_3" class="cpgi" title="5번 문항">
		<label for="radioGroup5_3">거의항상 (3점)</label>
	</div>
</li>
<li>
	<p>Q6. 귀하는 도박으로 인해 스트레스나 불안 등을 포함한 어떤 건강상의 문제를 겪은 적이 있습니까? </p>
	<div>
		<input type="radio" name="Q6" value=0 id="radioGroup6_0" class="cpgi" title="6번 문항" checked="checked">
		<label for="radioGroup6_0">없음 (0점)</label>
		<input type="radio" name="Q6" value=1 id="radioGroup6_1" class="cpgi" title="6번 문항">
		<label for="radioGroup6_1">가끔 (1점)</label>
		<input type="radio" name="Q6" value=2 id="radioGroup6_2" class="cpgi" title="6번 문항">
		<label for="radioGroup6_2">때때로 (2점)</label>
		<input type="radio" name="Q6" value=3 id="radioGroup6_3" class="cpgi" title="6번 문항">
		<label for="radioGroup6_3">거의항상 (3점)</label>
	</div>
</li>
<li>
	<p>Q7. 귀하는 다른 사람들로부터 도박행위를 비난받거나 도박문제가 있다는 얘기를 들은 적이 있습니까? </p>
	<div>
		<input type="radio" name="Q7" value=0 id="radioGroup7_0" class="cpgi" title="7번 문항" checked="checked">
		<label for="radioGroup7_0">없음 (0점)</label>
		<input type="radio" name="Q7" value=1 id="radioGroup7_1" class="cpgi" title="7번 문항">
		<label for="radioGroup7_1">가끔 (1점)</label>
		<input type="radio" name="Q7" value=2 id="radioGroup7_2" class="cpgi" title="7번 문항">
		<label for="radioGroup7_2">때때로 (2점)</label>
		<input type="radio" name="Q7" value=3 id="radioGroup7_3" class="cpgi" title="7번 문항">
		<label for="radioGroup7_3">거의항상 (3점)</label>
	</div>
</li>
<li>
	<p>Q8. 귀하의 도박행위로 인해 본인이나 가정에 재정적인 문제가 발생한 적이 있습니까?</p>
	<div>
		<input type="radio" name="Q8" value=0 id="radioGroup8_0" class="cpgi" title="8번 문항" checked="checked">
		<label for="radioGroup8_0">없음 (0점)</label>
		<input type="radio" name="Q8" value=1 id="radioGroup8_1" class="cpgi" title="8번 문항">
		<label for="radioGroup8_1">가끔 (1점)</label>
		<input type="radio" name="Q8" value=2 id="radioGroup8_2" class="cpgi" title="8번 문항">
		<label for="radioGroup8_2">때때로 (2점)</label>
		<input type="radio" name="Q8" value=3 id="radioGroup8_3" class="cpgi" title="8번 문항">
		<label for="radioGroup8_3">거의항상 (3점)</label>
	</div>
</li>
<li>
	<p>Q9. 귀하는 자신의 도박하는 방식이나 도박을 해서 발생한 일에 대해 죄책감을 느낀 적이 있습니까?</p>
	<div>
		<input type="radio" name="Q9" value=0 id="radioGroup9_0" class="cpgi" title="9번 문항" checked="checked">
		<label for="radioGroup9_0">없음 (0점)</label>
		<input type="radio" name="Q9" value=1 id="radioGroup9_1" class="cpgi" title="9번 문항">
		<label for="radioGroup9_1">가끔 (1점)</label>
		<input type="radio" name="Q9" value=2 id="radioGroup9_2" class="cpgi" title="9번 문항">
		<label for="radioGroup9_2">때때로 (2점)</label>
		<input type="radio" name="Q9" value=3 id="radioGroup9_3" class="cpgi" title="9번 문항">
		<label for="radioGroup9_3">거의항상 (3점)</label>
	</div>
</li>
</ul>
		<input type="button" onclick="result()" value="결과 확인">
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
 </body>
</html>