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
						<a>
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