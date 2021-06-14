<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:set var="root"	value='${pageContext.request.contextPath}'/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Document</title>
</head>



<body>
		<%@ include file="/WEB-INF/views/title.jsp"%>
		
		<!-- Masthead-->
	<header class="masthead" style="height: 30">
		<div class="container h-30">
			<div class="row h-30 align-items-center justify-content-center text-center">
				<div class="col-lg-10">
					<h1 class='text-uppercase text-white font-weight-bold' id='h1'></h1>
					<script>
					if(${type}==0)
						$("#h1").append("<h1 class='text-uppercase text-white font-weight-bold'>매매 상세 정보</h1>");
					if(${type}=='1')
						$("#h1").append("<h1 class='text-uppercase text-white font-weight-bold'>아파트 매매 상세 정보</h1>");
					if(${type}=='2')
						$("#h1").append("<h1 class='text-uppercase text-white font-weight-bold'>아파트 전월세 상세 정보</h1>");
					if(${type}=='3')
						$("#h1").append("<h1 class='text-uppercase text-white font-weight-bold'>주택 매매 상세 정보</h1>");
					if(${type}=='4')
						$("#h1").append("<h1 class='text-uppercase text-white font-weight-bold'>주택 전월세 상세 정보</h1>");
					</script>
					<hr class="divider my-4" />
				</div>
			</div>
		</div>
	</header>
		
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 450px;">
				<div class="card-body">
				<script>
				let LAT;
				let LNG;
				let AN;
				let colorArr = ['table-primary','table-success','table-danger'];
				
				$(document).ready(function(){
					//console.log('${no}');
					$("#searchResult").append(
							"<tr class='text-center'><th>찾는종류</th><th>주변검색결과</th></tr>");
					initMap();
					if(${type}=='0')
					{
						$.get("${pageContext.request.contextPath}/map/show"
								,{no:${no}}
								,function(data, status){
									$("#showdetail").empty();
									$("#showdetail").append(
										"<tr class='text-center'><th>동</th><th>명칭</th><th>매매가(만원)</th><th>면적(㎡)</th><th>준공일</th><th>거래일자</th><th>층</th><th>지번</th><th>거래종류</th></tr>");
									$.each(data, function(index, vo) {
											let str = "<tr>"
												+ "<td class='text-center'>" + vo.dong + "</td>" // 동
												+ "<td class='text-center'>" + vo.aptName + "</td>" // 아파트이름
												+ "<td class='text-center'>" + vo.dealAmount +"</td>"	// 금액
												+ "<td class='text-center'>" + vo.area + "</td>"	// 면적
												+ "<td class='text-center'>" + vo.buildYear + "</td>"	// 준공일
												+ "<td class='text-center'>" + vo.dealYear +"."+vo.dealMonth + "." + vo.dealDay + "</td>"	// 거래일자
												+ "<td class='text-center'>" + vo.floor + "</td>"
												+ "<td class='text-center'>" + vo.jibun + "</td>"
												+ "<td class='text-center'>매매</td>"
												+ "</tr>";
												$("#showdetail").append(str);
												addMarker(vo.lat, vo.lng, vo.aptName);
												LAT=vo.lat;
												LNG=vo.lng;
												AN=vo.aptName;
										});//each
									}//function
								, "json"
						);//get
					}
					else
					{
						$.get("${pageContext.request.contextPath}/map/detail"
							,{no:${no}}
							,function(data, status){
								let temp;
								if(${type}=="1")
									temp= "<td class='text-center'>아파트매매</td>";
								else if(${type}=="2")
									temp=  "<td class='text-center'>아파트전월세</td>";
								else if(${type}=="3")
									temp=  "<td class='text-center'>주택매매</td>";
								else
									temp=  "<td class='text-center'>주택전월세</td>";

								let tr;
								let td;
								if(${type}=="1"||${type}=="3")
								{
									tr= "<tr class='text-center'><th>동</th><th>건물명</th><th>매매가(만원)</th><th>면적(㎡)</th><th>준공일</th><th>거래일자</th><th>층</th><th>지번</th><th>거래종류</th></tr>";
									td= "<td class='text-center'>" + data.dealAmount + "</td>"	// 금액
								}
								else
								{
									tr= "<tr class='text-center'><th>동</th><th>건물명</th><th>전세금/월세금(만원)</th><th>면적(㎡)</th><th>준공일</th><th>거래일자</th><th>층</th><th>지번</th><th>거래종류</th></tr>";
									if(data.rentMoney==null)
										td= "<td class='text-center'>" + data.dealAmount + "(전세)</td>"	// 금액
									else
										td="<td class='text-center'>" + data.dealAmount +"/"+data.rentMoney+ "</td>"	// 금액
								}
								$("#showdetail").empty();
								$("#showdetail").append(tr);
								let str = "<tr>"
									+ "<td class='text-center'>" + data.dong + "</td>" // 동
									+ "<td class='text-center'>" + data.aptName + "</td>" // 아파트이름
									+ td
									+ "<td class='text-center'>" + data.area + "</td>"	// 면적
									+ "<td class='text-center'>" + data.buildYear + "</td>"	// 준공일
									+ "<td class='text-center'>" + data.dealYear +"."+data.dealMonth + "." + data.dealDay + "</td>"	// 거래일자
									+ "<td class='text-center'>" + data.floor + "</td>"
									+ "<td class='text-center'>" + data.jibun + "</td>"
									+ temp
									+ "</tr>";
								$("#showdetail").append(str);
								addMarker(data.lat, data.lng, data.aptName);
								LAT=data.lat;
								LNG=data.lng;
								AN=data.aptName;
								}//function
							, "json"
						);//get
					}
				});//ready
				function geocode(jsonData) {
					let idx = 0;
							let tmpLat;
							let tmpLng;
							$.get("https://maps.googleapis.com/maps/api/geocode/json"
									,{	key:'AIzaSyAdVvlvhCfWqhyXdEZe_UkMj0baIUDOvLs'
										, address:jsonData.formatted_address
									}
									, function(data, status) {
										tmpLat = data.results[0].geometry.location.lat;
										tmpLng = data.results[0].geometry.location.lng;
										addsMarker(tmpLat, tmpLng, jsonData.name);
									}
									, "json"
							);//get 
				}
				function s() {
					let a=$("#pfind").val();
					search(a,LAT, LNG);
				}
				</script>
				
				<table class="table mt-3" id="showdetail">
				</table>
				</div>
				<div class="row" align="center">
					<aside class="col-lg-5 order-lg-1">
						<h4><strong>상세 정보</strong></h4>
						<table class="table mt-3" id="searchResult">
