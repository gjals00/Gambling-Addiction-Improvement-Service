
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/membership.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
    </style>
    
    <script type="text/javascript">
    
    var check = false;
    
    if(${idCheckOk != null})
	{
		check = true;
	}
    
    function checking() 
    {
    	
    	var checkNum = /^[0-9]$/; // ^는 문자의 시작 부분에 대응하여 $는 끝 부분과 대응하여 입력 검사를할 수 있다
        var checkId = /^[0-9a-zA-Z]{5,10}$/;
        var checkPw = /^[0-9a-zA-Z]{8,12}$/;
        var checkName = /^[가-힣]{2,4}$/;
        var checkBirthday = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
        var checkEmail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
        var checkTel = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/;
        
    	var signup = document.signup;
        var user_id = signup.user_id.value;
        var user_pw = signup.user_pw.value;
        var user_pw_check = signup.user_pw_check.value;
        var user_name = signup.user_name.value;
        var user_birthday = signup.user_birthday.value;
        var user_gender = signup.user_gender.value;
        var user_email = signup.user_email.value;
        var user_tel = signup.user_tel.value;
        var PersonalData = signup.PersonalData.checked;

		
		if(checkId.test(user_id) != true)
        {
        	alert("아이디를 조건에 맞게 입력해주세요.");
        }
		else if(check != true)
		{
			alert("아이디 중복확인은 필수입니다.");	
		}
        else if(checkPw.test(user_pw) != true)
        {
			alert("비밀번호를 조건에 맞게 입력해주세요.");
        }
        else if(user_pw != user_pw_check)
        {
            alert("비밀번호가 일치하지 않습니다.");
        }
        else if(checkName.test(user_name) != true)
        {
			alert("이름을 올바르게 입력해주세요.");
        }
        else if(checkBirthday.test(user_birthday) != true)
        {
			alert("생년월일을 올바르게 입력해주세요.");
        }
        else if(user_gender.length < 1)
        {
   			alert("성별을 선택해주세요.")
        }
        else if(checkEmail.test(user_email) != true)
        {
			alert("이메일을 올바르게 입력해주세요.");
        }
        else if(checkTel.test(user_tel) != true)
        {
			alert("휴대전화 번호를 올바르게 입력해주세요.");
        }
        else if(PersonalData != true)
        {
        	alert("개인정보 제공 동의는 필수사항입니다.")	
        }
        else
        {
        	alert("회원가입이 완료되었습니다.")
            signup.method = "post";
    		signup.action = "/insert.do";
    		signup.submit(); //자바스크립트에서 서블릿으로 전송
        }	
	} 
    /* function id_checking() 
    {
    	window.open("/MyProject/membership/idCheck.jsp","id_check","width=500px height=300px");
	}
     */
     function id_checking() 
     {
    	var checkId = /^[0-9a-zA-Z]{5,10}$/;
  		var signup = document.signup;
  		var user_id = signup.user_id.value;
  	
 	    if(checkId.test(user_id) != true)
 	    {
 			alert("아이디를 조건에 맞게 입력해주세요.");
 	    }
 	    else if (user_id.indexOf("admin") != -1 || user_id.indexOf("ADMIN") != -1 || user_id.indexOf("Admin") != -1)
 	    {
 	    	alert("사용할 수 없는 아이디 입니다.");
 	    	location.href = '/membership';
 	    }
        else
        { 
        	// window.open("/membershipIdCheck.do","팝업","width=600, height=500, top=10, left=10");
            signup.method = "post";
    		signup.action = "/membershipIdCheck.do"
     		signup.submit(); //자바스크립트에서 서블릿으로 전송		
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
    <h1 >회원 가입</h1>
    </center>
    <form id="signup" name="signup">
          <ul>
          <c:if test="${idCheckOk != null}">
            <li>
              <label for="userid">아이디</label>
              <input for="userid" name="user_id" type="text" value="${idCheckOk}">
              <input id="id_check" name="id_check" onclick="id_checking()" type="button" value="중복확인">
              <div id=checkId><b><p style="color:red;">- 사용 가능한 아이디</b></div>
          </c:if>
          <c:if test="${!(idCheckOk != null)}">
            <li>
              <label for="userid">아이디</label>
              <input for="userid" name="user_id" type="text" placeholder="대/소문자 or숫자  5~10자 입력" autofocus>
              <input id="id_check" name="id_check" onclick="id_checking()" type="button" value="중복확인">
          </c:if>
            <div id="li2">
            </li>
            <li>
              <label for="pwd1">비밀번호</label><br>
              <input for="pwd1" name="user_pw" type="password" placeholder="대/소문자 or숫자  8자~12자 입력"  required>
            </li>
            <li>
              <label for="pwd2">비밀번호 확인</label><br>
              <input for="pwd2" name="user_pw_check" type="password" placeholder="비밀번호 재입력" required>
            </li>  
            <li>
              <label for="username">이름</label><br>
              <input for="username" name="user_name" type="text" required>
            </li>
            <li>
              <label for="birth">생년월일</label><br>
              <input for="birth" name="user_birthday" type="text" placeholder="ex) 19881205  (8자입력)" required>
            </li>
            <li>
              <label for="gender">성별</label><br>
              <input for="gender" name="user_gender" type="radio" value="남" required>남
              <input for="gender" name="user_gender" type="radio" value="여" required>여
              <br>
            </li>
            <li>
              <label for="email">이메일 주소</label><br>
              <input type="email" name="user_email" placeholder="ex) abc123@mail.com" required autocomplete="off">
            </li>
            <li>
              <label for="tel">휴대전화</label><br>
              <input id="tel" name="user_tel" type="tel" placeholder="ex) 01012345678" required>
            </li>
            <br>
            <br>
            <li><input name="PersonalData" type="checkbox" required> 개인정보 제공에 동의합니다.</li>  
            <br>
            <br>
 				<input id="final" type="button" onclick="checking()" value="가입하기" style="width: 500px; height: 60px">
          </div>
          </ul>
      </form>
    </body>
    </html>
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