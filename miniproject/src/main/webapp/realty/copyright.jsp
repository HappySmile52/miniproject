<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
	<div class="copyright">
		<ol>
			<li>
				<img src="./logo/e_click_logo.png" class="logos">
			</li>
			<li>
				<ul>
					<li>회사소개</li>
					<li>이용약관</li>
					<li>위치기반서비스 약관</li>
					<li>제휴문의</li>
					<li>개인정보처리방침</li>
					<li>신고센터</li>
				</ul>
			</li>
			<li>
				<ul>
					<li>저작권규약</li>
					<li>책임한계 및 법적고지</li>
					<li>이메일 무단수집거부</li>
					<li>고객센터문의</li>
					<li></li>
					<li></li>
				</ul>
			</li>
			<li>
				<ul>
					<li>${copyright.web_company} | 대표 : ${copyright.web_ceo}</li>
					<li>${copyright.web_add}</li>
					<li>사업자번호 : ${copyright.web_num} | 통신판매업 : ${copyright.web_sales}</li>
					<li>정보보호책임자 : ${copyright.web_inc}</li>
					<li>영업문의 : ${copyright.web_tel}</li>
					<li>팩스번호 : ${copyright.web_fax}</li>
				</ul>
			</li>
		</ol>
	</div>
</footer>