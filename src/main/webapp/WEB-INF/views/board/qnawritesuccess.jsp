<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>QnA 글작성 성공</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" align="center">
	
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
	
	<div class="col-lg-6">
	  <div class="jumbotron">
	    <h1>글작성 성공!!!</h1>      
	  </div>  
	  <p><a href="${root}/board/qnalist?pg=1&key=&word=">글목록</a></p>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
</c:if>