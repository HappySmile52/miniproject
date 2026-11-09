<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/email_search.css?v=2">
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
	<!-- 이메일 찾기 -->
	<section class="sub">
		<div>
			<ul>
				<li>이메일 찾기</li>
				<li onclick="location.href='./passwd_search.do'" style="cursor:pointer;">비밀번호 찾기</li>
			</ul>
		</div>
		<div class="text1">
			<div><input type="text" placeholder="이름을 입력하세요"></div>
			<div><input type="text" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요" maxlength="11"></div>
		</div>
		<div><input type="button" value="이메일 찾기"></div>
	</section>
	<!-- 이메일 찾기 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>