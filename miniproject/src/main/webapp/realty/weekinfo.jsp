<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
	<div class="weekdays">
		<p>금주분양 매물정보<br><em>이번주 신규 매물정보!</em></p>
		<div class="week_estates">
			<ul>
				<cr:forEach var="tdata" items="${typeList}" varStatus="idx">
					<li>
						<a onclick="week_go(${tdata.bidx})" style="cursor:pointer;">
						  <span>${tdata.b_present}</span>
						  <div>${tdata.b_title}</div>
						  <aside>${tdata.b_add}</aside>
						  <span>${tdata.b_part} | ${tdata.b_info}</span>
						  <label>${tdata.b_date} | ${tdata.b_date2}</label>
						  <div><img src=${tdata.b_img}></div>
						</a>
					</li>
				</cr:forEach>
			</ul>
		</div>
	</div>
</section>
<script>
// 금주분양 매물 클릭 → 로그인 시 상세페이지, 비로그인 시 로그인 화면
var login_ck = "${sessionScope.memail}";

function week_go(bidx){
	if(login_ck == ""){
		alert("로그인 후 이용 가능합니다.");
		location.href = "./login.do";
	}
	else{
		location.href = "./week_tails.do?bidx=" + bidx;
	}
}
</script>