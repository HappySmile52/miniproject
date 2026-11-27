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
	<link rel="stylesheet" type="text/css" href="./css/md_board_view.css?v=6">
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
	<!-- 게시판 상세페이지 -->
	<section class="sub board_view">
		<p>추천분양 정보 게시판</p>
		<div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
		<div class="info_board">
			<ul>
				<li>제&nbsp;&nbsp;&nbsp;목</li>
				<li>${mdata.md_title}</li>
				<li>글쓴이</li>
				<li>${mdata.md_writer}</li>
				<li>등록일</li>
				<li>${mdata.md_date}</li>
				<li>조회수</li>
				<li>${mdata.md_view}</li>
				<li class="litext">내&nbsp;&nbsp;&nbsp;용</li>
				<li class="litext">
					<div class="textarea">
						${empty mdata.md_content ? mdata.md_details : mdata.md_content}
					</div>
				</li>
			</ul>
		</div>
		<div class="board_btn">
			<input type="button" value="목&nbsp;&nbsp;&nbsp;록" class="btns" onclick="location.href='./md_board.do'">
		</div>
	</section>
	<!-- 게시판 상세페이지 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>