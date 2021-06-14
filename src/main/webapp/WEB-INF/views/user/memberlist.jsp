<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<c:redirect url="/" />
</c:if>
<c:if test="${userinfo != null}">
	<!DOCTYPE html>
	<html lang="ko">
<head>
<title>SSAFY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchBtn").click(function() {
			$("#searchform").attr("action", "${root}/user/memberlistsearch").submit();
		});
	});
</script>
<body>
<%@ include file="/WEB-INF/views/title.jsp"%>
<!-- Masthead-->
	<header class="masthead" style="height: 30">
		<div class="container h-30">
			<div class="row h-30 align-items-center justify-content-center text-center">
				<div class="col-lg-10">
					<h1 class="text-uppercase text-white font-weight-bold">회원목록</h1>
					<hr class="divider my-4" />
				</div>
			</div>
		</div>
	</header>
	<div class="container" align="center">
		<hr>
		<div class="container text-center mt-4">
			<div class="container text-center" style="margin: 20px 20px">
				<form class="form-inline" id='searchform'>
					<input type="text" class="form-control" placeholder="아이디검색" id="searchid" name='searchid' value='${searchid}'> <a href='#' class="btn btn-primary" id='searchBtn'>검색</a>
				</form>
			</div>
			<table class="table table-hover">
				<colgroup>
					<col width="120">
					<col width="120">
					<col width="120">
					<col width="120">
					<col width="130">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">아이디</th>
						<th class="text-center">이름</th>
						<th class="text-center">이메일</th>
						<th class="text-center">주소</th>
						<th class="text-center">번호</th>
					</tr>
				</thead>
				<tbody id="coronalist">
					<c:if test="${memberlist.size() != 0}">
						<c:forEach var="member" items="${memberlist}">
							<tr>
								<td class="text-center">${member.userid}</td>
								<td class="text-center">${member.username}</td>
								<td class="text-center">${member.email}</td>
								<td class="text-center">${member.address}</td>
								<td class="text-center">${member.tel}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<hr>
	</div>


	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
	</html>
</c:if>