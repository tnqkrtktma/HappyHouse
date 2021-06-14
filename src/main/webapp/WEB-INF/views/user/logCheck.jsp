<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ssafy.happyhouse.model.dto.MemberDto"%>
<%
String root = request.getContextPath();
MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
if(memberDto == null){  %>
	<jsp:forward page="login.jsp">
		<jsp:param value="인증이 필요한 페이지 입니다. 로그인 후에 사용해 주세요" name="msg"/>
	</jsp:forward>
<%}else{%>
	<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<%=memberDto.getUsername()%>님 로그인중  <a href="<%= root %>/main.do?action=logout">로그아웃</a>
	</div>
</div>	
<%} %>
