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

<%-- <script type="text/javascript" src="${ctxResource }/index/js/silder.js"></script> --%>
<%-- <script type="text/javascript" src="${ctxResource }/index/js/modernizr.js"></script> --%>
</head>
<body style="height: 100%;">
	<jsp:include page="${headerPath }"></jsp:include>
	<jsp:include page="${contentPath }"></jsp:include>
	<jsp:include page="${footerPath }"></jsp:include>
</body>
</html>

