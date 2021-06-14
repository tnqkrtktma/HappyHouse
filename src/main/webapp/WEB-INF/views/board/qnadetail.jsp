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
<title>HappyHouse</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
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

		<div class="col-lg-10" align="center">

			<table class="table table-bordered text-center">
				<tr>
					<th>글번호</th>
					<td>${article.articleno}</td>
					<th>작성자</th>
					<td>${article.userid}</td>
					<th>작성일</th>
					<td>${article.regtime}</td>
				</tr>
				<tr>
					<th colspan="2">제목</th>
					<td colspan="4">${article.subject}</td>
				</tr>
				<tr>
					<td colspan="6">${article.content}</td>
				</tr>
				<tr bgcolor="F0E8DB">
					<th colspan="2">답변</th>
					<td colspan="4"><c:if test="${article.answertag == 'NO'}">
							아직 답변이 등록되지 않았습니다.
						</c:if> <c:if test="${article.answertag == 'YES'}">
							${article.answer}
						</c:if></td>
				</tr>
			</table>


			<tr>
				<td><a href="${root}/board/qnalist?pg=1&key=&word=" class="btn btn-primary" role="button">목록</a></td>
				<td colspan="2">
					<c:if test="${userinfo.userid == article.userid}">
						<a href="${root}/board/qnamodify?articleno=${article.articleno}" class="btn btn-warning" role="button">수정</a>
						<a href="${root}/board/qnadelete?articleno=${article.articleno}" class="btn btn-danger" role="button">삭제</a>
					</c:if>
					<c:if test="${userinfo.userid == 'admin'}">
						<a href="${root}/board/qnadelete?articleno=${article.articleno}" class="btn btn-danger" role="button">삭제</a>
						<a href="${root}/board/qnaanswer?articleno=${article.articleno}" class="btn btn-warning" role="button">답변관리</a>
					</c:if>
				</td>
			</tr>


		</div>
		<hr>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
	</html>
</c:if>


