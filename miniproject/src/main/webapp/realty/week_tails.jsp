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
	<title>분양정보</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=<%=today%>">
	<link rel="stylesheet" type="text/css" href="./css/week_tails.css?v=<%=today%>">
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
	<!-- 매물 상세 -->
	<div class="weektails">
		<p>분양정보</p>
		<div id="weektails">
			<p>${tdata.b_title}</p>
			<ul>
				<li>종류</li>
				<li>${tdata.b_part} | ${tdata.b_info}</li>
				<li>주소</li>
				<li>${tdata.b_add}</li>
				<li>규모</li>
				<li>총 ${tdata.b_house}세대 | 총 ${tdata.b_building}개동</li>
				<li>시기</li>
				<li>${tdata.b_date} | ${tdata.b_date2}</li>
				<li>난방구조</li>
				<li>${tdata.b_str}</li>
				<li>건설사</li>
				<li>${tdata.b_company}</li>
				<li>사진정보</li>
				<li><img src="${tdata.b_img}"></li>
			</ul>
		</div>
		<cr:choose>
			<cr:when test="${reserved > 0}">
				<div><button class="btn_close" onclick="location.href='./reservation_check.do?bidx=${tdata.bidx}'">방문예약완료</button></div>
			</cr:when>
			<cr:otherwise>
				<div><button class="btn_css" onclick="location.href='./reservation.do?bidx=${tdata.bidx}'">방문예약</button></div>
			</cr:otherwise>
		</cr:choose>
	</div>
	<!-- 매물 상세 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>