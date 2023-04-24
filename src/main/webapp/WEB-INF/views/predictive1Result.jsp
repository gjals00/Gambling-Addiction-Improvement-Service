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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidepage2.css">
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
       $( document ).ready( function() {
           $( '#jb4' ).text( $( '#jb4' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
         } );
       $( document ).ready( function() {
           $( '#jb5' ).text( $( '#jb5' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
         } );
       $( document ).ready( function() {
           $( '#jb6' ).text( $( '#jb6' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
         } );
       $( document ).ready( function() {
           $( '#jb7' ).text( $( '#jb7' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
         } );
       $( document ).ready( function() {
           $( '#jb8' ).text( $( '#jb8' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
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
                        <li><a href="/predictive2">도박 유형별 범죄 증감 예측</a></li>
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
            <h1>도박 수요 증감 예측</h1>
        </div>
        <div id="mainMenu">
            <h3>
                ${predictive.getYear()}년의 도박 수요 증감 예측 분석 결과입니다.
            </h3>
    
             <div style="width: 900px; height: 900px;">
				<!--차트가 그려질 부분-->
					<canvas id="myChart" width="880" height="440" style="display: block;width: 880px;height: 440px;margin-left: 400px;margin-top: 50px;"></canvas>
			 </div>  
            <div id ="predict">
        
        
			   <c:if test="${predictive.getMan() != null}">
						<p>- ${predictive.getYear()}년의 <span style="color: #0000cc;">남성</span> 중독자 예측 수는 <span id="jb">${Integer.parseInt(predictive.getMan())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getMan()) - Integer.parseInt(predictive_past.getMan())) / Integer.parseInt(predictive_past.getMan()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getWoman() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #FF0000;">여성</span> 중독자 예측 수는 <span id="jb1">${Integer.parseInt(predictive.getWoman())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getWoman()) - Integer.parseInt(predictive_past.getWoman())) / Integer.parseInt(predictive_past.getWoman()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getSeoul() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #00cc00;">서울</span> 지역 중독자 예측 수는 <span id="jb2">${Integer.parseInt(predictive.getSeoul())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getSeoul()) - Integer.parseInt(predictive_past.getSeoul())) / Integer.parseInt(predictive_past.getSeoul()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getGyeonggido() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #1FC9C9;">경기도 </span> 지역 중독자 예측 수는 <span id="jb3">${Integer.parseInt(predictive.getGyeonggido())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getGyeonggido()) - Integer.parseInt(predictive_past.getGyeonggido())) / Integer.parseInt(predictive_past.getGyeonggido()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if> 
			   
			   <c:if test="${predictive.getOthercity() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #C06B16;">서울/경기 외 지역</span> 중독자 예측 수는 <span id="jb4">${Integer.parseInt(predictive.getOthercity())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getOthercity()) - Integer.parseInt(predictive_past.getOthercity())) / Integer.parseInt(predictive_past.getOthercity()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getTeenage() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #c0cd00;;">10대 </span> 중독자 예측 수는 <span id="jb5">${Integer.parseInt(predictive.getTeenage())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getTeenage()) - Integer.parseInt(predictive_past.getTeenage())) / Integer.parseInt(predictive_past.getTeenage()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getTwenty() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #DC20D6;">20대 </span> <span id="jb6">중독자 예측 수는 ${Integer.parseInt(predictive.getTwenty())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getTwenty()) - Integer.parseInt(predictive_past.getTwenty())) / Integer.parseInt(predictive_past.getTwenty()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if>
			   
			   <c:if test="${predictive.getThirty() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #EF8419;">30대 </span> <span id="jb7">중독자 예측 수는 ${Integer.parseInt(predictive.getThirty())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getThirty()) - Integer.parseInt(predictive_past.getThirty())) / Integer.parseInt(predictive_past.getThirty()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if> 
			   
			   <c:if test="${predictive.getOtherage() != null}">
						<br><p>- ${predictive.getYear()}년의 <span style="color: #A0A0A0;">40대 이상 </span> <span id="jb8">중독자 예측 수는 ${Integer.parseInt(predictive.getOtherage())}명입니다.</span></p>
						<p>--> 전 년도 대비 <span style="color: red;"><fmt:formatNumber value="${(Integer.parseInt(predictive.getOtherage()) - Integer.parseInt(predictive_past.getOtherage())) / Integer.parseInt(predictive_past.getOtherage()) *100}" pattern=".0"/>%</span> 상승한 수치입니다.</p>
			   </c:if> 
			 </div>
        <div id="button">
            <a href="/predictive1">
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
                        '남성','여성','서울','경기도','그/외 도시','10대','20대','30대','40대 이상'
                    ],
                    
                    datasets: [
                        { //데이터
                            label: '예측 데이터', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [${predictive.getMan()},${predictive.getWoman()},${predictive.getSeoul()},${predictive.getGyeonggido()},${predictive.getOthercity()},${predictive.getTeenage()},${predictive.getTwenty()},${predictive.getThirty()},${predictive.getOtherage()}], //x축 label에 대응되는 데이터 값
                            
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
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
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