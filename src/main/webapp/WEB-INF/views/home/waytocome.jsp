<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오시는 길</title>

<link href="${path}/resources/css/come.css" rel="stylesheet" />
<script defer src="${path}/resources/js/scrollbtn.js"></script>
<link href="${path}/resources/css/scrollbtn.css" rel="stylesheet" />
</head>
<body>
	<p class="top_scrollbtn" onclick="location.href='#'">TOP</p>
	<div>
		<jsp:include page="../common/header.jsp" />
		<h2 style="margin-top: 150px; text-align: center">
			<strong>오시는 길</strong>
		</h2>
		<div
			style="width: 70px; height: 5px; background-color: #024C86; margin: auto; margin-bottom: 90px"></div>
	</div>
	<div class="container1 mt-4">
		<div style="margin-top: 27px;">
			<div id="map" class="map"
				style="width: 1120px; height: 490px; margin: auto;"></div>
		</div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fe2c43d3f698062c7174e0ad3e192f9"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				// 지도의 중심좌표
				center : new kakao.maps.LatLng(37.4937, 127.0281),
				level : 2
			};

			// 지도 생성
			var map = new kakao.maps.Map(mapContainer, mapOption);

			var imageSrc = '${path}/resources/img/Marker.png', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(100, 80), // 마커이미지의 크기입니다
			imageOption = {
				offset : new kakao.maps.Point(42, 70)
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption), markerPosition = new kakao.maps.LatLng(
					37.4937, 127.0281); // 마커가 표시될 위치입니다

			// 마커 생성
			var marker = new kakao.maps.Marker({
				position : markerPosition,
				image : markerImage
			// 마커이미지 설정 
			});

			marker.setMap(map);
			marker.setDraggable(true);

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};
		</script>


		<div class="info">
			<div class="address1">
				<div class="left-address1">
					<p>주소 | 서울 서초구 서초대로 74길 45, 엔데버 빌딩 3층</p>
				</div>
				<div class="right-address1">
					<p>대표전화 | 02-2088-8408</p>
				</div>
			</div>
			<div class="stations">
				<div class="left">
					<h3>
						<img src="resources/img/버스.png" alt="버스 이미지">&nbsp;주변 정류장
					</h3>
					<p>
						<span class="line blue">간선</span> <a
							href="https://map.naver.com/p/entry/bus-station/106262?c=17.00,0,0,0,dh"
							target="_blank">144</a>, <a
							href="https://map.naver.com/p/entry/bus-station/106262?c=17.00,0,0,0,dh"
							target="_blank">145</a>
					</p>
					<p>
						<span class="line red">광역</span> <a
							href="https://map.naver.com/p/search/22997/bus-station/156838?c=18.00,0,0,0,dh&isCorrectAnswer=true"
							target="_blank">3008</a>, <a
							href="https://map.naver.com/p/search/22997/bus-station/156838?c=18.00,0,0,0,dh&isCorrectAnswer=true"
							target="_blank">1006</a>, <a
							href="https://map.naver.com/p/entry/bus-station/81593?c=20.00,0,0,0,dh"
							target="_blank">1241</a>, <a
							href="https://map.naver.com/p/search/22997/bus-station/156838?c=18.00,0,0,0,dh&isCorrectAnswer=true"
							target="_blank">3007</a>, <a href="" target="_blank">9700</a>, <a
							href="https://map.naver.com/p/entry/bus-station/106186?c=19.09,0,0,0,dh"
							target="_blank">9711</a>
					</p>
					<p>
						<span class="line green">마을</span> <a
							href="https://map.naver.com/p/entry/bus-station/55009942?c=18.00,0,0,0,dh">4312</a>,
						<a
							href="https://map.naver.com/p/entry/bus-station/124700?c=18.48,0,0,0,dh"
							target="_blank">서초03</a>, <a
							href="https://map.naver.com/p/entry/bus-station/124700?c=18.48,0,0,0,dh"
							target="_blank">서초09</a>
					</p>
				</div>
				<div class="right">
					<h3>
						<img src="resources/img/지하철.png" alt="지하철 이미지">&nbsp;주변 지하철
					</h3>
					<p>
						<span class="line line-sinbundang">신분당선</span> <a
							href="https://map.naver.com/p/entry/subway-station/1910?c=18.87,0,0,0,dh"
							target="_blank">강남역 5번출구 ,6번출구</a>
					</p>
					<p>
						<span class="line line-3">3호선</span> <a
							href="https://map.naver.com/p/entry/subway-station/342?c=18.40,0,0,0,dh"
							target="_blank">양재역 2번출구</a>
					</p>
					<p>
						<span class="line line-2">2호선</span> <a
							href="https://map.naver.com/p/entry/subway-station/222?c=19.04,0,0,0,dh"
							target="_blank">강남역 7번출구</a>
					</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
