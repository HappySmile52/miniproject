<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Date today = new Date();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이메일 찾기</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
	<link rel="stylesheet" type="text/css" href="./css/search_myinfo.css?v=2">
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
	<!-- 이메일 찾기 결과 -->
	<section class="sub">
		<div>
			<ul>
				<li>회원가입된 이메일 확인</li>
			</ul>
		</div>
		<div class="text1">
			<cr:choose>
				<cr:when test="${empty requestScope.memail}">
					<div>가입하신 정보는 확인되지 않습니다.</div>
				</cr:when>
				<cr:otherwise>
					<div>가입하신 이메일 정보 : ${requestScope.memail}</div>
				</cr:otherwise>
			</cr:choose>
		</div>
		<div><input type="button" value="정보확인" class="search_submit" onclick="location.href='./login.do'"></div>
	</section>
	<!-- 이메일 찾기 결과 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>