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
        <p>내 현재위치와 가까운 도박중독관리센터를 찾아드립니다.</p></div>
    <h2><img src="${pageContext.request.contextPath}/resources/images/map_position.png" alt="위치 찾기">위치정보 제공에 동의해주세요.</h2><br>
  	<center><h3>※ 동일한 지역구에 위치한 센터가 없다면, 시/군 범위의 센터 정보를 제공합니다. </h3></center>
    <div id="map" style="width:1300px;height:450px;"></div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d92094db08e894e93f4132fd211d076&libraries=services"></script>
 <script type="text/javascript">   
 var geocoder = new kakao.maps.services.Geocoder();		
 var latitud = 0;
 var longitude = 0;
 
	document.addEventListener("DOMContentLoaded", function() {
    function getLocation(position) {

    	
    	latitud = position.coords.latitude;
		longitude = position.coords.longitude;
		var result;
		
		var mapContainer = document.getElementById('map') // 지도를 표시할 div 
		var mapOption = { 
    			center: new kakao.maps.LatLng(latitud, longitude), // 지도의 중심좌표
    			level: 3 // 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(latitud, longitude); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({ position: markerPosition});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		 var callback = function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            
		            result = result[0].road_address.address_name;
		           	
		           	$('input[name=ADDRESS]').attr('value',result);
		           	
		           	$("#address").text(' '+result);
		           
		        }
		    };
		    geocoder.coord2Address(markerPosition.getLng(), markerPosition.getLat(), callback);

    }		
    

    if(navigator.geolocation) 
    {
        navigator.geolocation.getCurrentPosition(getLocation, function(error) 
        {
            consol.log(error.message);    
        });
    } 
    else 
    {
        consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
    }
});
</script>

<center><h3>현재 내 위치 :<span id="address"></span></h3></center>
<center><p>(정확한 위치는 실제와 오차범위가 존재 할 수 있습니다.)<span id="address"></span></p></center>
<form method="post" action="/findcenter.do"> 

<input type="hidden" id="ADDRESS" name="ADDRESS" value=""/> 

<input type="submit" value="센터 찾기"> 

</form>

<!-- <form method="post" action="/findcenter.do">
	
	<input id="ADDRESS" name="ADDRESS" type="text">
	
	<input type="submit" value="전송">
</form>  -->

<div class="btn_wrap">
    <!-- <a class="btn_org" href="javascript:;"><span class="txt_white">센터 상세정보</span></a> -->
    <!-- <button onclick="window.open('http://127.0.0.1:5500/main_map.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');">네이버</button> -->
    <!-- <button onclick="parent.location.href='http://127.0.0.1:5500/main_map.html'">네이버</button>
     -->

     <div id="my_modal">
        <h1>센터 정보</h1>
        <p><b>센터명 :</b> 인천 남동구 중독관리센터 </p><br>
        <p><b>주소 :</b> 인천광역시 남동구 남동대로 922번길 52 5층 </p><br>
        <p><b>전화번호 :</b> 032-438-6565 </p>

        <a class="modal_close_btn">닫기</a>
    </div>

   <!--  <button id="popup_open_btn"><span class="txt_white">센터 상세정보</span></button>

    <script>
        function modal(id) {
            var zIndex = 9999;
            var modal = document.getElementById(id);

            // 모달 div 뒤에 희끄무레한 레이어
            var bg = document.createElement('div');
            bg.setStyle({
                position: 'fixed',
                zIndex: zIndex,
                left: '0px',
                top: '0px',
                width: '100%',
                height: '100%',
                overflow: 'auto',
                // 레이어 색갈은 여기서 바꾸면 됨
                backgroundColor: 'rgba(0,0,0,0.4)'
            });
            document.body.append(bg);

            // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
            modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                bg.remove();
                modal.style.display = 'none';
            });

            modal.setStyle({
                position: 'fixed',
                display: 'block',
                boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                // 시꺼먼 레이어 보다 한칸 위에 보이기
                zIndex: zIndex + 1,

                // div center 정렬
                top: '50%',
                left: '50%',
                transform: 'translate(-50%, -50%)',
                msTransform: 'translate(-50%, -50%)',
                webkitTransform: 'translate(-50%, -50%)'
            });
        }

        // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
        Element.prototype.setStyle = function(styles) {
            for (var k in styles) this.style[k] = styles[k];
            return this;
        };

        document.getElementById('popup_open_btn').addEventListener('click', function() {
            // 모달창 띄우기
            modal('my_modal');
        });
    </script>  -->
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