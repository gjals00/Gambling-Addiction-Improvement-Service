<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/idCheck.css">
 <script type="text/javascript">
 	function idchecking() 
 	{
 		
 		var checkId = /^[0-9a-zA-Z]{5,10}$/;
 		var signup = document.signup;
 		var user_id = signup.user_id.value;
 	
	    if(checkId.test(user_id) != true)
	    {
			alert("아이디를 조건에 맞게 입력해주세요.");
			history.go(-1);
	    }
	    else if (user_id.indexOf("admin") != -1)
	    {
	    	alert("사용할 수 없는 아이디 입니다.");
	    }
	    else
        {
            signup.method = "post";
    		signup.action = "/MyProject/membership/idCheck.do";
    		signup.submit(); //자바스크립트에서 서블릿으로 전송
    		
        }	
	}
 </script>
</head>
<body>
	<form id="signup" name="signup">
          <ul>
            <li>
            <center><h2>아이디 중복 확인</h2></center>
             	 <h3>아이디 <input id="user_id" name="user_id" type="text" placeholder="대/소문자 or숫자  5~10자 입력"></h3>
             	 <input id="checking" name="checking" onclick="idchecking()" type="button" value="중복체크">
           </li>
          </ul>
     </form>
</body>
</html>