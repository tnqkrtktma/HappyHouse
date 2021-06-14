<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />

<header id="index_header" class="jumbotron text-center mb-1">
	<h4>행복한 우리 집</h4>
</header>
<!-- nav start -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark rounded">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		<ul class="navbar-nav mr-auto mt-2 mt-md-0">
			<li class="nav-item"><a class="navbar-brand" href="${root}/">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="${root}/article/searchAll">실거래가</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 거래 정보 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${root}/article/aptTrade">아파트 매매</a>
					<a class="dropdown-item" href="${root}/article/aptRent">아파트 전월세</a>
					<a class="dropdown-item" href="${root}/article/houseTrade">주택 매매</a>
					<a class="dropdown-item" href="${root}/article/houseRent">주택 전월세</a>
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 게시판 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${root}/board/noticelist?pg=1&key=&word=">공지사항</a>
					<a class="dropdown-item" href="${root}/board/qnalist?pg=1&key=&word=">QnA</a>
				</div>
			</li>
		</ul>
		
		
		<ul class="navbar-nav mt-2 mt-md-0">
			<c:choose>
				<c:when test="${empty userinfo}">

					<li class="nav-item"><a class="nav-link" href="${root}/user/login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="${root}/user/join">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><strong class="nav-link" style="text-decoration: underline;">${userinfo.username}</strong>
					<li class="nav-item"><a class="nav-link" href="${root}/user/logout">로그아웃</a>
					<li class="nav-item"><a class="nav-link" href="${root}/user/change?userid=${userinfo.userid}">회원정보 수정</a> <!-- <li class="nav-item"><a class="nav-link" href="${root}/user/memberlist?userid=${userinfo.userid}">회원목록</a>	-->
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${userinfo.userid eq 'admin'}">
					<li class="nav-item"><a class="nav-link" href="${root}/user/memberlist?userid=${userinfo.userid}">회원목록</a>
				</c:when>
			</c:choose>


			<!-- END: -->
		</ul>
	</div>
</nav>