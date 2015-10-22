<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
<meta charset="utf-8">
<title>孤思八九</title>
<meta name="Keywords" content="">
<meta name="Description" content="">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<!--[if IE 6]>
 <script  src="js/png.js"></script>
 <script type="text/javascript">
    EvPNG.fix('.lace_hd_ft,.emails,.rssdy,.fav');
 </script>
<![endif]-->
<link href="${ctxResource }/index/css/index.css" rel="stylesheet"
	type="text/css">
<link
	href="${ctxResource }/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${ctxResource }/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
</head>
<body>
	<!-- 	<div class="blank"></div> -->
	<div id="nav">
		<ul>
			<c:forEach items="${categoryList }" var="category">
				<c:if test="${category.parentCategory.name eq '博客文章' }">
					<li><a href="${category.href }" target="${category.target }">${category.name }</a></li>
					<br>
				</c:if>
			</c:forEach>
		</ul>
		<!--获取当前页导航 高亮显示标题-->
	</div>

	<div class="article">
		<div class="title">${article.title }</div>
		<div class="attach-info">
			<p style="float: left;">
				本文永久连接：<a href="#">${article.link }</a>
			</p>
			<p style="float: right;">
				<span>发表时间：<fmt:formatDate value="${article.createDate }" pattern="yyyy-MM-dd"/></span><span style="margin-left: 30px;">点击数量：${article.hits }</span>
			</p>
			<br>
		</div>
		<div class="content" style="min-height: 500px;">${article.content }</div>
		<div class="relation-info">
			<div class="blank"></div>
			<div>
				<span style="float: left;">上一篇：<c:choose>
						<c:when test="${prevArticle eq null }">没有上一篇啦哦！</c:when>
						<c:otherwise>
							<a href="${prevArticle.link }">${prevArticle.title }</a>
						</c:otherwise>
					</c:choose></span><span style="float: right;">下一篇：<c:choose>
						<c:when test="${nextArticle eq null }">没有下一篇啦哦！</c:when>
						<c:otherwise>
							<a href="${nextArticle.link }">${nextArticle.title }</a>
						</c:otherwise>
					</c:choose></span><br>
			</div>
			<div>
				相关文章推荐：
				<c:forEach items="${relationArticles }" var="relation">
					<span style="margin-right: 50px;"><a
						href="${relation.link }">${relation.title }</a></span>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>

