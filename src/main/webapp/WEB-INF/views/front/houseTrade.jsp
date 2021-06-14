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
					<h1 class="text-uppercase text-white font-weight-bold">주택 매매 정보</h1>
					<hr class="divider my-4" />
				</div>
			</div>
		</div>
	</header>
		
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">
				<script>
				let colorArr = ['table-primary','table-success','table-danger'];
				$(document).ready(function(){
					$.get("/happyhouse/map/sido"
						,function(data){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
							});//each
						}//function
						, "json"
					);//get
				});//ready 
				$(document).ready(function(){
					$("#sido").change(function() {
						$.get("${pageContext.request.contextPath}/map/gugun"
								,{act:"gugun", sido:$("#sido").val()}
								,function(data, status){
									$("#gugun").empty();
									$("#gugun").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#gugun").change(function() {
						$.get("${pageContext.request.contextPath}/map/dong"
								,{act:"dong", gugun:$("#gugun").val()}
								,function(data, status){
									$("#dong").empty();
									$("#dong").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#dong").change(function() {
						$.get("${pageContext.request.contextPath}/map/houseTrade"
								,{action:"search", dong:$("#dong").val(), type:3}
								,function(data, status){
									$("#searchResult").empty();
									$("#searchResult").append(
// 											"<caption style='caption-side: top; text-align: center; font-size:1.4em;'><strong>" + AptName + "</strong></caption>" +
											"<tr class='text-center'><th>주택명</th><th>매매가(만원)</th><th>면적(㎡)</th><th>거래일자</th><th>상세보기</th></tr>"
											);
									console.log(data);
									$.each(data, function(index, vo) {
										console.log(vo.aptName);
										let str = "<tr class="+colorArr[index%3]+">"
											+ "<td class='text-center'>" + vo.aptName + "</td>" // 아파트이름
											+ "<td class='text-center'>" + vo.dealAmount + "</td>"	// 금액
											+ "<td class='text-center'>" + vo.area + "</td>"	// 면적
											+ "<td class='text-center'>" + vo.dealYear +"."+vo.dealMonth + "." + vo.dealDay + "</td>"	// 거래일자
											+ "<td  class='text-center'><button onclick='detail("+vo.no+")'>상세보기</button></td>"
											+ "</tr>";
											$("#searchResult").append(str);
										});//each
									$("#searchResult").append("</tbody>");
									geocode(data);
								}//function
								, "json"
						);//get
					});//change
					$("#find").click(function() {
						$.get("${pageContext.request.contextPath}/map/houseTradefind"
								,{sido:$("#sido").val(),gugun:$("#gugun").val(), dong:$("#dong").val(),name:$("#name").val(),type:3}
								,function(data, status){
									$("#searchResult").empty();
									$("#searchResult").append(
// 											"<caption style='caption-side: top; text-align: center; font-size:1.4em;'><strong>" + AptName + "</strong></caption>" +
											"<tr class='text-center'><th>주택명</th><th>매매가(만원)</th><th>면적(㎡)</th><th>거래일자</th><th>상세보기</th></tr>"
											);
									console.log(data);
									$.each(data, function(index, vo) {
										console.log(vo.aptName);
										let str = "<tr class="+colorArr[index%3]+">"
											+ "<td class='text-center'>" + vo.aptName + "</td>" // 아파트이름
											+ "<td class='text-center'>" + vo.dealAmount + "</td>"	// 금액
											+ "<td class='text-center'>" + vo.area + "</td>"	// 면적
											+ "<td class='text-center'>" + vo.dealYear +"."+vo.dealMonth + "." + vo.dealDay + "</td>"	// 거래일자
											+ "<td  class='text-center'><button onclick='detail("+vo.no+")'>상세보기</button></td>"
											+ "</tr>";
											$("#searchResult").append(str);
										});//each
									$("#searchResult").append("</tbody>");
									geocode(data);
								}//function
								, "json"
						);//get
					});
				});//ready
				function detail(no)
				{
					location.href="http://localhost:8000/happyhouse/article/detail?sido="+$('#sido').val()+"&gugun="+$('#gugun').val()
						+"&dong="+$('#dong').val()+"&name="+$('#name').val()+"&no="+no+"&type=3";
				}
				function geocode(jsonData) {
					let idx = 0;
					initMap();
					$.each(jsonData, function(index, vo) {
						addMarker(vo.lat, vo.lng, vo.aptName);
						if(vo.lat==null)
						{
							let tmpLat;
							let tmpLng;
							$.get("https://maps.googleapis.com/maps/api/geocode/json"
									,{	key:'AIzaSyCQ50lq7QoA_El3Q2m2DHQ9llg2s4MyhS4'
										, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
									}
									, function(data, status) {
										tmpLat = data.results[0].geometry.location.lat;
										tmpLng = data.results[0].geometry.location.lng;
										addMarker(tmpLat, tmpLng, vo.aptName);
									}
									, "json"
							);//get 
						}
					});//each
				}
				
				</script>
				<div class="text-center mb-5 d-flex justify-content-center">
				<select id="sido">
					<option value="0">시/도</option>
					<option value="11000">서울특별시</option>
					<option value="26000">부산광역시</option>
					<option value="27000">대구광역시</option>
					<option value="28000">인천광역시</option>
					<option value="29000">광주광역시</option>
					<option value="30000">대전광역시</option>
					<option value="31000">울산광역시</option>
					<option value="36110">세종특별자치시</option>
					<option value="41000">경기도</option>
					<option value="42000">강원도</option>
					<option value="43000">충청북도</option>
					<option value="44000">충청남도</option>
					<option value="45000">전라북도</option>
					<option value="46000">전라남도</option>
					<option value="47000">경상북도</option>
					<option value="48000">경상남도</option>
					<option value="50000">제주특별자치도</option>
				</select>
				<select id="gugun">
					<option value="0">구/군</option>
				</select>
				<select id="dong">
					<option value="0">읍/면/동</option>
				</select>
				<input type="text" id="name">
				<button id="find">검색</button>
				</div>
				<div class="row" align="center">
					<aside class="col-lg-5 order-lg-1">
						<h4><strong>주택 매매 정보</strong></h4>
						<table class="table mt-3" id="searchResult">
<!-- 							<tbody id="searchResult"> -->
<!-- 							</tbody> -->
						</table>
					</aside>
					<div class="col-lg-7 order-lg-2 ml-xl-auto">
						<div id="map" style="width: 100%; height: 35vw; position: relative;"></div>
						<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
						<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQ50lq7QoA_El3Q2m2DHQ9llg2s4MyhS4&callback=initMap"></script>
						<script>
							var multi = {lat: 37.5665734, lng: 126.978179};
							var map;
							function initMap() {
								map = new google.maps.Map(document.getElementById('map'), {
									center: multi, zoom: 12
								});
							}
							function addMarker(tmpLat, tmpLng, aptName) {
								var marker = new google.maps.Marker({
									position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
									label: aptName,
									title: aptName
								});
								marker.addListener('click', function() {
									callHouseDealInfo(aptName);
									map.setZoom(17);
									map.setCenter(marker.getPosition());
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
							
						</script>
						</div>
	            	</div>
				</div>
			</div>
		</section>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
