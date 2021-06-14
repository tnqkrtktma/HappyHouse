<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#mvWriteBtn').focusin(function() {
			$(location).attr("href", "${root}/board/qnawrite");
		});

		$("#searchBtn").click(function() {

			if ($("#sword").val() == "") {
				alert("모든 목록 조회!!");
			}
			$("#searchform").attr("action", "${root}/board/qnalist").submit();
		});

		$(".page-item").click(function() {
			$("#pg").val(($(this).attr("data-pg")));
			$("#pageform").attr("action", "${root}/board/qnalist").submit();
		});

	});
</script>
</head>
<body>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value=""> <input type="hidden" name="key" id="key" value="${key}"> <input type="hidden" name="word" id="word" value="${word}">
	</form>
	<%@ include file="/WEB-INF/views/title.jsp"%>
	
	<!-- Masthead-->
	<header class="masthead" style="height: 30">
		<div class="container h-30">
			<div class="row h-30 align-items-center justify-content-center text-center">
				<div class="col-lg-10">
					<h1 class="text-uppercase text-white font-weight-bold">QnA</h1>
					<hr class="divider my-4" />
				</div>
			</div>
		</div>
	</header>
	
	<div class="container" align="center">
		<hr>
		<div align="center">

			<form id="searchform" method="get" class="form-inline" action="">
				<input type="hidden" name="pg" id="pg" value="1">
				<table class="table table-borderless">
					<tr>
						<c:choose>
							<c:when test="${userinfo != null}">
								<td><button type="button" id="mvWriteBtn" class="btn btn-light">글작성</button></td>
							</c:when>
						</c:choose>
						<td align="right"><select class="form-control" name="key" id="skey">
								<option value="userid" selected="selected">아이디</option>
								<option value="articleno">글번호</option>
								<option value="subject">제목</option>
						</select> <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="sword">
							<button type="button" id="searchBtn" class="btn btn-primary">검색</button></td>
					</tr>
				</table>
			</form>

			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${articles.size() != 0}">
						<c:forEach var="article" items="${articles}">
							<tr onClick="location.href='${root}/board/qnadetail?articleno=${article.articleno}' ">
								<th scope="row">${article.articleno}</th>
								<td>${article.subject}</td>
								<td>${article.userid}</td>
								<td>${article.regtime}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<c:if test="${articles.size() == 0}">
				<table>
					<tbody>
						<tr class="table-info" align="center">
							<td>작성된 글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>

			<table>
				<tr>
					<td>${navigation.navigator}</td>
				</tr>
			</table>
			
			
		</div>
		<hr>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
