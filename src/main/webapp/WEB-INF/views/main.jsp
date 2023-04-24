<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Main.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap');
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
        
        <div id="mainMenu">
            <div id="slideShow">
                <h1>도박의 중독성과 수요의 연관성</h1>
                <h6>예측분석을 통해 도박의 심각성을 느껴보세요.</h6>
					<a href="/predictive1"><h2><a2 href="#">예측분석 바로가기</a2></h2></a>
            </div>
        </div>

        <div id="contents2">
            
                <div id="tabMenu2" style=" cursor: pointer;" onclick="location.href='/map';">
                <h4>가까운 중독상담센터 찾기</h4> </div>
                <div id="tabMenu3" style=" cursor: pointer;" onclick="location.href='/selfTest';">
                <h5>자가진단 테스트</h5> </div> 
                
                <div id="middleMenu3">
                    <input type="radio" id="tab1" name="tabs" checked>
                    <label for="tab1">자유 게시판</label>
                    <input type="radio" id="tab2" name="tabs" checked>
                    <label for="tab2">성공 사례 게시판</label>
                    
                    <div id="board1" class="tapContent" style=" cursor: pointer;" onclick="location.href='/freeBoard?pageNumber=1';">
                        <h3>자유 게시판</h3>
                        <ul>
                        <c:forEach var="list" items="${boardList}">
                            <li><span class="c2"><a href="/readBoard.do?write_number=${list.write_number}"><c:out value="${list.write_title}"/></a></span><span class="c1"><c:out value="${list.write_time}"/></span></li>                            
                    	</c:forEach>
                        </ul>
                    </div>
                    <div id="board2" class="tapContent" style="cursor: pointer;" onclick="location.href='/successBoard?pageNumber=1';">
                        <h3>성공 사례 게시판</h3>
                        <ul>
                        <c:forEach var="success_list" items="${success_boardList}">
                            <li><span class="c2"><a href="/success_readBoard.do?success_write_number=${success_list.success_write_number}"><c:out value="${success_list.write_title}"/></a></span><span class="c1"><c:out value="${success_list.write_time}"/></span></li>                            
                    	</c:forEach>
                        </ul>
                    </div>
            </div>
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
    </div>
</body>
</html>