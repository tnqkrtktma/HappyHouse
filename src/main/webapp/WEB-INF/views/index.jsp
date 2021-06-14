<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!--  123, 166 Google API Key 입력후 테스트 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HappyHouse</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 	<div class="container"> -->
	<!-- 		상단바 -->
	<%@ include file="/WEB-INF/views/title.jsp"%>

	<!-- Masthead-->
	<header class="masthead" style="height: 30">
		<div class="container h-30">
			<div class="row h-30 align-items-center justify-content-center text-center">
				<div class="col-lg-10">
					<h1 class="text-uppercase text-white font-weight-bold">환영합니다!</h1>
					<hr class="divider my-4" />
				</div>
			</div>
		</div>
	</header>

	<section id="index_section">
		<div class="card col-sm-12 mt-1" style="min-height: 850px;">
			<div class="card-body" align="center">
				<hr>
				<p style="font-size: 1.5em;">SSAFY 멀티 캠퍼스의 위치는...</p>
				<hr>
				<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
				<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
				<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQ50lq7QoA_El3Q2m2DHQ9llg2s4MyhS4&callback=initMap"></script>
				<script>
						var multi = {lat: 37.5665734, lng: 126.978179};
						var map;
						function initMap() {
							map = new google.maps.Map(document.getElementById('map'), {
								center: multi, zoom: 12
							});
							var marker = new google.maps.Marker({position: multi, map: map});
						}
						function addMarker(tmpLat, tmpLng, aptName) {
							var marker = new google.maps.Marker({
								position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
								label: aptName,
								title: aptName
							});
							marker.addListener('click', function() {
								map.setZoom(17);
								map.setCenter(marker.getPosition());
								callHouseDealInfo();
							});
							marker.setMap(map);
						}
						// Sets the map on all markers in the array.
						function setMapOnAll(map) {
							for (var i = 0; i < markers.length; i++) {
								markers[i].setMap(map);
							}
						}
	
						// Removes the markers from the map, but keeps them in the array.
						function clearMarkers() {
							setMapOnAll(null);
						}
	
						// Shows any markers currently in the array.
						function showMarkers() {
							setMapOnAll(map);
						}
	
						// Deletes all markers in the array by removing references to them.
						function deleteMarkers() {
							clearMarkers();
							markers = [];
						}
						function callHouseDealInfo() {
							alert("you can call HouseDealInfo");
						}
					</script>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<!-- 	</div> -->
</body>
</html>