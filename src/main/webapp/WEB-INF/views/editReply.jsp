<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판 | 도박 중독 개선 서비스</title>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
    </style>
	
	<script type="text/javascript">
    
	function editsubmit() 
	{
		var signup = document.signup;
		
        signup.method = "post";
		signup.action = "/editreply.do";
		signup.submit(); //자바스크립트에서 서블릿으로 전송		
	}

	</script>		  
</head>
<body>
    <center><h1>댓글 수정</h1></center>
		
				<form name="signup" id="signup">
					<!-- <img id="login_img" src="images/main_logo.png" alt="메인 로그인 이미지"> -->
					<ul>
						<div id="id_pw">
							<input id="reply_number" name="reply_number" type="hidden" value="${reply.getReply_number()}">
							<input id="write_number" name="write_number" type="hidden" value="${reply.getWrite_number()}">
							<li><label for="reply_text">내용 입력</label><br> <input id="reply_text" name="reply_text" type="text"></li>
						</div>
					</ul>
				
					<br> <br> <br> <br>
					<div id="login_menu">
						<input type="button" onclick="editsubmit()" value="수정하기" style="width: 300px; height: 70px">
						<input type="button" onclick="window.close()" value="수정취소" style="width: 300px; height: 70px">
					</div>
				</form>
			</div>
	</div>
</body>
</html>