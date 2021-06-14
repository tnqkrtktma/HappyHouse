<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
$(document).ready(function() {
	$("#loginBtn").click(function() {
		
		if($("#userid").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#userpwd").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			$("#loginform").attr("action", "${root}/user/login").submit();
		}
	});
	 
	$('#mvRegisterBtn').focusin(function() {
		$(location).attr("href", "${root}/");
	});
});
</script>
</head>
<body>
<c:if test="${userinfo == null}">
<h3>${msg}</h3>
			
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="loginform" method="post" action="post">
			<input type="hidden" name="action" id="action" value="login">
				<div class="form-group" align="left">
					<label for="">아이디</label>
					<input type="text" class="form-control" id="userid" name="userid" placeholder="" >
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label>
					<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder=""  onkeydown="javascript:if(event.keyCode == 13) {login();}">
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-warning" id="loginBtn" >로그인</button>
					<button type="button" class="btn btn-primary" onclick="location.href='${root}/user/join'">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</c:if>
<c:if test="${userinfo != null}">
			<div>
				<strong>이미 로그인 되었습니다.</strong>
			</div>
</c:if>