<!-- 							<tbody id="searchResult"> -->
<!-- 							</tbody> -->
						</table>
						<input type='text' id="pfind"></input>
						<button onclick='s()'>검색</button>
						<button id="find">돌아가기</button>
					</aside>
					<div class="col-lg-7 order-lg-2 ml-xl-auto">
						<div id="map" style="width: 100%; height: 35vw; position: relative;"></div>
						<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
						<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdVvlvhCfWqhyXdEZe_UkMj0baIUDOvLs&callback=initMap&libraries=places"></script>
						
						<script>
							var multi = {lat: 37.5665734, lng: 126.978179};
							var map;
							var now;
							var service;
							var infowindow;
							let str2;
							function initMap() {
								map = new google.maps.Map(document.getElementById('map'), {
									center: now, zoom: 15
								});
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
								});
								marker.setMap(map);
								setnow(tmpLat, tmpLng);
								map.setCenter({lat: parseFloat(tmpLat), lng: parseFloat(tmpLng)});
								map.setZoom(15);
							}
							function addsMarker(tmpLat, tmpLng, aptName) {
								var marker = new google.maps.Marker({
									position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
									label: aptName,
									title: aptName
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
							function search(temp) {
								initMap();
								addMarker(LAT, LNG, AN);
								var n=now;
								  var request = {
										location: n,
									    radius: '20',
									    query: temp
								 };
								  service = new google.maps.places.PlacesService(map);
								  service.textSearch(request, callback);
								  str2="<tr class='text-center'><td>"+temp+"</td>";
							}
							function setnow(tlat,tlng) {
								now= {lat: parseFloat(tlat), lng: parseFloat(tlng)};
							}

							function callback(results, status) {
							  if (status == google.maps.places.PlacesServiceStatus.OK) {
								  str2+="<td>"+results.length+"개</td></tr>";
								 $("#searchResult").append(str2);
							    for (var i = 0; i < results.length; i++) {
							      var place = results[i];
							      geocode(place);
									
							    }
							  }
							}

						</script>
						</div>
	            	</div>
				</div>
		</section>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
