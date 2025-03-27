<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
	<div class="recommend">
		<p>추천분양정보<br><em>실시간 추천 분양정보를 한곳에!</em></p>
		<div class="md_estates">
			<ul>
				<cr:forEach var="mdata" items="${mdList}" varStatus="idx">
					<a href=${mdata.md_add} target="_blank">
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