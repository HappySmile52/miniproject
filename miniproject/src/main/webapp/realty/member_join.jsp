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
	<link rel="stylesheet" type="text/css" href="./css/index.css?v=<%=today%>">
	<link rel="stylesheet" type="text/css" href="./css/member_join.css?v=<%=today%>">
<style>
.box {
	width: 800px;
	height: 300px;
	border: 1px solid black;
	overflow: auto;
}
</style>
<title>회원가입</title>
</head>
<body>
<!-- 상단 -->
<%@ include file="./top.jsp" %>
<!-- 상단 -->
<main>
<!-- 회원가입 -->
<form id="f" method="post" action="./member_joinok.do">
	<p>이메일로 회원가입</p>
	<div>
		<a>이메일</a> <input type="text" name="memail" placeholder=" 이메일 주소를 입력해주세요." autocomplete="none" style="width:400px; float:left;"> <button type="button" name="memail_ch" class="mail_btn" onclick="emch()">중복체크</button>
	</div>
	<div>
		<a>비밀번호</a> <input type="password" name="mpass" maxlength="16" placeholder=" 10~16자(영문,숫자,특수 문자 조합)로 입력해주세요." autocomplete="none">
	</div>
	<div>
		<a>비밀번호 확인</a> <input type="password" name="mpass2" placeholder=" 비밀번호를 다시 한 번 입력해주세요." autocomplete="none">
	</div>
	<div>
		<a>이름</a> <input type="text" name="mname" placeholder=" 이름을 입력해주세요." autocomplete="none">
	</div>
	<div>
		<a>휴대폰번호</a> <input type="text" name="mtel" maxlength="11" placeholder=" -없이 숫자만 입력해주세요." autocomplete="none">
	</div>
	<div>
		<input type="checkbox" id="all" onclick="all_check(this.checked)"> <span>전체 동의</span>
	</div>
		
	<div class="line"></div>
		
	<div class="bottom">	
		<div class="box1"><input type="checkbox" name="mag1" value="Y" onclick="ag_check()"> <a class="a1">(필수) <span>만 14세 이상입니다.</span></a></div>
		<div class="box2"><input type="checkbox" name="mag2" value="Y" onclick="ag_check()"> <a class="a2">(필수) <span><u>이용약관</u>에 동의</span></a></div>
		<div class="box3"><input type="checkbox" name="mag3" value="Y" onclick="ag_check()"> <a class="a3">(필수) <span><u>개인정보 수집 및 이용</u>에 동의</span></a></div>
		<section class="text1" id="ag1">   </section>
		<div class="box4"><input type="checkbox" name="mag4" value="Y" onclick="ag_check()"> <span>(선택) 마케팅 수신에 동의</span></div>
		<section class="text2" id="ag2">   </section>
	</div>
	<div><input type="button" value="가입 하기" onclick="mem_join()"></div>
</form>
<!-- 회원가입 -->
</main>
<!-- 카피라이터 -->
<%@ include file="./copyright.jsp" %>
<!-- 카피라이터 -->
</body>
<script src="./js/member_join.js?v=<%=today%>"></script>
</html>