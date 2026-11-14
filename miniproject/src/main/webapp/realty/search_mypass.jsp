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
	<title>패스워드 찾기 및 변경</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
	<link rel="stylesheet" type="text/css" href="./css/search_myinfo.css?v=2">
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
	<!-- 비밀번호 변경 -->
	<form id="frm" method="post" action="./mypass_change.do">
		<section class="sub">
			<div>
				<ul>
					<li>회원가입 정보에 따른 패스워드 변경</li>
				</ul>
			</div>
			<div class="text1 repass">
				<div><input type="password" name="mpass" maxlength="16" placeholder="최소 10 ~ 16자 (영문,숫자,특수 문자 조합)로 입력해주세요." class="passin" autocomplete="none"></div>
				<div><input type="password" name="mpass2" maxlength="16" placeholder="동일한 비밀번호를 입력하세요" class="passin" autocomplete="none"></div>
			</div>
			<div><input type="button" value="비밀번호 변경" class="search_submit" onclick="pass_change()"></div>
		</section>
	</form>
	<!-- 비밀번호 변경 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
<script src="./js/search_mypass.js?v=<%=today%>"></script>
</html>