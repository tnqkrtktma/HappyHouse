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
	<div class="container" align="center">
		<div class="col-lg-8" align="center">
			<h2>QnA</h2>
			<c:choose>
				<c:when test="${userinfo.userid eq 'admin'}">
					<table class="table table-borderless">
						<tr>
							<td align="right"><button type="button" id="mvWriteBtn" class="btn btn-link">글쓰기</button></td>
						</tr>
					</table>
				</c:when>
			</c:choose>

			<form id="searchform" method="get" class="form-inline" action="">
				<input type="hidden" name="pg" id="pg" value="1">
				<table class="table table-borderless">
					<tr>
						<td align="right"><select class="form-control" name="key" id="skey">
								<option value="userid" selected="selected">아이디</option>
								<option value="articleno">글번호</option>
								<option value="subject">제목</option>
						</select> <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="sword">
							<button type="button" id="searchBtn" class="btn btn-primary">검색</button></td>
					</tr>
				</table>
			</form>

			<c:if test="${articles.size() != 0}">
				<c:forEach var="article" items="${articles}">
					<table class="table table-active">
						<tbody>
							<tr class="table-info">
								<td>작성자 : ${article.userid}</td>
								<td align="right">작성일 : ${article.regtime}</td>
							</tr>
							<tr>
								<td colspan="2" class="table-danger"><strong>${article.articleno}. ${article.subject}</strong></td>
							</tr>
							<tr>
								<td colspan="2">${article.content}</td>
							</tr>
							<tr>
								<td colspan="2" class="table-danger"><strong>답변 여부: ${article.answertag}</strong></td>
							</tr>
							<tr>
								<td colspan="2">${article.answer}</td>
							</tr>
							<tr>
								<c:if test="${userinfo.userid == article.userid}">
									<tr>
										<td colspan="2"><a href="${root}/board/qnamodify?articleno=${article.articleno}">수정</a>
										<a href="${root}/board/qnadelete?articleno=${article.articleno}">삭제</a></td>
									</tr>
								</c:if>
						</tbody>
					</table>
				</c:forEach>
				<table>
					<tr>
						<td>${navigation.navigator}</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${articles.size() == 0}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>작성된 글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>
