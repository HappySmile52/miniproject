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
	<title>모델 하우스 사전 방문예약 확인</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
	<link rel="stylesheet" type="text/css" href="./css/reservation.css?v=4">
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
	<!-- 방문 예약 확인 -->
	<section class="sub">
		<p>모델 하우스 사전 방문예약 확인</p>
		<div>
			<span class="list_title">
				<span style="color: blue;">분양정보</span>
				<span style="color: red;">${tdata.b_title}</span>
			</span>
			<ul class="sub_ul">
				<li>방문일시</li>    
				<li><input type="text" class="sel_input" value="${rdata.rdate}" disabled></li>
				<li>방문시간</li>    
				<li>
					<input class="sel_input2" value="${rdata.rtime}" disabled> * 해당 시간에 맞춰서 방문해 주셔야 합니다.
				</li> 
				<li>방문자명</li>    
				<li><input type="text" class="sel_input" value="${rdata.rname}" disabled></li>
				<li>방문인원</li>    
				<li>${rdata.rcount}명 ※ 방문인원은 최대 2명까지 입니다.</li> 
				<li>연락처</li>    
				<li><input type="text" class="sel_input" value="${rdata.rtel}" disabled></li>      
			</ul>
		</div>
		<div>
			<input type="button" value="메인페이지로 이동" onclick="location.href='./index.do'">
		</div>
	</section>
	<!-- 방문 예약 확인 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>