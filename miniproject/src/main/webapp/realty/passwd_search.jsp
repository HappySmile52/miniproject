<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
	<link rel="stylesheet" type="text/css" href="./css/passwd_search.css?v=2">
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
	<section class="sub">
		<div>
			<ul>
				<li>이메일 찾기</li>
				<li>비밀번호 찾기</li>
			</ul>
		</div>
		<div class="text1">
			<div><input type="text" placeholder="가입하신 이메일을 입력하세요"></div>
			<div><input type="text" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요"></div>
		</div>
		<div><input type="button" value="비밀번호 찾기"></div>
	</section>
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>