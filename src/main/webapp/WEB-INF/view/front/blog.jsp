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
	</div>

	<div class="article">
		<div class="list-content">
			<div class="topblog">
				<h3>
					<p>推荐文章 New Blog</p>
				</h3>
				<img src="${ctxResource }/index/images/03.jpg" alt="" title=""
					width="315" height="205">
				<ul>
					<c:forEach items="${topBlogList }" var="topBlog">
						<li style="text-align: left; padding-left: 45px;"><a
							href="${topBlog.link }" style="padding: 5px;">${topBlog.title }<span
								style="padding: 5px;">${topBlog.descriptionShort }</span></a>
					</c:forEach>
				</ul>
			</div>
			<div class="bloglist">
				<!--article begin-->
				<c:forEach items="${pageInfo.objList }" var="article">
					<ul>
						<h2>
							<a title="${article.title }"
								href="${ctx }/article/show/${article.id }" target="_blank">${article.title}</a>
						</h2>
						${article.description }
						<figure style="float:left; display:none;"> <img
							src="${article.image}" alt="" width="100px;" height="100px;"></figure>
						<p class="dateview">
							<span>发表时间：<fmt:formatDate value="${article.createDate }"/></span> 
							<span>${article.creater.name }</span>
							<span>分类：<a href="#" target="_self">${article.category.name }</a></span>
							<span>阅读[${article.hits }]</span><span>评论(0)</span>
						</p>
					</ul>
					<div style="clear: none;"></div>
				</c:forEach>
				<div class="page">
					<%@include file="/WEB-INF/view/include/page.jsp"%>
				</div>
				<!--article end-->
			</div>
		</div>

		<c:set var="showWeather" value="true"></c:set>
		<c:set var="showWeibo" value="false"></c:set>
		<c:set var="showNav" value="false"></c:set>
		<c:set var="showImage" value="false"></c:set>
		<c:set var="showMydoc" value="true"></c:set>
		<c:set var="showCate" value="true"></c:set>
		<c:set var="showNewBlog" value="true"></c:set>
		<c:set var="showFile" value="true"></c:set>
		<c:set var="showLink" value="true"></c:set>
		<c:set var="showShare" value="true"></c:set>
		<%@ include file="/WEB-INF/view/front/aside.jsp"%>

	</div>
</body>
</html>

