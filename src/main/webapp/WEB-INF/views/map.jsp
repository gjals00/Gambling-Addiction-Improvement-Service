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
    <title>가까운 센터찾기 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main_map.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');

    </style>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
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
	
	function findCenter() 
 	{      
		var center2 = document.center2;
		var order1 = document.getElementById("order1");
        var result1 = order1.options[order1.selectedIndex].value;
        
        var order2 = document.getElementById("order2");
        var result2 = order2.options[order2.selectedIndex].value;
		var result = 0;
        
		result = result1+" "+result2
		$('input[name=ADDRESS]').attr('value',result); 
        	
		center2.method ="post";
 		center2.action ="/findcenterWrite.do";
 		center2.submit(); //자바스크립트에서 서블릿으로 전송 
	}
	
	function notice() 
	{
		alert('위치정보 권한 사이트 보안연결 문제가 있습니다. 직접 선택하여 찾기를 이용해주세요.');
	}
	</script>     
</head>
<body>
  <div id="container">
    <header>
        <div id="logo">
            <a href="/main">
                <img src="${pageContext.request.contextPath}/resources/images/main_logo.png" alt="메인 로고" >
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
    <h1>가까운 센터 찾기</h1><br><br>
    <div id="pp">
        <br><p>내 현재위치와 가까운 도박중독관리센터를 찾아드립니다.</p>

	<form id="center">  
		<br><input type="button" onclick="notice()" value="내 현재위치 정보를 제공하여 찾기"> 
		<br><input type="button" onclick="city()" value="내 현재위치를 직접 선택하여 찾기">
	</form> 
		<div id="hidden" style="display:none;">
		<br><center><span style="font-size:20px;"><p>※ 센터가 존재하지 않는 지역은 선택지에서 제외되었습니다.</p></span></center>
		<form id="center2" name="center2" method="post">
			<br><select style="width:200px;height:40px; font-size:15px;" id="order1" name="write_adrrress1" onchange="categoryChange(this)" form="center2">
    				<option value="null">지역을 선택해주세요</option>
    				<option value="서울특별시">서울특별시</option>
    				<option value="경기도">경기도</option>
    				<option value="인천광역시">인천광역시</option>
    				<option value="강원도">강원도</option>
    				<option value="경상북도">경상북도</option>
    				<option value="경상남도">경상남도</option>
    				<option value="충청남도">충청남도</option>
    				<option value="충청북도">충청북도</option>
    				<option value="전라북도">전라북도</option>
    				<option value="전라남도">전라남도</option>
    				<option value="울산광역시">울산광역시</option>
    				<option value="부산광역시">부산광역시</option>
    				<option value="대구광역시">대구광역시</option>
    				<option value="대전광역시">대전광역시</option>
    				<option value="광주광역시">광주광역시</option>
    				<option value="제주특별자치도">제주특별자치도</option>
				</select>
				
				<select style="width:200px;height:40px; font-size:15px;" id="order2" name="write_adrrress2">
					<option value="null">지역을 선택해주세요</option>
				</select>
				<input type="hidden" id="ADDRESS" name="ADDRESS" value=""/> 
				<input type="button" onclick="findCenter()" value="찾기">
			</form>
		</div>	

	
	<script type="text/javascript">
	 	function city() 
	 	{
	        if ($('#hidden').css('display') == 'none') 
	        {
	            $('#hidden').css('display', 'block');
	        } 
	        else 
	        {
	            $('#hidden').css('display', 'none');
	        }
	    }
	 	
	 	function categoryChange(e) {
	 		var order2_1 = ["도봉구", "노원구"];
	 		var order2_2 = ["화성시", "파주시", "의정부시", "안양시","안산시", "수원시", "성남시", "고양시"];
	 		var order2_3 = ["연수구", "부평구", "동구", "남동구", "계양구"];
	 		var order2_4 = ["춘천시", "원주시", "강릉시"];
	 		var order2_5 = ["포항시", "구미시"];
	 		var order2_6 = ["김해시", "양산시", "진주시", "창원시"];
	 		var order2_7 = ["아산시", "천안시"];
	 		var order2_8 = ["청주시"];
	 		var order2_9 = ["군산시", "전주시"];
	 		var order2_10 = ["목포시", "여수시"];
	 		var order2_11 = ["남구", "중구"];
	 		var order2_12 = ["사상구", "서구", "해운대구"];
	 		var order2_13 = ["달서구", "동구"];
	 		var order2_14 = ["대덕구", "동구", "서구"];
	 		var order2_15 = ["광산구", "동구", "서구", "남구","북구"];
	 		var order2_16 = ["서귀포시", "제주시"];
	 		
	 		var target = document.getElementById("order2");

	 		if(e.value == "서울특별시") var d = order2_1;
	 		else if(e.value == "경기도") var d = order2_2;
	 		else if(e.value == "인천광역시") var d = order2_3;
	 		else if(e.value == "강원도") var d = order2_4;
	 		else if(e.value == "경상북도") var d = order2_5;
	 		else if(e.value == "경상남도") var d = order2_6;
	 		else if(e.value == "충청남도") var d = order2_7;
	 		else if(e.value == "충청북도") var d = order2_8;
	 		else if(e.value == "전라북도") var d = order2_9;
	 		else if(e.value == "전라남도") var d = order2_10;
	 		else if(e.value == "울산광역시") var d = order2_11;
	 		else if(e.value == "부산광역시") var d = order2_12;
	 		else if(e.value == "대구광역시") var d = order2_13;
	 		else if(e.value == "대전광역시") var d = order2_14;
	 		else if(e.value == "광주광역시") var d = order2_15;
	 		else if(e.value == "제주특별자치도") var d = order2_16;

	 		target.options.length = 0;

	 		for (x in d) {
	 			var opt = document.createElement("option");
	 			opt.value = d[x];
	 			opt.innerHTML = d[x];
	 			target.appendChild(opt);
	 		}	
	 	}
	</script>

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