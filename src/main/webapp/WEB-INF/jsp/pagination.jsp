<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 分页信息 -->
<div class="row">
	<div class="col-md-3 page-number">
		每次显示 <select class="form-control input-mini"
			onchange="self.location.href=options[selectedIndex].value">
			<option value="?pageNum=1&pageSize=10&${searchParams}"
				<c:if test="${page.pageSize eq '10' }">selected</c:if>>10</option>
			<option value="?pageNum=1&pageSize=50&${searchParams}"
				<c:if test="${page.pageSize eq '50' }">selected</c:if>>50</option>
			<option value="?pageNum=1&pageSize=100&${searchParams}"
				<c:if test="${page.pageSize eq '100' }">selected</c:if>>100</option>

		</select> 条
	</div>

	<div class="col-md-9 paging">
		<ul class="pagination">
			<li><a href="#">共 ${page.totlePages} 页，${page.totleElements}
					条</a></li>
			<c:if test="${page.hasPrevious == false}">
				<li class="disabled"><a href="#">首页</a></li>
				<li class="disabled"><a href="#">上一页</a></li>
			</c:if>
			<c:if test="${page.hasPrevious == true}">
				<li><a
					href="?pageNum=1&pageSize=${page.pageSize}&${searchParams}">首页</a></li>
				<li><a
					href="?pageNum=${page.prePage}&pageSize=${page.pageSize}&${searchParams}">上一页</a></li>
			</c:if>

			<c:forEach var="i" begin="${page.begin}" end="${page.end}">
				<c:choose>
					<c:when test="${i == page.pageNum}">
						<li class="active"><a
							href="?pageNum=${i}&pageSize=${page.pageSize}&${searchParams}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="?pageNum=${i}&pageSize=${page.pageSize}&${searchParams}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.hasNext == true}">
				<li><a
					href="?pageNum=${page.nextPage}&pageSize=${page.pageSize}&${searchParams}">下一页</a></li>
				<li><a
					href="?pageNum=${page.totlePages}&pageSize=${page.pageSize}&${searchParams}">末页</a></li>
			</c:if>
			<c:if test="${page.hasNext == false}">
				<li class="disabled"><a href="#">下一页</a></li>
				<li class="disabled"><a href="#">末页</a></li>
			</c:if>

		</ul>

	</div>
</div>
<!-- 分页信息结束 -->
