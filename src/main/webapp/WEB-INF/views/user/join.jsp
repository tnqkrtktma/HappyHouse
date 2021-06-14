<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>회원가입페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">

  
  $(document).ready(function() {
		$("#joinBtn").click(function() {
			
			if($("#userid").val() == "") {
				alert("아이디 입력!!!");
				return;
			} else if($("#userpwd").val() == "") {
				alert("비밀번호 입력!!!");
				return;
			} else if($("#email").val() == "") {
				alert("이메일 입력!!!");
				return;
			}else {
				$("#insertform").attr("action", "${root}/user/join").submit();
			}
		});
	});
  </script>
</head>
<body>
<%@ include file="/WEB-INF/views/title.jsp"%>
<!-- Masthead-->
	<header class="masthead" style="height: 30">
		<div class="container h-30">
			<div class="row h-30 align-items-center justify-content-center text-center">
				<div class="col-lg-10">
					<h1 class="text-uppercase text-white font-weight-bold">회원가입</h1>
					<hr class="divider my-4" />
				</div>
			</div>
		</div>
	</header>
<div class="container my-4" align="center">
	<hr>
	<div class="col-lg-6">
		<form id="insertform" method="post" action="post">
		<input type="hidden" name="action" id="action" value="insertuser">
			<div class="form-group" align="left">
				<label for="type">아이디:</label>
				<input type="text" class="form-control" id="userid" name="userid">
			</div>
			<div class="form-group" align="left">
				<label for="type">비밀번호:</label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" >
			</div>
			<div class="form-group" align="left">
				<label for="type">비밀번호 확인:</label>
				<input type="password" class="form-control" id="userpwdc" name="userpwdc">
			</div>
			<div class="form-group" align="left">
				<label for="type">비밀번호 찾기 질문:</label>
				<select class="form-control" id="pwdqes" name="pwdqes">
				<option>졸업한 고등학교 이름은?</option>
				<option>가장 좋아하는 음식은?</option>
				<option>첫사랑 이름은?</option>
				<option>기타</option>
				</select>
			</div>
			<div class="form-group" align="left">
				<label for="type">비밀번호 찾기 답:</label>
				<input type="text" class="form-control" id="pwdans" name="pwdans">
			</div>
			<div class="form-group" align="left">
				<label for="type">이름:</label>
				<input type="text" class="form-control" id="username" name="username">
			</div>
			<div class="form-group" align="left">
				<label for="desc">이메일:</label>
				<input type="email" class="form-control" id="email" name="email">
			</div>
			<div class="form-group" align="left">
				<label for="type">주소:</label>
				<input type="text" class="form-control" id="address" name="address">
			</div>
			<div class="form-group" align="left">
				<label for="type">전화번호:</label>
				<input type="tel" class="form-control" id="tel" name="tel">
			</div>
			<button type="button" class="btn btn-primary" id="joinBtn">회원 등록</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</form>
	</div>
	<hr>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>