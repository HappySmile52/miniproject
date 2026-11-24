<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date today = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
	<link rel="stylesheet" type="text/css" href="./css/reservation_list.css?v=5">
<style>
.box {
	width: 800px;
	height: 300px;
	border: 1px solid black;
	overflow: auto;
}
</style>
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
	<!-- 방문예약 리스트 -->
	<section class="sub">
		<p>모델 하우스 방문 예약 리스트</p>
		<div class="boards">모델 하우스 방문 예약한 정보를 한눈에 확인 하실 수 있습니다.</div>
		<div class="info_board">
			<ul>
				<li>NO</li>
				<li>아파트명</li>
				<li>방문일자</li>
				<li>방문시간</li>
				<li>인원수</li>
				<li>취소</li>
			</ul>
			<ul style="display: block;"><li class="nodata">등록된 방문 예약이 없습니다.</li></ul>
			<ul class="data_view">
				<li>1</li>
				<li style="text-align: left;">LH센터럴힐(공공임대)</li>
				<li>2025-04-02</li>
				<li>11:00</li>
				<li>2명</li>
				<li><input type="button" value="취소" class="cancel_btn"></li>
			</ul>
		</div>
	</section>
    <!-- 방문예약 리스트 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>