<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
   
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성공사례 게시판 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/readBoard.css">
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
     
     function list2()
     {
    	 location.href='/successBoard?pageNumber=1';
     }
     
     function edit() 
     { 
    	 var signup = document.signup;
     
         signup.method = "post";
 		 signup.action = "/success_editBoard.do";
 		 signup.submit(); //자바스크립트에서 서블릿으로 전송
	 }
     
     function del() 
     { 
    	 var signup = document.signup;
     	 
    	 if(confirm('게시글을 삭제하시겠습니까?'))
         {
    		 if(${reply.size()} == 0)
    		 {
    			 alert('게시글 삭제가 완료되었습니다.');
        		 signup.method = "post";
         		 signup.action = "/success_deleteBoard.do";
         		 signup.submit(); //자바스크립트에서 서블릿으로 전송
    		 }
    		 else
    	     {
    			 alert('댓글이 달린 게시글은 삭제 할 수 없습니다.');
    	     }
    		
         }
	 }
   
     function commentSubmit()
     {
    	 var comment = document.comment;
    	 
    	 if(confirm('댓글을 작성하시겠습니까?'))
         {
    		 comment.method = "post";
  		 	 comment.action = "/success_writereply.do";
  		 	 comment.submit(); //자바스크립트에서 서블릿으로 전송
         } 	 	
	 }
     
     function delreply() 
     {
	 	if(confirm('댓글을 삭제하시겠습니까?'))
	 	{
	 		comment.method = "post";
 		 	comment.action = "/success_deletereply.do";
 		 	comment.submit(); //자바스크립트에서 서블릿으로 전송
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
        <h1>커뮤니티</h1><br>
        <div id="pp">
            <p>여러분의 도박 중독 개선에 관한 경험을 들려주세요.</p>
        </div>
        <form id="signup" name="signup">
        <ul>
        <div id="write">
            <li>
                <label for="wrtie_choice">게시판 - 성공사례 </label>
                <!--     <select id="wrtie_choice">
                        <option selected value="자유">자유</option>
                    </select>  -->
            </li>
            <li>
                <label for="success_write_number">글번호</label><br>
                <input id="success_write_number" name="success_write_number" type="text" value="${readBoard.getSuccess_write_number()}" readonly>
            </li>
            <li>
                <label for="write_id">작성자</label><br>
                <input id="write_id" name="write_id" type="text" value="${readBoard.getWrite_id()}" readonly>
            </li>
            <li>
                <label for="write_time">작성일</label><br>
                <input id="write_time" name="write_time" type="text" value="${readBoard.getWrite_time()}" readonly>
            </li>
            <li>
                <label for="write_title">제목</label><br>
                <input id="write_title" name="write_title" type="text" value="${readBoard.getWrite_title()}" readonly>
            </li>
            <li>
                <label for="write_text">내용</label><br>
                <textarea id="write_text" name="write_text" type="text" readonly>${readBoard.getWrite_text()}</textarea>
            </li>
        </div>
      </ul>
			<c:choose> 
				<c:when test="${user_id == null}">
					<div id="login_null">
            			<input type="button" onclick="history.go(-1)" value ="목록으로">
        			</div>
				</c:when> 
				<c:when test="${user_id.equals(readBoard.getWrite_id())}">
					<div id="login_service">
            			<input type="button" onclick="list2()" value ="목록으로">
            			<input type="button" onclick="edit()" value ="수정하기">
            			<input type="button" onclick="del()" value ="삭제하기">
            		</div>
				</c:when> 
				<c:otherwise>
					<div id="login_null">
            			<input type="button" onclick="history.go(-1)" value ="목록으로">
        			</div>
				</c:otherwise> 
			</c:choose> 	
      </form> 
      
          <form id="comment" name="comment">
      	<ul>
      	<h2>댓글</h2>
			
			<br>
			<c:forEach var="reply" items="${reply}">
        		<li>
        			<div id="reply">
						<span id="replyText1"><c:out value="${reply.getReply_id()}"/> / <c:out value="${reply.getReply_time()}"/></span>
						<br><span id="replyText"><c:out value="${reply.getReply_text()}"/></span>
						
				 	<c:choose>
						<c:when test="${user_id.equals(reply.getReply_id())}">
						<div id="replyEdit">
							<input id="success_reply_number" name="success_reply_number" type="hidden" value="${reply.getSuccess_reply_number()}">
					    	<input id="success_write_number" name="success_write_number" type="hidden" value="${reply.getSuccess_write_number()}">
					    	<input type="button" value="댓글 수정">
					    	<input type="button" onclick="delreply()" value="댓글 삭제">
					   	</div>
						</c:when>
       				</c:choose>
       				</div>
        		</li>
       		 </c:forEach>
			
          		<li>
          		<c:choose> 
					<c:when test="${user_id == null}">
						<div id ="com">
            				<input id="aa" name="aa" type="text">
            				<input onclick="location.href='/main_login'" type="button" value="댓글 등록">
            			</div>
					</c:when> 
				<c:otherwise>
					<div id ="com">
            			<input id="reply_text" name="reply_text" type="text">
            			<input id="success_write_number" name="success_write_number" type="hidden" value="${readBoard.getSuccess_write_number()}">
            			<input id="reply_id" name="reply_id" type="hidden" value="${user_id}">
            			<input type="button" onclick="commentSubmit()" value="댓글 등록">
            		</div>
				</c:otherwise> 
				</c:choose> 			
            	</li>
      	</ul>
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

</body>
</html>