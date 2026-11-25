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
	<link rel="stylesheet" type="text/css" href="./css/md_board.css?v=5">
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
	<!-- 게시판 리스트 -->
	<section class="sub">
		<p>추천분양 정보 게시판</p>
		<div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
		<div class="info_board">
			<ul>
				<li>NO</li>
				<li>제목</li>
				<li>글쓴이</li>
				<li>조회수</li>
				<li>등록일</li>
			</ul>
			<cr:choose>
				<cr:when test="${empty mdList}">
					<ul style="display: block;"><li class="nodata">등록된 게시물이 없습니다.</li></ul>
				</cr:when>
				<cr:otherwise>
					<cr:forEach var="mdata" items="${mdList}" varStatus="idx">
						<ul class="data_view">
							<li>${total - start - idx.index}</li>
							<li style="text-align: left; cursor: pointer;" onclick="location.href='./md_board_view.do?midx=${mdata.midx}'">${mdata.md_title}</li>
							<li>${mdata.md_writer}</li>
							<li>${mdata.md_view}</li>
							<li>${mdata.md_date}</li>
						</ul>
					</cr:forEach>
				</cr:otherwise>
			</cr:choose>
		</div>
		
		<!-- 페이징 -->
		<div class="info_pageing">
			<ol>
				<cr:forEach var="p" begin="1" end="${total_page}">
					<cr:url var="purl" value="./md_board.do">
						<cr:param name="page" value="${p}"/>
						<cr:param name="search" value="${search}"/>
					</cr:url>
					<li onclick="location.href='${purl}'" style="cursor: pointer; ${p == page ? 'font-weight: bold; color: #1d1d1d;' : ''}">${p}</li>
				</cr:forEach>
			</ol>
		</div>
		
		<!-- 검색 -->
		<form id="sfrm" method="get" action="./md_board.do">
			<div class="info_search">
				<input type="text" name="search" class="search_text" placeholder="검색어를 입력하세요" value="${search}">
				<input type="submit" value="검색" class="search_btn">
				<cr:if test="${not empty sessionScope.memail}">
					<input type="button" value="글쓰기" class="search_btn" onclick="location.href='./md_board_write.do'">
				</cr:if>
			</div>
		</form>
	</section>
	<!-- 게시판 리스트 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
</html>