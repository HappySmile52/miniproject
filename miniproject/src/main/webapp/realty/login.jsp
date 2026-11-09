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
<title>로그인</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
	<link rel="stylesheet" type="text/css" href="./css/login.css?v=2">
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
<!-- 로그인 -->
<form id="frm" method="post" action="./loginok.do">
	<aside class="login_pg">	
		<p>이메일로 시작하기</p>
		<div><input type="text" name="lemail" placeholder="이메일 주소"></div>
		<div><input type="password" name="lpass" placeholder="비밀번호"></div>
		<div><input type="button" value="로그인" onclick="logincheck()"></div>
		<div><input type="button" value="카카오로그인" class="kakao_btn"></div>
		<div>
			<span><label onclick="location.href='./member_join.do'">회원가입</label></span>
			<span><label onclick="location.href='./email_search.do'">이메일 찾기</label></span>
			<span><label onclick="location.href='./passwd_search.do'">비밀번호 찾기</label></span>
		</div>
	</aside>
</form>
<!-- 로그인 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
<script src="./js/login.js?v=<%=today%>"></script>
</html>