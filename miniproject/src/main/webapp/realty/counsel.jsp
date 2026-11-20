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
<title>상담신청</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
	<link rel="stylesheet" type="text/css" href="./css/counsel.css?v=3">
</head>
<body>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
<!-- 상담신청 -->
<form id="frm" method="post" action="./counselok.do">
	<section class="sub">
		<p>상담신청</p>
		<div>
			<span class="list_title">◎ <span style="color: blue;">상담자 정보</span></span>
			<ul class="sub_ul">
				<li>상담자명</li>    
				<li><input type="text" class="sel_input" value="${sessionScope.mname}" readonly></li>
				<li>이메일</li>    
				<li><input type="text" class="sel_input" value="${sessionScope.memail}" readonly></li>
				<li>연락처</li>    
				<li><input type="text" class="sel_input" value="${sessionScope.mtel}" readonly></li>
				<li>임대형태</li>    
				<li>
					<label><input type="checkbox" name="crent" value="공공임대" class="sel_check"> 공공임대</label>
					<label><input type="checkbox" name="crent" value="민간임대" class="sel_check"> 민간임대</label>
					<label><input type="checkbox" name="crent" value="민간분양" class="sel_check"> 민간분양</label>
					<label><input type="checkbox" name="crent" value="기타" class="sel_check"> 기타</label>
				</li>   
				<li>주거형태</li>    
				<li>
					<label><input type="checkbox" name="chouse" value="아파트" class="sel_check"> 아파트</label>
					<label><input type="checkbox" name="chouse" value="빌라,단독주택" class="sel_check"> 빌라,단독주택</label>
					<label><input type="checkbox" name="chouse" value="사무실,상가,빌딩" class="sel_check"> 사무실.상가.빌딩</label>
				</li>       
				<li>상담일시</li>    
				<li>
					<input type="date" name="cdate" class="sel_input2"> * 해당 일시에 맞춰서 담당자가 연락 드립니다.   
				</li>    
				<li>상담내용</li>    
				<li style="height: 150px !important; line-height: 150px;">
					<textarea name="ccontent" class="sel_input3" placeholder="구체적인 상담내용을 입력해 주세요"></textarea>
				</li>
			</ul>
		</div>
		<div><input type="button" value="상담신청" onclick="counsel_ok()"></div>
	</section>
</form>
<!-- 상담신청 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
<script src="./js/counsel.js?v=<%=today%>"></script>
</html>