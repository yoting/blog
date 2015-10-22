<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<link href="${ctxResource }/index/css/header.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="${ctxResource }/index/js/header.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var loginhtml;
		// 		var validation = function() {
		// 			//验证写在这
		// 			alert(2);
		// 			$('#logo').on('click', function() {
		// 				alert(1);
		// 				return false; //此处只作演示
		// 			});
		// 		};
		var page = {};
		layer.login = function(options) {
			options = options || {};
			$.layer({
				type : 1,
				title : '用户登录',
				offset : [ ($(window).height() - 290) / 2 + 'px', '' ],
				border : [ 5, 0.5, '#666' ],
				area : [ '524px', '297px' ],
				shadeClose : true,
				page : page
			});
		};
		$('#logo').on('click', function() {
			//如果已经请求过，则直接读取缓存节点
			if (loginhtml) {
				page.html = loginhtml;
			} else {
				page.url = '${ctxResource}/login/login.html'
				page.ok = function(datas) {
					loginhtml = datas; //保存登录节点
				}
			}
			layer.login();
		});
	});
</script>

<header>
	<a href="#" id="logo"><img src="${logoPic }" alt="" />
		<h2>${webTitle }</h2></a>
	<div id="wrap-menu">
		<ul id="header-menu">
			<c:forEach items="${categoryList }" var="category">
				<c:if test="${category.parentCategory eq null }">
					<li><a href="${category.href }" target="${category.target }">${category.name }</a>
						<c:if test="${category.hasChild eq true }">
							<ul class="second-lvl">
						</c:if> <c:forEach items="${categoryList }" var="subCate">
							<c:if test="${subCate.parentCategory.id eq category.id }">
								<li><a href="${subCate.href }" target="${subCate.target }">${subCate.name }</a></li>
							</c:if>
						</c:forEach> <c:if test="${category.hasChild eq true }">
		</ul>
		</c:if>
		</li>
		</c:if>
		</c:forEach>
		</ul>
	</div>
</header>

