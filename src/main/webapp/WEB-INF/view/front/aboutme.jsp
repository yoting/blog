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
<%-- <script type="text/javascript" src="${ctxResource }/index/js/modernizr.js"></script> --%>
<%-- <script type="text/javascript" src="${ctxResource }/index/js/main.js"></script> --%>
<%-- <script type="text/javascript" src="${ctxResource }/index/js/silder.js"></script> --%>
</head>
<body>
	<div class="blank"></div>

	<div class="article">
		<div class="list-content">
			<div class="topblog">
				<h3>
					<p>推荐文章 New Blog</p>
				</h3>
				<img src="${ctxResource }/index/images/02.jpg" alt="" title=""
					width="315" height="205" id="topImage">
				<ul>
					<c:forEach items="${topBlogList }" var="topBlog">
						<li style="text-align: left; padding-left: 45px;"><a
							href="${topBlog.link }" style="padding: 5px;">${topBlog.title }<span
								style="padding: 5px;">${topBlog.descriptionShort }</span></a>
					</c:forEach>
				</ul>
			</div>
			<div class="topblog">
				<h3>
					<p>个人简介</p>
				</h3>
				<img src="${aboutme.photo }" alt="" title="" width="auto"
					height="auto" id="topImage">
				<div>${aboutme.aboutme }</div>
			</div>
			<div class="bloglist"></div>
		</div>
		
		<c:set var="showWeather" value="true"></c:set>
		<c:set var="showWeibo" value="true"></c:set>
		<c:set var="showNav" value="false"></c:set>
		<c:set var="showImage" value="false"></c:set>
		<c:set var="showMydoc" value="true"></c:set>
		<c:set var="showCate" value="false"></c:set>
		<c:set var="showNewBlog" value="false"></c:set>
		<c:set var="showFile" value="false"></c:set>
		<c:set var="showLink" value="true"></c:set>
		<c:set var="showShare" value="true"></c:set>
		<%@ include file="/WEB-INF/view/front/aside.jsp"%>
	</div>
</body>
</html>

