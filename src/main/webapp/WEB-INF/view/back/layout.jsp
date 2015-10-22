<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
html,body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#content {
	margin: 0 auto;
	padding-bottom: 20px; /*高度等于footer的高度*/
}

#footer {
	position: absolute;
	bottom: 0px;
	width: 100%;
	height: 20px;
	clear: both;
}
</style>
</head>
<body>
	<div id="header">
		<jsp:include page="${headerPath }"></jsp:include>
	</div>
	<div id="content">
		<jsp:include page="${contentPath }"></jsp:include>
	</div>
	<div class="push"></div>
	<div id="footer">
		<jsp:include page="${footerPath }"></jsp:include>
	</div>
</body>