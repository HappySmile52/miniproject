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
			<cr:choose>
				<cr:when test="${empty rlist}">
					<ul style="display: block;"><li class="nodata">등록된 방문 예약이 없습니다.</li></ul>
				</cr:when>
				<cr:otherwise>
					<cr:forEach var="rdata" items="${rlist}" varStatus="idx">
						<ul class="data_view">
							<li>${idx.count}</li>
							<li style="text-align: left;">${rdata.b_title}</li>
							<li>${rdata.rdate}</li>
							<li>${rdata.rtime}</li>
							<li>${rdata.rcount}명</li>
							<li><input type="button" value="취소" class="cancel_btn" onclick="reserve_cancel(${rdata.ridx})"></li>
						</ul>
					</cr:forEach>
				</cr:otherwise>
			</cr:choose>
		</div>
	</section>
    <!-- 방문예약 리스트 -->
    
    <!-- 취소 전송용 form -->
    <form id="cancel_frm" method="post" action="./reservation_cancel.do">
    	<input type="hidden" name="ridx">
    </form>
    <!-- 취소 전송용 form -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
<script src="./js/reservation_list.js?v=<%=today%>"></script>
</html>