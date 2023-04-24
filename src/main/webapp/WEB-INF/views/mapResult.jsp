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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mapResult.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');

    </style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d92094db08e894e93f4132fd211d076&libraries=services"></script>    
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
                    <li><a href="/predictive2">도박 범죄 증감 예측</a></li>
                    <li><a href="/predictive3">도박 중독 치유/재활 참여 예측</a></li>
                </ul>
            </li>
            <li><a href="#">커뮤니티<span>▼</span></a>
                <ul>
                    <li><a href="/freeBoard?pageNumber=1">자유 게시판</a></li>
                    <li><a href="/successBoard?pageNumber=1">성공사례 게시판</a></li>
                </ul>
            </li>
            <li><a href="/map.">가까운 센터</a></li>
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
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();


var listData = new Array();

<c:forEach items="${address}" var="list">
	address:listData.push("${list.ADDRESS}");
	category:listData.push("${list.CENTER_NAME}");
</c:forEach>

var centerName = new Array();

<c:forEach items="${address}" var="list2">
	centerName.push("${list2.CENTER_NAME}");
</c:forEach>

for (var i=0; i < listData.length ; i++) {
//주소로 좌표를 검색합니다
geocoder.addressSearch(listData[i], function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    
    
    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
    	removable : true,
        content: '<div style="display:inline-block; width:200px;">'+'중독관리통합지원센터'+'</div>'
    });
    infowindow.open(map, marker); 

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
})

};    
</script>

<div id="result">
<c:forEach var="list" items="${address}">
        		<tr>
        			<br><td><h4>센터명 : <c:out value="${list.CENTER_NAME}"/></h4></td>
        			<td><h4>우편번호 : <c:out value="${list.POSTAL_CODE}"/></h4></td>
        			<td><h4>주소 : <c:out value="${list.ADDRESS}" /><c:out value="${list.ADDRESS2}" /></h4></td>
        			<td><h4>전화번호 : <c:out value="${list.NUMBER1} "/><c:out value="${list.NUMBER2} "/><c:out value="${list.NUMBER3} "/></h4></td>
        			<td><h4>팩스번호 : <c:out value="${list.FAX1} "/><c:out value="${list.FAX2} "/><c:out value="${list.FAX3} "/></h4></td>
        			<td><h4><c:out value="${list.URL}"/></h4></td><br>
        			<p style="font-size:15px;">※ 제공되는 정보는 변동사항이 있을 수 있습니다.</p>
        		</tr>
       		 </c:forEach>
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