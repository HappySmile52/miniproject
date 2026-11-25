<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
	<div class="recommend">
		<p>추천분양정보<br><em>실시간 추천 분양정보를 한곳에!</em>
			<span onclick="location.href='./md_board.do'" style="float:right; font-size:14px; cursor:pointer;">MORE +</span>
		</p>
		<div class="md_estates">
			<ul>
				<cr:forEach var="mdata" items="${mdList}" varStatus="idx">
					<a href="./md_board_view.do?midx=${mdata.midx}">
						<li>
							<div><img src=${mdata.md_imgs}></div>
							<span>${mdata.md_title}</span>
							<div>${mdata.md_details}</div>
						</li>
					</a>
				</cr:forEach>
			</ul>
		</div>
	</div>
</section>