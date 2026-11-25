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
	<script src="./ckeditor/ckeditor.js"></script>
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
	<!-- 게시판 글쓰기 -->
	<form id="frm" method="post" action="./md_board_writeok.do" enctype="multipart/form-data">
		<section class="sub">
			<p>추천분양 정보 게시판</p>
			<div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
			<div class="info_board">
				<ul>
					<li>제&nbsp;&nbsp;&nbsp;목</li>
					<li><input type="text" name="md_title" class="board_in2" maxlength="100"></li>
					<li>글쓴이</li>
					<li><input type="text" class="board_in1" value="관리자" readonly></li>
					<li>썸네일 이미지</li>
					<li><input type="file" name="mfile" accept="image/*"></li>
					<li class="litext">내&nbsp;&nbsp;&nbsp;용</li>
					<li class="litext">
						<textarea name="md_content" id="board_text"></textarea>
					</li>
				</ul>
			</div>
			<div class="board_btn">
				<input type="button" value="등&nbsp;&nbsp;&nbsp;록" class="btns" onclick="md_write()">
			</div>
		</section>
	</form>
	<!-- 게시판 글쓰기 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
<script src="./js/md_board_write.js?v=<%=today%>"></script>
</html>