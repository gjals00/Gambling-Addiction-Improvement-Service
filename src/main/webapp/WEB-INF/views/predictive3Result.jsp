<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidepage4.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
    </style>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
     
  // 숫자 1000단위 쉼표 추가
     $( document ).ready( function() {
       $( '#jb' ).text( $( '#jb' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
     } );
     $( document ).ready( function() {
         $( '#jb1' ).text( $( '#jb1' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
       } );
     $( document ).ready( function() {
         $( '#jb2' ).text( $( '#jb2' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
       } );
     $( document ).ready( function() {
         $( '#jb3' ).text( $( '#jb3' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
       } );
     
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
            <h1>도박 중독 치유/재활 참여 예측</h1>
        </div>
        <div id="mainMenu">
            <h3>
                ${predictive.getYear()}년의 도박 중독 치유/재활 참여 수요 증감 예측 분석 결과입니다.
            </h3>
    
             <div style="width: 900px; height: 900px;">
				<!--차트가 그려질 부분-->
					<canvas id="myChart" width="880" height="440" style="display: block;width: 880px;height: 440px;margin-left: 400px;margin-top: 50px;"></canvas>
			 </div>   
            <div id ="predict">
			<c:if test="${predictive.getSelfhealing() != null}">
						<p>- ${predictive.getYear()}년의 <span style="color: #0000cc;">본인의 도박 중독 치유/재활 상담 참여자</span> 예측 수는 <span id="jb">${predictive.getSelfhealing()}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getSelfhealing()) - Integer.parseInt(predictive_past.getSelfhealing())) / Integer.parseInt(predictive_past.getSelfhealing()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getGrouphealing() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #FF0000;">가족 및 지인의 도박 중독 치유/재활 상담 참여자</span> 예측 수는 <span id="jb1">${predictive.getGrouphealing()}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getGrouphealing()) - Integer.parseInt(predictive_past.getGrouphealing())) / Integer.parseInt(predictive_past.getGrouphealing()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getSelfcounseling() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #00cc00;">본인의 도박 중독 집단상담 프로그램 참여자</span> 예측 수는 <span id="jb2">${predictive.getSelfcounseling()}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getSelfcounseling()) - Integer.parseInt(predictive_past.getSelfcounseling())) / Integer.parseInt(predictive_past.getSelfcounseling()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getGroupcounseling() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #1FC9C9;">가족 및 지인의 도박 중독 집단상담 프로그램 참여자</span> 예측 수는 <span id="jb3">${predictive.getGroupcounseling()}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getGroupcounseling()) - Integer.parseInt(predictive_past.getGroupcounseling())) / Integer.parseInt(predictive_past.getGroupcounseling()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if> 
			 </div> 
        <div id="button">
            <a href="/predictive3">
                <input type="submit" value="다시하기">
            </a>
            <a href="/main">
                <input type="reset" value="메인으로">
            </a>
        </div>
    </div>
        <footer>
            <div id="bottomMenu">
                <ul>
                    <li><a href="#">© Gambling Addiction Improvement Service</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">이용 약관</a></li>
                    <li><a href="#">공지사항</a></li>
                </ul>

            </div>
            <div id="company">
                <p>서울특별시 OO구 OO동 OO로 대표전화 : 02-000-1234</p>
            </div>
        </footer>
    </div>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   
   <script type="text/javascript">
   			
   	
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '본인 치유 참여','가족/지인 치유 참여','본인 집단상담 참여','가족/지인 집단상담 참여 '
                    ],
                    
                    datasets: [
                        { //데이터
                            label: '예측 데이터', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [${predictive.getSelfhealing()},${predictive.getGrouphealing()},${predictive.getSelfcounseling()},${predictive.getGroupcounseling()}], //x축 label에 대응되는 데이터 값
                            
                            backgroundColor: [
                                //색상
                                '#0000cc',
                                '#FF0000',
                                '#00cc00',
                                '#1FC9C9',
                                '#C06B16',
                                '#FAFA00',
                                '#DC20D6',
                                '#EF8419',
                                '#A0A0A0'
                                
                            ],
                            borderColor: [
                                //경계선 색상
                                '#0000cc',
                                '#FF0000',
                                '#00cc00',
                                '#1FC9C9',
                                '#C06B16',
                                '#FAFA00',
                                '#DC20D6',
                                '#EF8419',
                                '#A0A0A0'
                            ],
                            borderWidth: 1 //경계선 굵기
                        },

                    ]
                },
                options: {
                	legend: {
                		display : false
                	},
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
    </body>
</html>
</body>
</html>