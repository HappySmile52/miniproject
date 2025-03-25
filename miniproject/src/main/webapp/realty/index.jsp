<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>온라인 부동산 중개</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=7">
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
<!-- 배너 -->
<%@ include file="./banner.jsp" %>
<!-- 배너 -->
<!-- 카테고리 -->
<%@ include file="./quickmemu.jsp" %>
<!-- 카테고리 -->
<!--금주 분양 매물 정보 시작-->
<%@ include file="./weekinfo.jsp" %>
<!--금주 분양 매물 정보 시작-->
<!--추천 분양 정보-->
<%@ include file="./mdchoice.jsp" %>
<!--추천 분양 정보-->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>