<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<c:if test="${pageInfo.pageSize ne -1 }">
	<c:set var="total" value="${pageInfo.totalPages }"></c:set>
	<c:set var="current" value="${pageInfo.getCurrentPageNo() }"></c:set>
	<%-- 	<c:set var="url" value="${pageInfo.url}"></c:set> --%>
	<ul class="pagination" id="page" style="margin-top: 5px; margin-bottom: 5px;">
		<!-- 上一页 -->
		<c:choose>
			<c:when test="${pageInfo.getCurrentPageNo() == 1 }">
				<li class="disabled"><a
					href="${ctx }/${pageInfo.url}?pageNo=${pageInfo.getPreviousPageNo()}&pageSize=${pageInfo.pageSize}">&laquo;上一页</a></li>
			</c:when>
			<c:otherwise>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${pageInfo.getPreviousPageNo()}&pageSize=${pageInfo.pageSize}">&laquo;上一页</a></li>
			</c:otherwise>
		</c:choose>
		<!-- 1，2，3。。。页码循环 -->
		<c:choose>

			<c:when test="${current <=4 and current+3 <total }">
				<c:forEach begin="1" end="${current }" step="1" varStatus="var">
					<li><a
						href="${ctx }/${pageInfo.url}?pageNo=${var.count }&pageSize=${pageInfo.pageSize}">${var.count }</a></li>
				</c:forEach>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current+1 }&pageSize=${pageInfo.pageSize}">${current+1 }</a></li>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current+2 }&pageSize=${pageInfo.pageSize}">${current+2 }</a></li>
				<li class="disabled"><a href="#">...</a></li>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${total }&pageSize=${pageInfo.pageSize}">${total }</a></li>
			</c:when>

			<c:when test="${current <=4 and current+3 >=total }">
				<c:forEach begin="1" end="${current }" step="1" varStatus="var">
					<li><a
						href="${ctx }/${pageInfo.url}?pageNo=${var.count }&pageSize=${pageInfo.pageSize}">${var.count }</a></li>
				</c:forEach>
				<c:forEach begin="${current+1 }" end="${total }" step="1"
					varStatus="var">
					<li><a
						href="${ctx }/${pageInfo.url}?pageNo=${current+var.count }&pageSize=${pageInfo.pageSize}">${current+var.count }</a></li>
				</c:forEach>
			</c:when>

			<c:when test="${current >4 and current+3 <total }">
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=1&pageSize=${pageInfo.pageSize}">1</a></li>
				<li class="disabled"><a href="#">...</a></li>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current-2 }&pageSize=${pageInfo.pageSize}">${current-2 }</a></li>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current-1 }&pageSize=${pageInfo.pageSize}">${current-1 }</a></li>

				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current }&pageSize=${pageInfo.pageSize}">${current }</a></li>

				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current+1 }&pageSize=${pageInfo.pageSize}">${current+1 }</a></li>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current+2 }&pageSize=${pageInfo.pageSize}">${current+2 }</a></li>
				<li class="disabled"><a href="#">...</a></li>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${total }&pageSize=${pageInfo.pageSize}">${total }</a></li>
			</c:when>

			<c:when test="${current >4 and current+3 >=total }">
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=1&pageSize=${pageInfo.pageSize}">1</a></li>
				<li class="disabled"><a href="#">...</a></li>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current-2 }&pageSize=${pageInfo.pageSize}">${current-2 }</a></li>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current-1 }&pageSize=${pageInfo.pageSize}">${current-1 }</a></li>

				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${current }&pageSize=${pageInfo.pageSize}">${current }</a></li>

				<c:forEach begin="${current+1 }" end="${total }" step="1"
					varStatus="var">
					<li><a
						href="${ctx }/${pageInfo.url}?pageNo=${current+var.count }&pageSize=${pageInfo.pageSize}">${current+var.count }</a></li>
				</c:forEach>
			</c:when>
		</c:choose>
		<!-- 下一页 -->
		<c:choose>
			<c:when test="${pageInfo.getCurrentPageNo() == pageInfo.totalPages }">
				<li class="disabled"><a
					href="${ctx }/${pageInfo.url}?pageNo=${pageInfo.getNextPageNo()}&pageSize=${pageInfo.pageSize}">&raquo;下一页</a></li>
			</c:when>
			<c:otherwise>
				<li><a
					href="${ctx }/${pageInfo.url}?pageNo=${pageInfo.getNextPageNo()}&pageSize=${pageInfo.pageSize}">&raquo;下一页</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</c:if>
<script type="text/javascript">
	$(document).ready(function() {
		var cur = "${current}";
		$("#page a").each(function() {
			if ($(this).text() == cur) {
				$(this).parent().attr("class", "active");
			}
		});

		// 		$("li").click(function() {
		// 			$(this).attr("class", "active");
		// 		});
	});
</script>