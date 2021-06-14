<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Happy House</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${root}/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
<!-- Third party plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root}/css/styles.css" rel="stylesheet" />
</head>

<style>
header.masthead {
    height: 20vh !important;
    min-height: 15rem !important;
    padding-top: 4.5rem;
    padding-bottom: 0;
}
</style>

<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="${root}/">Happy House</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto my-2 my-lg-0">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 거래 정보 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${root}/article/searchAll">실거래가</a> <a class="dropdown-item" href="${root}/article/aptTrade">아파트 매매</a> <a class="dropdown-item" href="${root}/article/aptRent">아파트 전월세</a> <a class="dropdown-item" href="${root}/article/houseTrade">주택 매매</a> <a class="dropdown-item" href="${root}/article/houseRent">주택 전월세</a>
						</div>
					</li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 게시판 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${root}/board/noticelist?pg=1&key=&word=">공지사항</a>
							<a class="dropdown-item" href="${root}/board/qnalist?pg=1&key=&word=">QnA</a>
						</div>
					</li>
					<c:choose>
						<c:when test="${empty userinfo}">

							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${root}/user/login">로그인</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${root}/user/join">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${root}/user/change?userid=${userinfo.userid}" style="text-decoration: underline;">${userinfo.username}님</a> 
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${root}/user/logout" >로그아웃</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${userinfo.userid eq 'admin'}">
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${root}/user/memberlist?userid=${userinfo.userid}">회원목록</a>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- Masthead-->
	<!-- 
	<header class="masthead" style="height: 30">
		<div class="container h-30">
			<div class="row h-30 align-items-center justify-content-center text-center">
				<div class="col-lg-10">
					<h1 class="text-uppercase text-white font-weight-bold">Your Favorite Source of Free Bootstrap Themes</h1>
					<hr class="divider my-4" />
				</div>
			</div>
		</div>
	</header>
	-->
	
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
	<!-- Core theme JS-->
	<script src="${root}/js/scripts.js"></script>
	<!-- test -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>