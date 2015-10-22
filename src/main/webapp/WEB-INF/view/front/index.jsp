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
<script type="text/javascript">
	var images = [ "${ctxResource}/index/images/01.jpg",
			"${ctxResource}/index/images/02.jpg",
			"${ctxResource}/index/images/03.jpg",
			"${ctxResource}/index/images/04.jpg" ];
	var count = 0;

	function changeImage() {
		if (count == images.length) {
			count = 0;
		}
		document.getElementById("topImage").src = images[count];
		$("#topImage").fadeIn("slow");
		count++;
	}
	setInterval("changeImage()", 4000);
</script>
<body onload="changeImage();">
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
					<p>吸收正能量</p>
				</h3>
				<c:choose>
					<c:when test="${aphorism.image eq null }">
						<c:set var="aphorismPic" value="${defaultPicture }"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="aphorismPic" value="${aphorism.image }"></c:set>
					</c:otherwise>
				</c:choose>
				<img src="${aphorismPic }" alt="" title="" width="315" height="205">
				<div
					style="margin-left: 330px; padding: 5px; font-size: 22px; font-family: Microsoft YaHei;">
					<!-- 时间代码开始 2005-11-11 星期几 -->
					<SCRIPT language=JavaScript>
						var today = new Date();
						function initArray() {
							this.length = initArray.arguments.length
							for (var i = 0; i < this.length; i++)
								this[i + 1] = initArray.arguments[i]
						}
						var d = new initArray("星期日", "星期一", "星期二", "星期三",
								"星期四", "星期五", "星期六");
						document.write("<font color=#0099ff> 今天是：", today
								.getYear() + 1900, "年", today.getMonth() + 1,
								"月", today.getDate(), "日 ",
								d[today.getDay() + 1], "</font><br/>");
					</SCRIPT>
					<!-- 时间代码结束 2005-11-11 星期几 -->
					<span style="font-family: 'Microsoft YaHei'; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;${aphorism.contentNoStyle }</span><br />
					<span style="float: right; font-size: 20px;">——${aphorism.fromPeople }</span>
				</div>
			</div>
			<div class="topblog">
				<h3>
					<p>爱运动 爱生活</p>
				</h3>
				<c:if test="${sportPic eq null }">
					<c:set var="sportPic" value="${defaultPicture }"></c:set>
				</c:if>
				<img src="${sportPic }" alt="" title="" width="315" height="205">
				<div
					style="margin-left: 330px; padding: 5px; font-size: 22px; font-family: Microsoft YaHei;">
					<div
						style="background-color: rgb(254, 254, 254, 0.9); padding: 10px;">
						坚持体育锻炼<br>积极面对生活<br>勇敢挑战困难<br>踏踏实实工作
					</div>
				</div>
			</div>
			<div class="bloglist"></div>
		</div>

		<c:set var="showWeather" value="true"></c:set>
		<c:set var="showWeibo" value="false"></c:set>
		<c:set var="showNav" value="false"></c:set>
		<c:set var="showImage" value="false"></c:set>
		<c:set var="showMydoc" value="true"></c:set>
		<c:set var="showCate" value="false"></c:set>
		<c:set var="showNewBlog" value="true"></c:set>
		<c:set var="showFile" value="false"></c:set>
		<c:set var="showLink" value="true"></c:set>
		<c:set var="showShare" value="true"></c:set>
		<%@ include file="/WEB-INF/view/front/aside.jsp"%>

	</div>
</body>
</html>

