<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성공사례 게시판 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main_success_board.css">
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
    <h1>성공사례 게시판</h1><br>
    <div id="pp">
    <p>여러분의 도박 중독 개선에 관한 경험을 들려주세요.</p></div>
    <table class="bbsList">
        <caption></caption>           
        <thead class="head">
            <tr>
                <!-- <th><a class="checkbox" href="" ></a></th>  -->
                <th>번호</th>
                <th>글 제목</th>   
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
                <!-- <th>최근발송일</th>
                <th>반송건 수</th> 
                <th>수정</th>  -->
            </tr>    
        </thead>
        <tbody class="body">
      		<c:forEach var="list2" items="${success_boardList}">
        		<tr>
        			<td><c:out value="${list2.success_write_number}"/></td>
        			<td><a href="/success_readBoard.do?success_write_number=${list2.success_write_number}"><c:out value="${list2.write_title}"/></a></td>
        			<td><c:out value="${list2.write_id}"/></td>
        			<td><c:out value="${list2.write_time}"/></td>
        			<td><c:out value="${list2.write_available}"/></td>
        		</tr>
       		 </c:forEach>
        </tbody>
         <tfoot class="foot">
            <tr>
                <td colspan="9">
                   <!--  <span class="arrow radius-right">≪</span>  -->
          
          <c:if test="${pageNumber != 1}">
		  		<span class="arrow radius-left"><a href="/successBoard?pageNumber=${pageNumber-1}"><b>이전</b></a></span>
		  </c:if>
          
          <c:if test="${pageNumber == 1}">
		  		<span class="arrow radius-left"><b>이전</b></span>
		  </c:if>       
                    <a href="/successBoard?pageNumber=1" class="num_box txt_point">1</a>
                    <a href="/successBoard?pageNumber=2" class="num_box ">2</a>
                    <a href="/successBoard?pageNumber=3" class="num_box ">3</a>
                    <a href="/successBoard?pageNumber=4" class="num_box ">4</a>
                    <a href="/successBoard?pageNumber=5" class="num_box ">5</a>
                    <a href="/successBoard?pageNumber=6" class="num_box ">6</a>
                    <a href="/successBoard?pageNumber=7" class="num_box ">7</a>
                    <a href="/successBoard?pageNumber=8" class="num_box ">8</a>
                    <a href="/successBoard?pageNumber=9" class="num_box ">9</a>
                    <a href="/successBoard?pageNumber=10" class="num_box ">10</a>

                    <span class="arrow radius-right"><a href="/successBoard?pageNumber=${pageNumber+1}"><b>다음</b></a></span>
                   <!--  <span class="arrow radius-left">≫</span>  -->
                </td>
            </tr>    
        </tfoot>
        </table>
        <c:if test="${user_id != null}">
						<div class="btn_wrap">
        				<a class="btn_org" href="/main_board_write">
        				<span class="txt_white">글쓰기</span></a>
    			</div>
					</c:if> 
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